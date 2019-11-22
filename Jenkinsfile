pipeline {
    agent any
    stages {
        stage('ping') {
            steps {
                sh 'cd sbatchu1/ansible && ansible all -m ping'
            }
        }
        stage('playbook') {
            steps {
                sh 'cd sbatchu1/ansible && ansible-playbook *.yml -b'
            }
        }
    
        stage('check whether jenkins is up & running'){
            steps{
                sh 'curl http://13.232.106.195:8080/'
                // sh 'http_code=$(curl "http://google.com" -s -f -w %{http_code} -o /dev/null)'
                // def status_code = sh (script: "curl 'http://13.232.106.195:8080/' -s -f -w %{http_code} -o /dev/null", returnStdout: true)
                // script{
                //     if(status_code != 403){
                //         error('Failing build because... it did not return 403)
                //     }
                // }

        stage("terraform plan"){
            steps {
                sh """
                    terraform version
                """
            }

            }

        stage("terraform apply"){
            steps {
                sh """
                    terraform version
                """
            }
        }

        stage("test"){
            steps {
                sh """
                    terraform version
                """
            }
        }
    }
}
