pipeline {
  environment {
    registry = "bhalchandra/apache-test"
    registryCredential = 'ffd885e7-a800-4a0c-a0bd-d1b39b8a110b'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/bhalchandra11/devops-assignment.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
    stage('cleanup') {
        // Recursively delete all files and folders in the workspace
        // using the built-in pipeline command
        deleteDir()
    }
  }
}