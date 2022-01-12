pipeline {
    agent { dockerfile true }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/darkhorse1998/jenkins-deck.git'
            }
        }
        stage('Ping') {
            steps {
                sh 'docker run hkalita1998/kong-deck --kong-addr http://192.168.29.112:8001 ping'
            }
        }
        stage('Validate') {
            steps {
                sh 'docker run hkalita1998/kong-deck --kong-addr http://192.168.29.112:8001 validate'
            }
        }
        stage('Diff') {
            steps {
                sh 'docker run hkalita1998/kong-deck --kong-addr http://192.168.29.112:8001 diff'
            }
        }
        stage('Sync') {
            steps {
                sh 'docker run hkalita1998/kong-deck --kong-addr http://192.168.29.112:8001 sync'
            }
        }
        stage('Clean Up') {
            steps {
                sh 'docker container prune --force --filter="label=maintainer=hkalita1998/kong-deck"'
            }
        }
        
        
    }
}