terraform {
    backend "s3" {
    bucket               = "sdu-bootcamp-blue-team-terraform-state"
    encrypt              = "true"
    region               = "ap-south-1"
    key                  = "terraform.tfstate"
    profile = "ShellPowerUser"
  }
}


<<<<<<< HEAD
variable "master_ami" {
  default = "ami-0ca4ee4403ecb3a4e"
}

variable "node_ami" {
  default = "ami-0ca4ee4403ecb3a4e"
=======
variable "jenkins_ami" {
  default = "ami-asdfasdf"
>>>>>>> 6a80dc77e2ad17625b42a59b0e7086f14557f8ee
}

provider "aws" {
  region  = "${local.aws_region}"
  profile = "ShellPowerUser"
}

module "jenkins_master_module" {
  source = "./modules/master"
  ami = "${var.jenkins_ami}"
}

<<<<<<< HEAD
module "jenkins_node_module" {
   source = "./modules/node"
   ami = "${var.node_ami}"
 }

=======
>>>>>>> 6a80dc77e2ad17625b42a59b0e7086f14557f8ee


