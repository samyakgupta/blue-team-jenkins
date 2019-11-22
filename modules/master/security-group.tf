resource "aws_security_group" "master_sg" {
  name        = "master_sg"
  description = "Security group for jenkins master node, to allow traffic on 8080"
  vpc_id      = "${aws_default_vpc.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 0
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
    prefix_list_ids = ["pl-12c4e678"]
  }
}