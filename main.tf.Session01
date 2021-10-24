provider "aws" {}

variable "cidr_blocks" {
    type = list(string)
}

variable "sn-cidr-block" {
    description = "subnet cidr block"
    default = "10.0.6.0/24"
    type = string
}

variable "vpc-cidr-block" {
    description = "vpc cidr block"
    default = "10.0.0.0/16"
}

variable "env" {
    description = "env to deploy"
    default = "Development"
}

variable az {}

resource "aws_vpc" "ttt_vpc" {
    cidr_block = var.cidr_blocks[0]
    tags = {
        Name = var.env
    }
}

resource "aws_subnet" "ttt-sn-1" {
    vpc_id = aws_vpc.ttt_vpc.id
    cidr_block = var.cidr_blocks[1]
    availability_zone = var.az
    tags = {
        Name = "tttSubnet01"
    }
}

output "ttt-vpc-id" {
    value = aws_vpc.ttt_vpc.id
}

output "ttt-sn-id" {
    value = aws_subnet.ttt-sn-1.id
}
