#!/usr/bin/env bash
set -euo pipefail

if [[ "$#" -ne 0 || "$(id -u)" -ne 0 ]]; then
    echo '请以 root 身份运行 setup-server.sh，且不要传入参数' >&2
    exit 1
fi

repo=/opt/git/tdbj-plus.git
install -d -o root -g root -m 0755 /opt/git
if [[ -e "$repo" ]]; then
    if [[ ! -d "$repo" || "$(git --git-dir="$repo" rev-parse --is-bare-repository 2>/dev/null)" != true ]]; then
        echo "$repo 已存在且不是可用的 bare repository" >&2
        exit 1
    fi
else
    git init --bare "$repo"
fi

git --git-dir="$repo" config receive.denyNonFastForwards true
git --git-dir="$repo" config receive.denyDeletes true
echo "服务器 Git 仓库已准备：$repo"
