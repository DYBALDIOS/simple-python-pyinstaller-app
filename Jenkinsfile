pipeline {
    agent any

    stages {
        stage('Clonar repositorio') {
            steps {
                checkout scm
            }
        }

        stage('Construir imagen Docker') {
            steps {
                sh 'docker build -t simple-python-pyinstaller-app .'
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                sh 'printf "5\n3\n" | docker run -i --rm simple-python-pyinstaller-app'
            }
        }

        stage('Deliver') {
            steps {
                sh '''
                    mkdir -p deliver

                    CONTAINER=$(docker create simple-python-pyinstaller-app)

                    docker cp "$CONTAINER:/app/dist/simple-python-pyinstaller-app" deliver/simple-python-pyinstaller-app

                    docker rm "$CONTAINER"

                    chmod +x deliver/simple-python-pyinstaller-app
                '''
            }

            post {
                success {
                    archiveArtifacts artifacts: 'deliver/simple-python-pyinstaller-app', fingerprint: true
                }
            }
        }
    }
}