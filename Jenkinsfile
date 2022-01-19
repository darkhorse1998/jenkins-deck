pipeline {
	environment {
		registry = "hkalita1998/kong-deck"
		registryCredential = 'Dockerhub'
		dockerImage = ''
	}
	agent any
		stages {
			stage('Building our image') {
				steps{
					script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
					}
				}
			}
			stage('Deploy our image') {
				steps{
					script {
						docker.withRegistry( '', registryCredential ) {
						dockerImage.push()
						}
					}
				}
			}
			stage('Ping') {
				steps {
					sh 'docker run hkalita1998/kong-deck:$BUILD_NUMBER --kong-addr http://localhost:8001 ping'
				}
			}
			stage('Validate') {
				steps {
					sh 'docker run hkalita1998/kong-deck:$BUILD_NUMBER --kong-addr http://192.168.29.112:8001 validate'
				}
			}
			stage('Diff') {
				steps {
					sh 'docker run hkalita1998/kong-deck:$BUILD_NUMBER --kong-addr http://192.168.29.112:8001 diff'
				}
			}
			stage('Sync') {
				steps {
					sh 'docker run hkalita1998/kong-deck:$BUILD_NUMBER --kong-addr http://192.168.29.112:8001 sync'
				}
			}
			stage('Cleaning up') {
				steps{
					sh 'docker container prune --force --filter="label=maintainer=hkalita1998/kong-deck"'
					sh 'docker rmi $registry:$BUILD_NUMBER'
				}
			}
}
}