provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  tags = {
    Name = "ExampleInstance"
  }
}

terraform {
  backend "s3" {
    bucket = "testingbucketcommerce"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

