terraform {
        required_providers {
        aws = {
        source = "hashicorp/aws"
        version = ">4.16"
}
}
required_version = ">=1.2.0"
}

provider "aws" {
        region = "ap-south-1"
}
locals {
        instance_name = {"sayan":"ami-0c768662cc797cd75","say":"ami-0fdea1353c525c182","ronnie":"ami-02eb7a4783e7e9317","ron":"ami-06c2ec1ceac22e8d6"}
}
resource "aws_instance" "ec2_instance" {
        for_each = local.instance_name
        ami = each.value
        instance_type = "t2.micro"
        tags = {
                Name = each.key
}
}
