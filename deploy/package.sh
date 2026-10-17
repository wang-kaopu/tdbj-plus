#!/usr/bin/env bash
set -euo pipefail

: "${RUNNER_TEMP:?请设置发布包输出目录 RUNNER_TEMP}"
install -d "$RUNNER_TEMP"
release_dir="$(mktemp -d "$RUNNER_TEMP/tdbj-release.XXXXXX")"
trap 'rm -rf "$release_dir"' EXIT
install -d "$release_dir/web/src/assets"
test -s tdbj-core-service/target/app.jar
test -s tdbj-vue3/dist/index.html
cp tdbj-core-service/target/app.jar "$release_dir/app.jar"
cp -a tdbj-vue3/dist/. "$release_dir/web/"
# 页面中仍有 /src/assets 路径，发布时一并提供这些静态文件。
cp -a tdbj-vue3/src/assets/. "$release_dir/web/src/assets/"
cp docker-compose.yml "$release_dir/docker-compose.yml"
cp -a sql "$release_dir/sql"
tar -C "$release_dir" -czf "$RUNNER_TEMP/tdbj-release.tar.gz" .
