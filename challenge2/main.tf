provider "aws" {
  region = "us-east-1"
}

variable "ingress" {
  type = list(number)
  default = [ 80,443 ]
}

variable "egress" {
  type = list(number)
  default = [ 80,443 ]
}

resource "aws_instance" "db"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="DB Server"
    }
}
resource "aws_instance" "web"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.web_traffic.name]
    user_data = file("server-script.sh")
    tags = {
        Name ="Web Server"
    }
}

resource "aws_eip" "web_ip" {
    instance = aws_instance.web.id
}

resource "aws_security_group" "web_traffic" {
  name = "Allow Web Traffic"

  dynamic "ingress"{
    iterator = port
    for_each = var.ingress
    content{
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress"{
    iterator = port
    for_each = var.egress
    content{
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output "privateIP" {
  value = aws_instance.db.private_ip
}

output "publicIP" {
  value = aws_eip.web_ip.private_ip
}