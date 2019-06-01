pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building Escape'
        bat 'python compile.py'
      }
    }
  }
}