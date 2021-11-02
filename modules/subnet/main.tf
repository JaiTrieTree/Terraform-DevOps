resource "aws_subnet" "tttapp-sn-1" {
    vpc_id = var.vpc_id
    cidr_block = var.sn-cidr-block
    availability_zone = var.az
    tags = {
        Name = "${var.env}-subnet-1"
    }
}

resource "aws_internet_gateway" "tttapp-igw" {
    vpc_id = var.vpc_id
    tags = {
        Name = "${var.env}-igw"
    }
}

resource "aws_route_table" "tttapp-rtb" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tttapp-igw.id
    }
    tags = {
        Name = "${var.env}-rtb"
    }
}