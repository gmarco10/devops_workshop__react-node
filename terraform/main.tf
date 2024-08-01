terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

resource "aws_instance" "app_backend" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "NodeBackendInstance"
  }
}

resource "aws_instance" "app_frontend" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "ReactFrontendInstance"
  }
}

resource "aws_instance" "app_nginx" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update
              sudo apt install -y nginx
              EOF

  tags = {
    Name = "NginxInstance"
  }
}

resource "aws_instance" "app_database" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "DatabaseInstance"
  }
}
