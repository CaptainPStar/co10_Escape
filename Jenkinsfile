pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building Escape'
        bat(script: 'python compile.py', returnStatus: true)
      }
    }
    stage('Deploy') {
      steps {
        archiveArtifacts 'Packed/*/*.pbo'
      }
    }
  }
}