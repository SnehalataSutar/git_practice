terraform{
  backend "s3"{
    bucket = "terra-buc-demo"
    region = "ap-south-1"
    key = "terraform.ftstate"
  }
}

provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "ami-0af9569868786b23a"
  instance_type = var.instance_type
  key_name = "terra_practice"
  vpc_security_group_ids = ["sg-0bb8da6ed997e63f8"]
  tags = {
    Name = "HelloWorld"
  }
}

variable "instance_type" {
  default = t2.micro
  description = "this is now basic instance"
}