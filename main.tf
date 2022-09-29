provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAYZ3XCFWOAUBOSXVH"
  secret_key = "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"
}



resource "aws_instance" "web" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = var.instancetype
  key_name      = "deployer-key"
  security_groups = ["aws_security_group.allow_tls"]
  user_data       = <<EOF
  #!/bin/bash
  sudo apt update
  sudo apt install -y nginx
  systemctl status nginx
  EOF
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCztgnv2xC8DQOE+d9vtfAvvsF78A+4lHL6mQ/EHLo+Uoo5TEGfjQXUK943f/cmF5dSJZz7AgurhKPfp7LfOdbqRxTkwL9V6KOBO3XA+KWbak8Ju/JFyORyZaA0SmmD49MWR/9Lk5dBCp/zJ3DC599UlDuO0Sn59hF394kqnMRz1Hz2fk7eT8t8Bv3vsRYes6w11KeAGwY2hmNCsVZO2QadHrNnnHavwAk/HmgEufjYpzhA9deZH+qjIVtg7qjZlPwQ4zNCEeYpFcwLH7hW1jyaFoOriTP7RUmsoPTKuTR5mETNnBEW/N/qNw0JaLbhyhPL/iC1QmozTgSiOzHqQIOKaeCz1IcTt9yGz1FMYGCQnyjLgePps7n1b4hA5McFK1214PMwoze3l0zdYa3v2bEULxaa+cePgLQzeXbLeeg6uXUpshE4rNdE2/XjwrgzuWEfUNetgvKmhFPGZHmMZ0eJN6np4FZLxI9VBk6zBHDyBzUGoczpYhiBTOIROwZ1Mgk= ubuntu@ip-172-31-90-136"
}



resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
