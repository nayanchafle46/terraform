resource "aws_vpc" "main" {
    cidr_block                           = "172.31.0.0/16"
    tags                                 = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-vpc"
    }
    tags_all                             = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-vpc"
    }
}

resource "aws_subnet" "sub1" {
    cidr_block                                     = "172.31.2.0/24"
    tags                                           = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-subnet-ap-south-1b"
    }
    tags_all                                       = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-subnet-ap-south-1b"
    }
    vpc_id                                         = "vpc-0ed46b6e067849b2f" 
}

resource "aws_subnet" "sub2" {
 cidr_block                                     = "172.31.1.0/24"
 tags                                           = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-subnet-ap-south-1a"
    }
    tags_all                                       = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-subnet-ap-south-1a"
    }
    vpc_id                                         = "vpc-0ed46b6e067849b2f" 
}

resource "aws_internet_gateway" "igw" {
 tags     = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-igw"
    }
    tags_all = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-igw"
    }
    vpc_id   = "vpc-0ed46b6e067849b2f" 
}

resource "aws_route_table" "private" {
route            = []
    tags             = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-private-rt"
    }
    tags_all         = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-private-rt"
    }
    vpc_id           = "vpc-0ed46b6e067849b2f"
}

resource "aws_route_table_association" "rt-private" {
route_table_id = "rtb-044a163fdd5f60e3f"
    subnet_id      = "subnet-08e770513400eb11c" 
}

resource "aws_route_table" "public" {
tags             = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-public-rt"
    }
    tags_all         = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-public-rt"
    }
    vpc_id           = "vpc-0ed46b6e067849b2f"  
}

resource "aws_route_table_association" "rt-public" {
route_table_id = "rtb-07fa44fccb71f3abd"
    subnet_id      = "subnet-00b50269735fc7229"
}
