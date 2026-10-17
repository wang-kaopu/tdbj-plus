# Jenkins 自动发布

Jenkins 在云服务器本机以 root 身份运行，轮询 GitHub `master`，构建 Java 后端和 Vue 前端，调用 `deploy/package.sh` 生成发布包，再调用 root 安装的 `deploy/release.sh` 完成发布。发布脚本负责 Compose、`current` 切换、`tdbj.service` 重启与 `/actuator/health` 检查。服务启动或健康检查失败时，脚本恢复上一个发布目录并使构建失败。Pipeline 最后再次检查健康接口并清理 workspace。

GitHub Actions 保留手动构建和下载发布包的功能。Jenkins 的 Poll SCM 需要云服务器能够持续访问 `github.com`；完成服务器出站网络配置后，`master` 提交由 Jenkins 自动部署。

## 快速重启当前版本

在云服务器上执行下面的命令，重启 Java 服务并确认健康接口恢复：

```bash
systemctl restart tdbj.service
curl --fail --silent --show-error --retry 30 --retry-delay 2 --retry-all-errors http://127.0.0.1:8085/actuator/health
```

## 手动发布新提交

提交并推送改动后，在本机当前仓库执行下面的命令。`ecs` 是现有的 root SSH 目标。服务器继续使用 `deploy/release.sh` 管理发布目录、Compose、systemd 和健康检查。

```bash
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk17.jdk/Contents/Home mvn -B -ntp -DskipTests package
cd tdbj-vue3
nvm use 22
npm ci
npm run check
cd ..
release_id="$(git rev-parse HEAD)"
test -z "$(git status --porcelain)"
RUNNER_TEMP="$PWD/tdbj-core-service/target" bash deploy/package.sh
scp deploy/release.sh ecs:/root/tdbj-release.sh
ssh ecs 'install -m 0755 -o root -g root /root/tdbj-release.sh /usr/local/sbin/tdbj-release'
scp tdbj-core-service/target/tdbj-release.tar.gz "ecs:/opt/tdbj-plus/incoming/$release_id.tar.gz.part"
ssh ecs "gzip -t /opt/tdbj-plus/incoming/$release_id.tar.gz.part"
ssh ecs "mv /opt/tdbj-plus/incoming/$release_id.tar.gz.part /opt/tdbj-plus/incoming/$release_id.tar.gz"
ssh ecs "/usr/local/sbin/tdbj-release $release_id"
```

## 服务器准备

服务器需要 Java 17 JDK、Maven、Node.js 22、npm、Docker Engine 与 Compose 插件、systemd、Nginx、curl、Git 和 Jenkins。Ubuntu 可以安装 Java、Maven、Git、Nginx 和 curl；Node.js 22 使用服务器现有的软件安装方式提供给 root：

```bash
apt update
apt install -y openjdk-17-jdk maven git nginx curl
java -version
mvn -version
node --version
npm --version
docker compose version
```

确认 Java 的主版本为 17，Node.js 的主版本为 22。Jenkins 服务需要继承可直接运行这些命令的 `PATH`。

检查 Jenkins 的 systemd 配置，再通过 `systemctl edit jenkins` 设置服务身份：

```bash
systemctl cat jenkins
systemctl edit jenkins
```

编辑器中填写：

```ini
[Service]
User=root
Group=root
```

保存后执行：

```bash
systemctl daemon-reload
systemctl restart jenkins
systemctl show jenkins -p User -p Group
test "$(systemctl show jenkins -p User --value)" = root
test "$(systemctl show jenkins -p Group --value)" = root
rm -f /etc/sudoers.d/tdbj-jenkins
```

Jenkins 的监听地址继续使用现有 `127.0.0.1:8080`，页面通过原有 SSH 隧道访问。Pipeline 在 Checkout 阶段检查当前执行身份；身份不为 root 时立即失败。

创建由 root 管理的发布目录。已有共享配置和数据目录继续使用当前内容：

```bash
install -d -o root -g root -m 0755 /opt/tdbj-plus /opt/tdbj-plus/incoming /opt/tdbj-plus/releases /opt/tdbj-plus/shared /opt/tdbj-plus/logs
```

服务器首次配置时，把 `deploy/compose.env.example` 复制为 `/opt/tdbj-plus/shared/.env` 并填写 `MYSQL_ROOT_PASSWORD`；把 `tdbj-core-service/src/main/resources/shardingsphere.yaml` 复制为 `/opt/tdbj-plus/shared/shardingsphere.yaml` 并填写现有数据源密码。已有文件不覆盖。两个文件由 root 持有，权限为 `600`：

```bash
chown root:root /opt/tdbj-plus/shared/.env /opt/tdbj-plus/shared/shardingsphere.yaml
chmod 600 /opt/tdbj-plus/shared/.env /opt/tdbj-plus/shared/shardingsphere.yaml
```

`deploy/release.sh` 必须与 Jenkins 构建的提交相同。首次推送前，可在本地当前仓库执行下面的命令；`SERVER_SSH_TARGET` 填写已经用于登录服务器的 root SSH 目标。该传输仅用于服务器准备，Jenkins 自动部署在本机执行：

```bash
scp deploy/release.sh "$SERVER_SSH_TARGET:/root/tdbj-release.sh"
```

随后在服务器上安装脚本：

```bash
install -m 0755 -o root -g root /root/tdbj-release.sh /usr/local/sbin/tdbj-release
```

如服务器需要安装现有 systemd、journald 和 Nginx 配置，可在提交推送后克隆公开仓库，再运行以下命令：

```bash
git clone --branch master --single-branch https://github.com/wang-kaopu/tdbj-plus.git /opt/tdbj-plus-source
install -m 0644 -o root -g root /opt/tdbj-plus-source/deploy/systemd/tdbj.service /etc/systemd/system/tdbj.service
systemctl daemon-reload
systemctl enable --now docker nginx
systemctl enable tdbj.service
install -d /etc/systemd/journald.conf.d
install -m 0644 /opt/tdbj-plus-source/deploy/systemd/journald.conf.d/90-tdbj.conf /etc/systemd/journald.conf.d/90-tdbj.conf
systemctl restart systemd-journald.service
journalctl --flush
install -m 0644 /opt/tdbj-plus-source/deploy/nginx/tdbj.conf /etc/nginx/sites-available/tdbj.conf
ln -sfn /etc/nginx/sites-available/tdbj.conf /etc/nginx/sites-enabled/tdbj.conf
nginx -t
systemctl reload nginx
```

Nginx 配置使用 80 端口的默认站点；已有默认站点占用该端口时，调整站点启用状态。`tdbj.service` 以 root 运行 Java，从 `/opt/tdbj-plus/current/app.jar` 启动，并使用服务器保存的 ShardingSphere 配置与上传图片目录。数据库初始化 SQL 随发布包复制到 `shared/sql`；现有数据库内容保存在 Docker 命名卷中。

发布脚本有变更时，在 Jenkins 构建前安装对应提交的脚本。Pipeline 用 `cmp` 检查 `/usr/local/sbin/tdbj-release` 与当前提交中的 `deploy/release.sh` 是否相同；检查失败时停止部署。服务器源码目录已包含对应提交时，可执行：

```bash
git -C /opt/tdbj-plus-source pull --ff-only origin master
install -m 0755 -o root -g root /opt/tdbj-plus-source/deploy/release.sh /usr/local/sbin/tdbj-release
```

## Jenkins 页面配置

1. 在 **Manage Jenkins → Nodes** 中给本机节点添加标签 `tdbj-local`，设置一个可用 executor，并确认该节点以 root 身份运行。
2. 选择 **New Item → Pipeline**，输入 Job 名称，例如 `tdbj-plus-master-deploy`。
3. 在 **General** 中勾选 **Do not allow concurrent builds**。`Jenkinsfile` 也设置了 `disableConcurrentBuilds()`。
4. 在 **Build Triggers** 中勾选 **Poll SCM**，Schedule 填写 `* * * * *`。Git 插件每分钟检查一次远端 `master`。
5. 在 **Pipeline** 中选择 **Pipeline script from SCM → Git**，Repository URL 填写 `https://github.com/wang-kaopu/tdbj-plus.git`，Branches to build 填写 `*/master`，Script Path 填写 `Jenkinsfile`。公开仓库可以留空 Credentials；已有可用 GitHub Credentials 时也可以沿用。
6. 保存 Job。首次点击 **Build Now**。后续提交由 Poll SCM 触发；构建失败时后续阶段停止，Job 显示 **FAILURE**，错误内容显示在 **Console Output**。

Pipeline 使用 Git 和 Pipeline 插件。已有 Timestamper、Workspace Cleanup 等插件可以继续保留；workspace 清理由内置 `deleteDir()` 完成。

## 验证发布

在本地当前仓库执行：

```bash
git add .
git commit -m "ci: 增加 Jenkins 自动部署流程"
git push origin master
```

在 Jenkins Job 的 **Build History** 打开新构建，确认 **Checkout → Build Backend → Build Frontend → Package → Deploy → Health Check** 全部成功，最终结果为 **SUCCESS**。Console Output 应显示 Maven 构建、`npm run check`、Compose 启动、服务重启及健康接口响应。

在服务器上检查当前发布、服务与健康接口：

```bash
readlink /opt/tdbj-plus/current
systemctl status tdbj.service
curl --fail --silent --show-error http://127.0.0.1:8085/actuator/health
curl --fail --silent --show-error --output /dev/null http://127.0.0.1/
journalctl -u tdbj.service -n 100 --no-pager
docker compose --env-file /opt/tdbj-plus/shared/.env --project-directory /opt/tdbj-plus/shared -f /opt/tdbj-plus/shared/docker-compose.yml ps
```
