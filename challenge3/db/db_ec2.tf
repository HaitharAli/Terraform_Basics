resource "aws_instance" "db"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="DB Server"
    }
}

output "privateIP" {
  value = aws_instance.db.private_ip
}