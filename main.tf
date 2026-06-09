resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "GitHubActionsVPC"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet1"
  }
}

resource "aws_instance" "test-my-1"{
  count = 3
  ami = "ami-00e801948462f718a"
  instance_type = "t3.micro"
  tags = {
    "Environment" = "aws_instance"
    "Name"= "test-my-1${count.index}"
  }
}

resource "aws_s3_bucket" "mys3bucket" {
  bucket = "my-unique-s3-bucket-name-12345"
  tags ={
    name = "mys3bucket"
  }
  
}

