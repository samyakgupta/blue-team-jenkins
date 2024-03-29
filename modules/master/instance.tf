variable "service_ports" {
  default = [22,8080,50000]
}

resource "aws_security_group" "master_sg" {
  name        = "blue_master_sg"
  description = "Security group for jenkins master node, to allow traffic on 8080"

  tags = {
      Name = "blue_master_sg"
  }
  dynamic "ingress" {
    for_each = var.service_ports
    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

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

variable "ami" {
   default = "asdfasdf"
 }



resource "aws_instance" "jenkins_master" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.master_sg.id}"]
  key_name = "blue-jenkins-key"

  tags = {
    Name = "blue Master"
    Owner = "blue-team"
    description = "instance for Jenkins Node"
  }



    provisioner "file" {
        source = "../../../create-node.sh"
        destination = "/tmp/create-node.sh"
    }

    provisioner "remote-exec" {
    inline = [
       "chmod +x /tmp/create-node.sh",
       "/tmp/create-node.sh $0 http://${self.public_ip}:8080 blue-node admin:e1cb1ad4942f452e8a0c875fc0ba9106",
    ]
   connection {
     user = "ubuntu"
     host = self.public_ip
   }
  }

}

output "instance_ip" {
    value = "${aws_instance.jenkins_master.public_ip}"
}


