pipeline {
    agent { label 'tdbj-local' }

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
        timeout(time: 45, unit: 'MINUTES')
    }

    parameters {
        string(name: 'REVISION', defaultValue: '', description: '本次推送的完整 40 位 commit SHA；手动构建留空时使用服务器本地 master')
    }

    stages {
        stage('Checkout') {
            steps {
                sh 'test "$(id -u)" -eq 0'
                script {
                    env.RELEASE_REVISION = params.REVISION?.trim() ?: sh(script: 'git --git-dir=/opt/git/tdbj-plus.git rev-parse refs/heads/master^{commit}', returnStdout: true).trim()
                    env.RUNNER_TEMP = pwd(tmp: true)
                }
                sh '''
                    set -eu
                    echo "$RELEASE_REVISION" | grep -Eq '^[0-9a-f]{40}$'
                    git --git-dir=/opt/git/tdbj-plus.git cat-file -e "$RELEASE_REVISION^{commit}"
                    echo "构建提交：$RELEASE_REVISION"
                    if [ ! -d .git ]; then git init; fi
                    if git remote get-url ecs >/dev/null 2>&1; then
                        git remote set-url ecs file:///opt/git/tdbj-plus.git
                    else
                        git remote add ecs file:///opt/git/tdbj-plus.git
                    fi
                    git fetch --no-tags ecs +refs/heads/master:refs/remotes/ecs/master
                    git merge-base --is-ancestor "$RELEASE_REVISION" refs/remotes/ecs/master
                    git checkout --force --detach "$RELEASE_REVISION"
                    git clean -fd
                    test "$(git rev-parse HEAD)" = "$RELEASE_REVISION"
                '''
            }
        }

        stage('Build Backend') {
            steps {
                sh '''
                    set -eu
                    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
                    export PATH="$JAVA_HOME/bin:$PATH"
                    test -x "$JAVA_HOME/bin/java"
                    cache_dir=/var/lib/jenkins/tdbj-local
                    install -d -m 0755 "$cache_dir"
                    last_success="$cache_dir/last-successful-revision"
                    cache_revision="$cache_dir/maven-cache-revision"
                    dirty="$cache_dir/maven-cache-dirty"
                    build_goal='clean package'
                    if [ -s "$last_success" ] && [ -s "$cache_revision" ] && [ ! -e "$dirty" ] && [ -s tdbj-core-service/target/app.jar ] && [ "$(cat "$last_success")" = "$(cat "$cache_revision")" ]; then
                        previous="$(cat "$last_success")"
                        if git cat-file -e "$previous^{commit}" && git diff --quiet "$previous" "$RELEASE_REVISION" -- pom.xml .mvn tdbj-common tdbj-sharding tdbj-core-service tdbj-redisson-framework tdbj-redis-tool-framework tdbj-id-generator-framework tdbj-mq-framework tdbj-parameter; then
                            build_goal=package
                        fi
                    fi
                    touch "$dirty"
                    echo "Maven 构建：$build_goal；提交：$RELEASE_REVISION"
                    mvn -B -ntp -DskipTests $build_goal
                    test -s tdbj-core-service/target/app.jar
                '''
            }
        }

        stage('Build Frontend') {
            steps {
                dir('tdbj-vue3') {
                    sh '''
                        set -eu
                        dependency_hash="$(sha256sum package.json package-lock.json | sha256sum | cut -d ' ' -f 1)"
                        cache_hash=node_modules/.tdbj-dependencies.sha256
                        if [ ! -s "$cache_hash" ] || [ "$(cat "$cache_hash")" != "$dependency_hash" ] || [ ! -x node_modules/.bin/vite ] || [ ! -s node_modules/vite/package.json ] || [ ! -s node_modules/vue/package.json ]; then
                            echo '安装前端依赖'
                            npm ci --cache /root/.npm --prefer-offline --no-audit --no-fund
                            echo "$dependency_hash" > "$cache_hash"
                        else
                            echo '复用现有 node_modules'
                        fi
                        echo "构建前端：$RELEASE_REVISION"
                        npm run check
                        test -s dist/index.html
                    '''
                }
            }
        }

        stage('Package') {
            steps {
                sh '''
                    set -eu
                    echo "生成发布包：$RELEASE_REVISION"
                    bash deploy/package.sh
                    test -s "$RUNNER_TEMP/tdbj-release.tar.gz"
                    tar -tzf "$RUNNER_TEMP/tdbj-release.tar.gz" >/dev/null
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    set -eu
                    archive="/opt/tdbj-plus/incoming/$RELEASE_REVISION.tar.gz"
                    partial="$archive.part.$BUILD_NUMBER"
                    script_tmp="$(mktemp /usr/local/sbin/.tdbj-release.XXXXXX)"
                    trap 'rm -f "$partial" "$script_tmp"' EXIT
                    echo "交付发布包：$RELEASE_REVISION"
                    install -m 0644 "$RUNNER_TEMP/tdbj-release.tar.gz" "$partial"
                    tar -tzf "$partial" >/dev/null
                    mv -f "$partial" "$archive"
                    echo '安装当前提交的发布脚本'
                    install -m 0755 -o root -g root deploy/release.sh "$script_tmp"
                    bash -n "$script_tmp"
                    mv -f "$script_tmp" /usr/local/sbin/tdbj-release
                    /usr/local/sbin/tdbj-release "$RELEASE_REVISION"
                '''
            }
        }

        stage('Health Check') {
            steps {
                sh '''
                    set -eu
                    echo "检查服务：$RELEASE_REVISION"
                    curl --fail --silent --show-error http://127.0.0.1:8085/actuator/health
                    curl --fail --silent --show-error --output /dev/null http://127.0.0.1/
                '''
            }
        }
    }

    post {
        always {
            script {
                if (env.RUNNER_TEMP) {
                    sh 'rm -f "$RUNNER_TEMP/tdbj-release.tar.gz"'
                }
            }
        }
        success {
            sh '''
                set -eu
                cache_dir=/var/lib/jenkins/tdbj-local
                echo "$RELEASE_REVISION" > "$cache_dir/last-successful-revision.$BUILD_NUMBER"
                echo "$RELEASE_REVISION" > "$cache_dir/maven-cache-revision.$BUILD_NUMBER"
                mv -f "$cache_dir/last-successful-revision.$BUILD_NUMBER" "$cache_dir/last-successful-revision"
                mv -f "$cache_dir/maven-cache-revision.$BUILD_NUMBER" "$cache_dir/maven-cache-revision"
                rm -f "$cache_dir/maven-cache-dirty"
                echo "发布成功：$RELEASE_REVISION"
            '''
        }
    }
}
