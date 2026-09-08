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
    }
}