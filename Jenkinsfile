pipeline { 
  
  agent any

  stages {

    stage('Deploying...') {

        when {expression { env.BRANCH_NAME == 'master' }}
        
        steps {
            sh 'bash -v 0-how-to-install-configure/kops.sh'
            sh 'bash -v kops-test.sh'          
        }
    }

  }

}
