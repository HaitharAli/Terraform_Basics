provider aws {
    region = "us-east-1"
}

variable "ingressrules" {
  type = list(number)
  default = [ 80,443 ]
}
variable "egressrules" {
  type = list(number)
  default = [ 80,443,25,3306,43,8080]
}

resource "aws_instance" "ec2"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="test_ec2"
    }
    security_groups = [ aws_security_group.secgroup.name ]
}

resource "aws_security_group" "secgroup" {
    name = "allow HTTPS"
    dynamic "ingress" { #:ingress refers what kind of Nested block we are going to use
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
}