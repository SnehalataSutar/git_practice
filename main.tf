terraform{
  backend "s3"{
    bucket = "terra-buc-demo"
    region = "ap-south-1"
    key = "terraform.ftstate"
  }
}

module "myvpcmodule" {
  source = "./vpc module"
  vpc_cidr = var.vpc_cidr
  vpcname = var.vpcname
  project_name =  var.project_name
  pub_cidr =  var.pub_cidr
  pvt_cidr = var.pvt_cidr
}

# module "myinstancemodule" {
#   source        = "./instance_module"
#   instance_type = var.instance_type
#   project_name  = var.project_name
# }


