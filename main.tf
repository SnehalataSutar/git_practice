terraform {
  backend "s3" {
    bucket = "terra-buc-demo"
    region = "ap-south-1"
    key = "terraform.tfstate"
    
  }
}

module "myvpcmodule" {
  source = "./vpc module"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  project_name =  var.project_name
  pub_cidr =  var.pub_cidr
  pvt_subnet = var.pvt_subnet
}

module "myinstancemodule" {
  source = "./instance module"
  instance_type = var.instance_type
  project_name = var.project_name
  
}


