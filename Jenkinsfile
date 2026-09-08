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
                bat 'docker build -t simple-python-pyinstaller-app .'
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                bat 'docker run --rm simple-python-pyinstaller-app'
            }
        }
    }
}