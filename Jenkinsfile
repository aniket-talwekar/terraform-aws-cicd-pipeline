pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/YOUR-GITHUB-USERNAME/terraform-aws-cicd-pipeline.git'
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-terraform-creds'
                ]]) {
                    sh 'terraform -chdir=terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-terraform-creds'
                ]]) {
                    sh 'terraform -chdir=terraform plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                input "Do you want to apply changes?"
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-terraform-creds'
                ]]) {
                    sh 'terraform -chdir=terraform apply -auto-approve'
                }
            }
        }
    }
}
