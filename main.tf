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
  profile = "bia"
}

resource "aws_security_group" "bia-dev" {
  name        = "bia-dev-tf"
  description = "regra para a instancia de trabalho bia-dev com tf"
  vpc_id      = "vpc-0c03efda41c285be2"



  ingress {
    description = "Liberado 3001 para o mundo"
    from_port   = 3001
    protocol    = "tcp"
    to_port     = 3001
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "bia-dev" {
  ami           = "ami-0ae3cb8c2ae14c4a7"
  instance_type = "t3.micro"
  tags = {
    ambiente = "dev"
    Name     = "bia-dev"
  }
  vpc_security_group_ids = ["sg-0887647cbb4e0bc6e"]
  root_block_device {
    volume_size = 10
  }
}
