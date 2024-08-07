pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1' // update with your region
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ilab-aws']]) {
                    sh 'terraform init -input=false'
                }
            }
        }
        stage('Terraform Plan') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ilab-aws']]) {
                    sh 'terraform plan -out=tfplan -input=false'
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ilab-aws']]) {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
        stage('Upload State to S3') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'ilab-aws']]) {
                    sh 'aws s3 cp terraform.tfstate s3://testingbucketcommerce'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}



