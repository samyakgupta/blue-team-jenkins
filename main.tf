terraform {
    backend "s3" {
    bucket               = "sdu-bootcamp-blue-team-terraform-state"
    encrypt              = "true"
    region               = "ap-south-1"
    key                  = "terraform.tfstate"
  }
}

provider "aws" {
  region  = "${local.aws_region}"
  profile = "ShellPowerUser"
}