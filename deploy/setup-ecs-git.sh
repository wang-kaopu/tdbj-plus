#!/usr/bin/env bash
set -euo pipefail

target="${1:-ecs}"
if [[ "$#" -gt 1 || ! "$target" =~ ^[A-Za-z0-9][A-Za-z0-9._-]*$ ]]; then
    echo '用法：bash deploy/setup-ecs-git.sh [SSH别名]，默认使用 ecs' >&2
    exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ssh -o BatchMode=yes "$target" 'bash -s' < "$repo_root/deploy/git/setup-server.sh"

hook=/opt/git/tdbj-plus.git/hooks/post-receive
local_hash="$(git hash-object "$repo_root/deploy/git/post-receive")"
if ssh -o BatchMode=yes "$target" "test -e '$hook'"; then
    remote_hash="$(ssh -o BatchMode=yes "$target" "git hash-object '$hook'")"
    if [[ "$local_hash" != "$remote_hash" ]]; then
        if ! ssh -o BatchMode=yes "$target" "head -n 2 '$hook' | grep -Fqx '# tdbj-plus managed post-receive hook'"; then
            echo "服务器已有其他内容的 $hook；请检查现有 Hook 后再安装" >&2
            exit 1
        fi
    else
        ssh -o BatchMode=yes "$target" "chown root:root '$hook' && chmod 0755 '$hook'"
        echo '现有 post-receive Hook 与仓库版本一致'
        remote_hash="$local_hash"
    fi
fi

if [[ "${remote_hash:-}" != "$local_hash" ]]; then
    remote_temp="/opt/git/tdbj-plus.git/hooks/post-receive.$$.new"
    scp -q "$repo_root/deploy/git/post-receive" "$target:$remote_temp"
    ssh -o BatchMode=yes "$target" "chown root:root '$remote_temp' && chmod 0755 '$remote_temp' && mv -T '$remote_temp' '$hook'"
    echo 'post-receive Hook 已安装'
fi

if git -C "$repo_root" remote get-url ecs >/dev/null 2>&1; then
    current_url="$(git -C "$repo_root" remote get-url ecs)"
    if [[ "$current_url" != "${target}:/opt/git/tdbj-plus.git" ]]; then
        echo "本地 ecs remote 已指向 $current_url；请检查后调整" >&2
        exit 1
    fi
else
    git -C "$repo_root" remote add ecs "${target}:/opt/git/tdbj-plus.git"
fi
echo '本地 ecs remote 已准备；origin 保持原样'
