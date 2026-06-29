resource "aws_security_group" "web" {

  name = "github-action-sg"

  ingress {

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

}

resource "aws_instance" "server" {

  ami = var.ami

  instance_type = var.instance_type

  security_groups = [
    aws_security_group.web.name
  ]

  tags = {

    Name = "GitHubActionEC2"

  }

}
