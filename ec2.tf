resource "aws_instance" "ec2_instance" {
    ami                                  = "ami-0287a05f0ef0e9d9a"
    availability_zone                    = "ap-south-1a"
    instance_type                        = "t3.medium"
    key_name                             = "flavum-dev"
    security_groups                      = []
    subnet_id                            = "subnet-00b50269735fc7229"
    tags                                 = {
        "Name" = "flavum_dev"
    }
    tags_all                             = {
        "Name" = "flavum_dev"
    }
}

resource "aws_security_group" "ec2_sg" {
    description = "this security group is for dev env"
    egress      = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 0
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "-1"
            security_groups  = []
            self             = false
            to_port          = 0
        },
    ]
    ingress     = [
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 22
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 22
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 443
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 443
        },
        {
            cidr_blocks      = [
                "0.0.0.0/0",
            ]
            description      = ""
            from_port        = 80
            ipv6_cidr_blocks = []
            prefix_list_ids  = []
            protocol         = "tcp"
            security_groups  = []
            self             = false
            to_port          = 80
        },
    ]
    name        = "flavum-dev-sg"
    tags        = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-sg"
    }
    tags_all    = {
        "Environment" = "dev"
        "Name"        = "flavum-dev-sg"
    }
    vpc_id      = "vpc-0ed46b6e067849b2f"
}
