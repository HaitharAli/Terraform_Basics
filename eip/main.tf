provider "aws" {
    region ="us-east-1"
}

variable "vpcname" {
    type =string
    default = "vpc_haithar"
}

variable "sshport" {
    type = number
    default = 22
}

#Boolean doesn't have type 
variable "enabled" {
    default = true
}
#List - can be used for multiple firewall rules, you can send this list
variable "myList" {
    type = list(string)
    default = ["value1","value2"]
}

variable "myListNumber" {
    type = list(number)
    default = [ 1,2 ]
}
  
variable "myMap" {
    type = map
    default = {
        key1 = "Value1"
        key2 = "Value2"
    }   
}

variable "myInputName" {
    type = string
    description = "Enter input VPC name"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags ={
       # Name = var.myList[1] #using the value of List
       # Name = var.myMap["key1"]
       Name = var.myInputName
    }
}

output "vpcid" {
    value = aws_vpc.myvpc.id
}
#tuple can store heterogeneous datatype ,but list can store only homogeneous
variable "mytuple" {
  type = tuple(string,number,string)
  default = ["cat" ,1 , "dog"]
}

#customized Objects
variable "myobject" {
    type = object({name=string, port = list(number)})
    default = {
        name = "Haithar"
        port = [22,23,24]
    }
}