terraform{
  backend "s3"{
    bucket = "terra-buc-demo"
    region = "ap-south-1"
    key = "terraform.ftstate"
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpcname
    project = var.project_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.pub_cidr
   tags = {
    Name = "${var.project_name}_public_subnet"
    project = var.project_name
  }
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1"
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.pvt_cidr
   tags = {
    Name = "private_subnet"
    project = var.project_name
  }
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1"
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
   tags = {
    Name = "myigw"
    project = var.project_name
  }
}

resource "aws_route_table" "myroute_table" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
  tags = {
    Name = "myroute_table"
    project = var.project_name
  }
}

data "aws_security_group" "mysg" {
   filter {
     name = "group_name"
     values = [mysg]
   }
}

resource "aws_instance" "web" {
  ami           = "ami-0af9569868786b23a"
  instance_type = var.instance_type
  key_name = "terra_practice"
  vpc_security_group_ids = data.aws_security_group.mysg.id
  
  connection {
    type = "ssh"
    user = "root"
    password = password
    host = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/script.sh",
        "/tmp/script.sh args",
     ]
  }
  provisioner "file" {
    source = "/aws/index.html"
    destination = "/var/www/html/index.html"
  }
  provisioner "local-exec" {
    command = "echo this task is successful"
  }

  tags = {
    Name = var.project_name
  }
}