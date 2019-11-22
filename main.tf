terraform {
  backend "s3" {
    bucket  = "sdu-bootcamp-blue-team-terraform-state"
    encrypt = "true"
    region  = "ap-south-1"
    key     = "terraform.tfstate"
    profile = "ShellPowerUser"
  }
}


variable "master_ami" {
  default = "ami-0ca4ee4403ecb3a4e"
}

variable "node_ami" {
  default = "ami-0ca4ee4403ecb3a4e"
}

provider "aws" {
  region  = "${local.aws_region}"
  profile = "ShellPowerUser"
}

module "jenkins_node_module" {
  source = "./modules/node"
  ami    = "${var.node_ami}"
}

module "jenkins_master_module" {
  source = "./modules/master"
  ami    = "${var.master_ami}"
}

resource "aws_key_pair" "jenkins" {
  key_name   = "blue-jenkins-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

output "master_ip" {
  value = module.jenkins_master_module.instance_ip
}

output "node_ip" {
  value = module.jenkins_node_module.instance_ip
}



