pipeline {
    agent { label 'tdbj-local' }

    options {
        skipDefaultCheckout(true)
        disableConcurrentBuilds()
        timeout(time: 45, unit: 'MINUTES')
    }

    stages {
        stage('Checkout') {
            steps {
                sh 'test "$(id -u)" -eq 0'
                checkout scm
                script {
                    env.RUNNER_TEMP = pwd(tmp: true)
                }
                sh 'test "$(git rev-parse HEAD)" = "$GIT_COMMIT"'
            }
        }

        stage('Build Backend') {
            steps {
                sh 'mvn -B -ntp -DskipTests package'
            }
        }

        stage('Build Frontend') {
            steps {
                dir('tdbj-vue3') {
                    sh 'npm ci'
                    sh 'npm run check'
                }
            }
        }

        stage('Package') {
            steps {
                sh 'bash deploy/package.sh'
                sh 'test -s "$RUNNER_TEMP/tdbj-release.tar.gz"'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    set -eu
                    echo "检查 root 安装的发布脚本"
                    cmp deploy/release.sh /usr/local/sbin/tdbj-release
                    echo "将发布包交付到本机 incoming 目录"
                    install -m 0644 "$RUNNER_TEMP/tdbj-release.tar.gz" "/opt/tdbj-plus/incoming/$GIT_COMMIT.tar.gz"
                    /usr/local/sbin/tdbj-release "$GIT_COMMIT"
                '''
            }
        }

        stage('Health Check') {
            steps {
                sh 'curl --fail --silent --show-error http://127.0.0.1:8085/actuator/health'
                sh 'curl --fail --silent --show-error --output /dev/null http://127.0.0.1/'
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
            deleteDir()
        }
    }
}
