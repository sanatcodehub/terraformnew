provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4AJCU34ANEILXAHH"
  secret_key = "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"
}

# resource
resource "aws_instance" "mywebserver" {
  ami = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name = "n.virginia_FEB2024"
  security_groups = ["launch-wizard-1"]  # Consider using a custom security group
}

