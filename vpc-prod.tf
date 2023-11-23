resource "aws_vpc" "prod" {
    cidr_block                           = "10.0.0.0/16"

    tags                                 = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-vpc"
    }
    tags_all                             = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-vpc"
    }
}

resource "aws_subnet" "sub1" {
    cidr_block                                     = "10.0.1.0/24"
    
    tags                                           = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-public-subnet-ap-south-1a"
    }
    tags_all                                       = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-public-subnet-ap-south-1a"
    }
    vpc_id                                         = "vpc-00341ab7e47b0148c"
}

resource "aws_subnet" "sub2" {
    cidr_block                                     = "10.0.2.0/24"
    tags                                           = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-public-subnet-ap-south-1b"
    }
    tags_all                                       = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-public-subnet-ap-south-1b"
    }
    vpc_id                                         = "vpc-00341ab7e47b0148c"
}

resource "aws_internet_gateway" "igw" {
tags     = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-igw"
    }
    tags_all = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-igw"
    }
    vpc_id   = "vpc-00341ab7e47b0148c"
}

resource "aws_route_table" "public" {
 tags             = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-public-rt"
    }
    tags_all         = {
        "Environment" = "prod"
        "Name"        = "flavum-prod-public-rt"
    }
    vpc_id           = "vpc-00341ab7e47b0148c"
}

resource "aws_route_table_association" "rt-public" {
    route_table_id = "rtb-07c67f788fecb98e9"
    subnet_id      = "subnet-03f53cd6ecfdea2c7"
}

resource "aws_route_table_association" "rt-public-2" {
    route_table_id = "rtb-07c67f788fecb98e9"
    subnet_id      = "subnet-0d5ada421b9ca571a"
}
resource "aws_eip" "main" {
    domain               = "vpc"
    instance             = "i-087947a8e5db4ef22"
   
    tags                 = {
        "Environment" = "prod"
        "Name"        = "prod_flavum_web_ap_south_1a"
    }
    tags_all             = {
        "Environment" = "prod"
        "Name"        = "prod_flavum_web_ap_south_1a"
    }
}
