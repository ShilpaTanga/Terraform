terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e001c9271cf7f3b9"
  instance_type = "t2.micro"
  subnet_id     = "subnet-0ec9d9936ab6406e4"

  tags = {
    Name = "MyTerraformCLI-instance"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
