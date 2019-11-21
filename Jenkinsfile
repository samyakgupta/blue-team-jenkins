pipeline {
    agent any{
        stages{
            stage("clone repo"){

            }

            stage("build ami with packer"){
                sh """
                    packer version
                """
            }

            stage("terraform init"){
                sh """
                    terraform version
                """

            }

            stage("terraform plan"){
                sh """
                    terraform version
                """

            }

            stage("terraform apply"){
                sh """
                    terraform version
                """
            }

            stage("test"){
                sh """
                    echo 'hello test'
                """
            }
        }
    }
}