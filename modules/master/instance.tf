resource "aws_security_group" "master_sg" {
  name        = "master_sg"
  description = "Security group for jenkins master node, to allow traffic on 8080"
  vpc_id      = "${aws_default_vpc.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]# add a CIDR block here
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "jenkins_master" {
  ami           = "${local.jenkins_ami}"
  instance_type = "t2.micro"
  vpc_security_group_ids = "${aws_security_group.master_sg.id}"

  tags = {
    Name = "Jenkins Master"
    Owner = "blue-team"
  }
}

output "instance_id" {
    value = "${aws_instance.jenkins_master.id}"
}


