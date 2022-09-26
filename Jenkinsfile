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
            sh 'sudo su'
           // sh 'sudo aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 339837189061.dkr.ecr.us-east-1.amazonaws.com'
            sh 'sudo docker build -t c3-courseproject .'
            sh 'sudo docker tag c3-courseproject:latest 339837189061.dkr.ecr.us-east-1.amazonaws.com/c3-courseproject:${BUILD_NUMBER}'
            sh 'sudo docker push 339837189061.dkr.ecr.us-east-1.amazonaws.com/c3-courseproject:${BUILD_NUMBER}'
        //    sh 'sudo docker build . -t 339837189061.dkr.ecr.us-east-1.amazonaws.com/c3-courseprojec:${BUILD_NUMBER}'
         //   sh 'sudo docker push 339837189061.dkr.ecr.us-east-1.amazonaws.com/c3-courseprojec:${BUILD_NUMBER}'
          }
        }
      }
    }
  }
}
