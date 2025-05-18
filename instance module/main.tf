data "aws_security_group" "mysg" {
  name = "mysg"
}

resource "aws_instance" "web" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = var.instance_type
  key_name = "terra_practice"
  vpc_security_group_ids = data.aws_security_group.mysg.id
  tags = {
    Name = var.project_name
  }
}