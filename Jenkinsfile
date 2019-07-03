pipeline { 
  
  agent any

  stages {

    stage('Deploying...') {

        when {expression { env.BRANCH_NAME == 'master' }}
        
        steps {
            sh 'bash -v 0-how-to-install-configure/kops.sh'
            sh 'mkdir -p /opt/kops/'
            sh 'rm -rf /opt/kops/*'
            sh 'cp env.sh /opt/kops/'
            sh 'bash -v kops-test.sh'          
        }
    }

  }

}
