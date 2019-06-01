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
        sh '7z.exe a co10_Escape_dev_%BUILD_NUMBER%_%GIT_COMMIT%.zip ./Packed/*'
        archiveArtifacts '*.7z'
      }
    }
  }
}