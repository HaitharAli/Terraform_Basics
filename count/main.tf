provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="test_ec2"
    }
    count =2 #it will create 2 instance
}