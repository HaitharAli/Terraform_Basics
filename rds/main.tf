provider "aws" {
  region ="us-east-1"
}

resource "aws_db_instance" "myRDS" {
    db_name = "myDB" #name is deprecated
    identifier = "my-first-rds"
    instance_class = "db.t2.micro"
    engine = "mariadb"
    engine_version = "10.6.10"
    username = "haithar"
    password = "password123"
    port = 3306
    allocated_storage = 20
    #when we run terraform destroy, it will take snapshots , so we are skipping it
    skip_final_snapshot = true
}