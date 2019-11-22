provider "aws" {
  region  = "ap-south-1"
  profile = "ShellPowerUser"
}

variable "service_ports" {
  default = ["22","8080","50000"]
}

resource "aws_security_group" "node_sg" {
  name        = "node_sg"
  description = "Security group for jenkins node, to allow traffic on 5000"

  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
    }
  }

#   ingress {
#     # TLS (change to whatever ports you need)
#     from_port = 50000
#     to_port   = 50000
#     protocol  = "tcp"
#     # Please restrict your ingress to only necessary IPs and ports.
#     # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
#     cidr_blocks = ["0.0.0.0/0"] # add a CIDR block here
#   }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "ami" {
   default = "asdfasdf"
 }


resource "aws_instance" "jenkins_node" {
  ami                    = "${var.ami}"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.node_sg.id}"]

  tags = {
    Name        = "blue Node"
    Owner       = "blue-team"
    description = "instance for Jenkins Node"
  }
}

output "instance_id" {
  value = "${aws_instance.jenkins_node.id}"
}


