provider "aws" {
  region = "us-east-1"
}

variable "number_of_servers" {
  type = number
}

resource "aws_instance" "ec2"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="test_ec2"
    }
    count = var.number_of_servers #it will create 2 instance
}