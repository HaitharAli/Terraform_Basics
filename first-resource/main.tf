provider "aws" {
    region = "us-east-1" #always pick the region closest to you
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
}