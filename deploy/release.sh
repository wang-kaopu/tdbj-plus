#!/usr/bin/env bash
set -euo pipefail

release_id="${1:?请提供提交 SHA}"
[[ "$#" -eq 1 ]]
[[ "$release_id" =~ ^[0-9a-f]{40}$ ]]
root=/opt/tdbj-plus
archive="$root/incoming/$release_id.tar.gz"
previous_release=""

test -s "$archive"
test -s "$root/shared/.env"
test -s "$root/shared/shardingsphere.yaml"
umask 022
install -d "$root/releases" "$root/shared/sql" "$root/shared/images/blogs" "$root/logs"
release_dir="$(mktemp -d "$root/releases/$release_id.XXXXXX")"
echo "解压发布包：$release_id"
tar --no-same-owner --no-same-permissions -xzf "$archive" -C "$release_dir"
chmod 755 "$release_dir"
test -s "$release_dir/app.jar"
test -s "$release_dir/web/index.html"
test -s "$release_dir/docker-compose.yml"
cp "$release_dir/docker-compose.yml" "$root/shared/docker-compose.yml"
cp -a "$release_dir/sql/." "$root/shared/sql/"

echo "检查并启动 Compose 服务"
docker compose --env-file "$root/shared/.env" --project-directory "$root/shared" -f "$root/shared/docker-compose.yml" up -d --wait --wait-timeout 180
if [[ -L "$root/current" ]]; then
    previous_release="$(readlink "$root/current")"
fi
ln -sfn "$release_dir" "$root/current.next"
mv -Tf "$root/current.next" "$root/current"
echo "重启 tdbj.service 并检查 /actuator/health"
if ! /usr/bin/systemctl restart tdbj.service || ! curl --fail --silent --show-error --retry 30 --retry-delay 2 --retry-all-errors http://127.0.0.1:8085/actuator/health; then
    echo "发布健康检查失败，恢复上一个发布目录" >&2
    if [[ -n "$previous_release" ]]; then
        ln -sfn "$previous_release" "$root/current.next"
        mv -Tf "$root/current.next" "$root/current"
        /usr/bin/systemctl restart tdbj.service
        curl --fail --silent --show-error --retry 30 --retry-delay 2 --retry-all-errors http://127.0.0.1:8085/actuator/health
    else
        /usr/bin/systemctl stop tdbj.service
        rm -f "$root/current"
    fi
    exit 1
fi
rm -f "$archive"
