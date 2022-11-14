resource "aws_instance" "web"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    security_groups = [module.securitygroup.sg_name]
    user_data = file("./web/server-script.sh")
    tags = {
        Name ="Web Server"
    }
}

output "publicIP" {
  value = module.eip_module.publicIP
}

module "securitygroup" {
  source = "../sg"
}

module "eip_module" {
  source = "../eip"
  instance_id = aws_instance.web.id
}