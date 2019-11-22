terraform {
    backend "s3" {
    bucket               = "sdu-bootcamp-blue-team-terraform-state"
    encrypt              = "true"
    region               = "ap-south-1"
    key                  = "terraform.tfstate"
    profile = "ShellPowerUser"
  }
}


variable "jenkins_ami" {
  default = "ami-asdfasdf"
}

provider "aws" {
  region  = "${local.aws_region}"
  profile = "ShellPowerUser"
}

module "jenkins_master_module" {
  source = "./modules/master"
  ami = "${var.jenkins_ami}"
}



