pipeline {
  agent {
    label 'upgrad-project'
  }
  stages {
    stage('Git Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      parallel {
        stage('Build Docker Image') {
          steps {
            sh 'sudo docker build . -t 339837189061.dkr.ecr.us-east-1.amazonaws.com/c3-courseprojec:${BUILD_NUMBER}'
            sh 'sudo docker push 339837189061.dkr.ecr.us-east-1.amazonaws.com/c3-courseprojec:${BUILD_NUMBER}'
          }
        }
      }
    }
  }
}
