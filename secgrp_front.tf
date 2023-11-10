
resource "aws_security_group" "allow_http_https_ssh_traffic" {
  name        = "Ramesh-securitygroup"
  description = "Allow inbound traffic for https, http and ssh"
  vpc_id      = aws_vpc.ramesh_vpc.id

  ingress {
    description      = "HTTPS inbound"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }

  ingress {
    description      = "HTTP inbound"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }

  ingress {
    description      = "SSH inbound"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" 
    cidr_blocks = ["0.0.0.0/32"]
  }

  tags = {
    Name = "secgrp"

  }
}