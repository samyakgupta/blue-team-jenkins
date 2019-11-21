pipeline {
    agent any
    stages{
        stage("build ami with packer"){
            steps {
                sh """
                packer version
                """
            }
        }

        stage("terraform init"){
            steps {
                sh """
                    terraform version
                """
            }
        }

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