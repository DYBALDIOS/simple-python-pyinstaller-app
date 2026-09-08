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
                sh 'docker run --rm simple-python-pyinstaller-app'
            }
        }
    }
}