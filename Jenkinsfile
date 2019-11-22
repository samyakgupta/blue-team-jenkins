pipeline {
    agent any
    stages {

        stage('playbook') {
            steps {
                sh 'cd ansible && ansible-playbook *.yml -b'
            }
        }

        stage('terraform init'){
            steps{
                sh """
                    terraform init
                """
            }
        }

        stage("terraform plan"){
            steps {
                sh """
                    terraform plan
                """
            }

        }

        stage("terraform apply"){
            steps {
                sh """
                    terraform apply
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
