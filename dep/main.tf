provider aws {
    region = "us-east-1"
}

resource "aws_instance" "ec2db"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="test_db"
    }
}

resource "aws_instance" "ec2web"{
    ami = "ami-09d3b3274b6c5d4aa"
    instance_type = "t2.micro"
    tags = {
        Name ="test_web"
    }
    #This Instance will get created only after dependency creation.
    depends_on = [aws_instance.ec2db]
}