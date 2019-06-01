pipeline {
  agent any
  environment {
        GIT_COMMIT_SHORT = sh(
                script: "printf \$(git rev-parse --short ${GIT_COMMIT})",
                returnStdout: true
        )
    }
  stages {
    stage('Build') {
      steps {
        echo 'Building Escape'
        bat 'python compile.py'
      }
    }
  }
}