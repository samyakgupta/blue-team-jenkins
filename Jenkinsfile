pipeline {
    agent any
    stages {

        stage('playbook') {
            steps {
                sh 'packer build blue-ami.json'
            }
        }

        stage('terraform init'){
            steps{
                sh """
                    terraform init -no-color
                """
            }
        }

        stage("terraform plan"){
            steps {
                sh """
                    terraform plan -no-color -out terraform.plan
                """
            }

        }

        stage("terraform apply"){
            steps {
                sh """
                    terraform apply -no-color -auto-approve terraform.plan
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
