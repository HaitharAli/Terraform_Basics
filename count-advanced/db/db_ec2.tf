variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    count = length(var.server_names)
    tags = {
        Name =var.server_names[count.index]
    }
}

output "privateIP" {
  value = aws_instance.db.*.private_ip
}