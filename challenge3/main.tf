provider "aws" {
  region = "us-east-1"
}

module "ec2webmodule" {
  source = "./web"
}

module "ec2dbmodule" {
  source = "./db"
}

output "db_privateIP" {
  value = module.ec2dbmodule.privateIP
}
output "web_PublicIP" {
  value = module.ec2webmodule.publicIP
}