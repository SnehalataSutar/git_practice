provider "aws" {
  region = "ap-south-1"
}



resource "aws_instance" "web" {
  ami           = "ami-0af9569868786b23a"
  instance_type = "t2.micro"
  key_name = "terra_practice"
  tags = {
    Name = "HelloWorld"
  }
}
