provider "aws" {

    region       = "ap-south-1"

}


module "vpc" {

  source = "./vpc"

}

module "bastion_host" {

  source = "./bastion_host"

}

