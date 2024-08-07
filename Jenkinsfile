pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION = 'us-east-1'
        AWS_ACCESS_KEY_ID = credentials('AKIA4AJCU34ANEILXAHH')
        AWS_SECRET_ACCESS_KEY = credentials('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')
    }
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }
        stage('Terraform Init') {
            steps {
                sh '''
                export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                terraform init
                '''
            }
        }
        stage('Terraform Plan') {
            steps {
                sh '''
                export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                terraform plan -out=tfplan
                '''
            }
        }
        stage('Terraform Apply') {
            steps {
                sh '''
                export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                terraform apply -auto-approve tfplan
                '''
            }
        }
        stage('Upload State to S3') {
            steps {
                sh '''
                export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
                export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
                aws s3 cp terraform.tfstate s3://testingbucketcommerce
                '''
            }
        }
    }
    post {
        always {
            node {
                cleanWs()
            }
        }
    }
}

