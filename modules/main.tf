provider "aws" {
    region = "us-east-1"
}

module "ec2module" {
  source = "./ec2"
  ec2_name = "Name from Module"
}

#Using output of a module - it is like getting instance_id from the ec2 module
output "module_output" {
  value = module.ec2module.instance_id
}