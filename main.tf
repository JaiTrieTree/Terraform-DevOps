provider "aws" {
    region = "ap-south-1"
}

resource "aws_vpc" "tttapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "${var.env}-vpc"
    }
}

module "tttapp-subnet" {
    source = "./modules/subnet"
    sn-cidr-block = var.sn-cidr-block
    az = var.az
    env = var.env
    vpc_id = aws_vpc.tttapp-vpc.id
}