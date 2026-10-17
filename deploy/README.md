# Jenkins 自动发布

本地执行 `git push ecs master` 后，ECS 上的 `/opt/git/tdbj-plus.git` 接收提交，`post-receive` Hook 将这次推送的完整 commit SHA 作为 `REVISION` 参数提交给本机 Jenkins 的 `tdbj-local` Job。Jenkins 从该本地仓库读取 `Jenkinsfile` 和源码，依次构建 Java、构建 Vue、打包、发布，并检查 `/actuator/health`。`origin` 继续用于 GitHub 代码托管；Jenkins 自动发布不需要访问 GitHub。

服务器现有 `/opt/tdbj-plus/shared`、Docker 数据卷、图片目录、Nginx 和 `tdbj.service` 保持原有配置。`deploy/release.sh` 负责 Compose 检查、`current` 切换、服务重启、健康检查和失败后的版本恢复。Jenkins 以 root 身份运行，发布目录仍由 root 管理。

## 当前服务器要求

服务器需要 Git、Java 17、Maven、Node.js 22、npm、Docker Engine 与 Compose 插件、curl、systemd 和 Jenkins。Jenkins 本机节点标签为 `tdbj-local`，保留单个 executor；Job 禁止并发构建。Jenkins 继续监听 `127.0.0.1:8080`，通过已有 SSH 隧道访问页面。后端依赖保存在 `/root/.m2/repository`，前端依赖保存在 `/root/.npm`，服务器建议保留当前约 8 GiB 内存配置。

初始化前可以检查实际环境：

```bash
ssh ecs 'systemctl show jenkins -p User -p Group; ss -ltnp | grep :8080; nproc; free -h; git --version; mvn -version; node --version; npm --version'
ssh ecs 'test -s /opt/tdbj-plus/shared/.env && test -s /opt/tdbj-plus/shared/shardingsphere.yaml && systemctl is-active tdbj.service'
```

## 初始化服务器 Git 仓库

在本地仓库执行：

```bash
bash deploy/setup-ecs-git.sh
git remote -v
```

脚本使用现有 SSH 别名 `ecs`，创建 `/opt/git/tdbj-plus.git`，设置 `receive.denyNonFastForwards=true` 和 `receive.denyDeletes=true`，安装 `deploy/git/post-receive`，并添加本地 `ecs` remote。已有 bare repository 的提交会保留；仓库管理的 Hook 会以原子改名方式更新，服务器存在其他 Hook 时脚本会停止并提示检查。重复执行不会改动已有相同 Hook。`origin` 地址不会被修改。

## 配置 Jenkins 认证与 Token

当前服务器的 Jenkins 使用 `SecurityRealm$None` 和 `AuthorizationStrategy$Unsecured`，还没有可供 Hook 使用的用户 API Token。通过 SSH 隧道打开 Jenkins 页面后，完成以下设置：

1. 在 **Manage Jenkins → Plugins** 安装 **Matrix Authorization Strategy** 插件。
2. 在 **Manage Jenkins → Security** 选择 **Jenkins’ own user database**。临时允许用户注册，授权方式暂用 **Logged-in users can do anything**，保存后注册管理员账户。
3. 用管理员账户登录，在 **Manage Jenkins → Users** 创建专用账户 `tdbj-trigger`。随后在 **Manage Jenkins → Security** 关闭用户自行注册，改选 **Project-based Matrix Authorization Strategy**。管理员账户授予 **Overall/Administer**；`tdbj-trigger` 在全局仅授予 **Overall/Read**；匿名用户不授予权限。
4. 打开 `tdbj-local` 的 **Configure → Enable project-based security**，给 `tdbj-trigger` 授予这个 Job 的 **Job/Read** 和 **Job/Build**。
5. 打开 `tdbj-trigger` 的用户配置页面，在 **API Token** 中生成 Token，复制后妥善保存。保持 **CSRF Protection** 开启。使用用户名与 API Token 的 Basic Authentication 发起 POST 时，Jenkins 接受请求且无需另取 crumb。

在 ECS 上由 root 创建认证文件。把下面示例中的占位内容替换为实际用户名和 Token；不要把 Token 写入终端历史、Git 仓库或 Jenkinsfile。已有认证文件会保留原有内容：

```bash
install -d -o root -g root -m 0700 /etc/tdbj-plus
if [ ! -e /etc/tdbj-plus/jenkins-trigger.env ]; then install -o root -g root -m 0600 /dev/null /etc/tdbj-plus/jenkins-trigger.env; fi
vi /etc/tdbj-plus/jenkins-trigger.env
```

在编辑器中填写：

```bash
JENKINS_USER=tdbj-trigger
JENKINS_API_TOKEN=填写真实的API_Token
JENKINS_URL=http://127.0.0.1:8080
```

保存后检查权限，不显示文件内容：

```bash
chown root:root /etc/tdbj-plus/jenkins-trigger.env
chmod 600 /etc/tdbj-plus/jenkins-trigger.env
stat -c '%U:%G %a %n' /etc/tdbj-plus/jenkins-trigger.env
```

Hook 仅通过本机 Jenkins HTTP API 发送 `POST /job/tdbj-local/buildWithParameters`，认证信息从这个 root 专用文件读取。请求失败最多尝试三次；HTTP 400、401、403、404 立即停止。日志保存在 `/var/log/tdbj-plus-jenkins-trigger.log`，包含时间、提交 SHA、HTTP 状态码和请求结果，不包含 Token。Git 的 `post-receive` 在引用更新后运行；即使 Hook 报错，提交也可能已经进入服务器仓库，须按日志处理。

## 配置现有 Jenkins Job

保留现有 `tdbj-local` Pipeline Job，在页面中确认：

1. **General → Do not allow concurrent builds** 已开启。
2. **Build Triggers → Poll SCM** 已关闭。
3. **Pipeline → Definition** 为 **Pipeline script from SCM**，**SCM** 为 **Git**。
4. **Repository URL** 为 `file:///opt/git/tdbj-plus.git`，**Branches to build** 为 `*/master`，**Script Path** 为 `Jenkinsfile`，**Lightweight checkout** 保持开启。
5. **This project is parameterized** 包含字符串参数 `REVISION`，默认值为空。手动运行且留空时使用服务器本地 `master` 当前提交。

仓库提供 `deploy/git/configure-jenkins.groovy`，管理员也可以在 Jenkins **Script Console** 执行该脚本配置现有 Job。脚本只接受当前 GitHub 地址或目标本地地址，并保留 Job 中除 Poll SCM 之外的其他触发器。首次推送前完成配置，确保参数化构建接口可以接收 `REVISION`。

## 首次推送与日常发布

完成 Token 和 Job 配置后，在本地仓库提交代码，并确认工作区没有未提交的目标改动。首次推送：

```bash
git push -u ecs master
```

以后发布：

```bash
git push ecs master
```

Jenkins 的 Checkout 阶段校验 `REVISION` 为完整 40 位 SHA，确认该提交存在于本地 bare repository 的 `master` 历史中，再将持久化 workspace 切换到指定提交。排队期间即使收到后续推送，当前构建仍使用自己的 `REVISION`。工作区保留忽略的 `target/`、`node_modules/` 和 `dist/`；未跟踪且未忽略的文件会被清理。

后端模块有变化、缺少可用缓存或上次构建没有完整成功时运行 `mvn -B -ntp -DskipTests clean package`。仅前端、文档或部署文件变化时，可以使用保留的 Maven 构建结果运行 `mvn -B -ntp -DskipTests package`。上一成功发布的 SHA 保存在 `/var/lib/jenkins/tdbj-local/last-successful-revision`，仅在构建、发布和健康检查全部成功后更新。

前端依赖文件未变化且 `node_modules` 完整时跳过 `npm ci`；否则执行 `npm ci --cache /root/.npm --prefer-offline --no-audit --no-fund`。每次都执行 `npm run check`，生成当前提交的 `dist`。`deploy/package.sh` 生成发布包后，Jenkins 以 `.part` 文件复制到 `/opt/tdbj-plus/incoming/`，验证压缩包，再原子改名为 `<REVISION>.tar.gz`。Jenkins 原子安装当前提交的 `deploy/release.sh` 到 `/usr/local/sbin/tdbj-release`，然后调用它发布。

## 查看结果和排查故障

在 `tdbj-local` 的 **Build History → Console Output** 中确认 **Checkout、Build Backend、Build Frontend、Package、Deploy、Health Check** 阶段全部完成，最终显示 **SUCCESS**。日志里的“构建提交”“交付发布包”和“发布成功”应与 `git rev-parse HEAD` 完全一致。构建失败时后续发布阶段停止；发布脚本检查服务失败时恢复上一个 `current` 版本。

在 ECS 上检查发布：

```bash
git --git-dir=/opt/git/tdbj-plus.git rev-parse refs/heads/master
readlink /opt/tdbj-plus/current
systemctl is-active tdbj.service
curl --fail --silent --show-error http://127.0.0.1:8085/actuator/health
curl --fail --silent --show-error --output /dev/null http://127.0.0.1/
tail -30 /var/log/tdbj-plus-jenkins-trigger.log
```

如果推送终端显示 Hook 请求失败，检查 Hook 日志、认证文件权限、Jenkins 用户权限和 Job 参数。此时仓库的 `master` 可能已经更新；修复后可以在 Jenkins 页面使用 **Build with Parameters**，把失败提示中的完整 SHA 填入 `REVISION`，重新构建指定提交。如果构建失败，查看该次 Console Output 中的具体阶段；发布阶段失败时检查 `journalctl -u tdbj.service -n 100 --no-pager` 和 `docker compose --env-file /opt/tdbj-plus/shared/.env --project-directory /opt/tdbj-plus/shared -f /opt/tdbj-plus/shared/docker-compose.yml ps`。
