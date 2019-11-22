terraform {
    backend "s3" {
    bucket               = "sdu-bootcamp-blue-team-terraform-state"
    encrypt              = "true"
    region               = "ap-south-1"
    key                  = "terraform.tfstate"
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

module "jenkins_master_module" {
  source = "./modules/master"
  ami = "${var.master_ami}"
}

module "jenkins_node_module" {
   source = "./modules/node"
   ami = "${var.node_ami}"
 }



