pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/darkhorse1998/jenkins-deck.git'
            }
        }
        stage('Ping') {
            steps {
                bat 'deck ping'
            }
        }
        stage('Validate') {
            steps {
                bat 'deck validate'
            }
        }
        stage('Diff') {
            steps {
                bat 'deck diff'
            }
        }
        stage('Sync') {
            steps {
                bat 'deck sync'
            }
        }
        
        
    }
}
