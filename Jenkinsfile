pipeline {
    agent any  // This means the pipeline will run on any available agent (node)

    environment {
        // Set AWS credentials here. Make sure AWS CLI is configured on the Jenkins agent.
        AWS_REGION = 'us-east-1' // Define the AWS region for your resources
        TERRAFORM_VERSION = '1.1.7' // Terraform version (you can specify your own version)
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the GitHub repository containing your Terraform files
                git branch: 'main', url: 'https://github.com/your-username/terraform-aws-cicd-pipeline.git'
            }
        }

        stage('Install Terraform') {
            steps {
                // Install Terraform if it's not already installed on the Jenkins agent
                sh '''
                curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
                sudo apt-add-repository "deb https://apt.releases.hashicorp.com $(lsb_release -cs) main"
                sudo apt-get update
                sudo apt-get install terraform
                terraform -version
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform and download the necessary provider plugins
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Run Terraform Plan to see the changes that will be made
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the changes to AWS infrastructure
                // Using `-auto-approve` to skip manual approval
                sh 'terraform apply -auto-approve tfplan'
            }
        }

        stage('Post-Deployment') {
            steps {
                // You can use Terraform output to get the instance ID, IP address, etc., if needed.
                sh 'terraform output'
            }
        }
    }

    post {
        success {
            echo 'Deployment was successful!'
        }
        failure {
            echo 'Deployment failed. Please check the logs.'
        }
    }
}
