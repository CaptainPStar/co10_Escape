pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Sync Submodules'
        bat 'git submodule update --init --recursive'
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