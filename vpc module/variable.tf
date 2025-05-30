# variable "vpc_cidr" {
#   default = "10.0.0.0/20"
# }
# variable "vpcname" {
#   default = "harry"
# }
# variable "project_name" {
#   default = "pluto"
# }
# variable "instance_type" {
#   default = "t2.micro"
#   description = "this is now basic instance"
# }
# variable "pub_cidr" {
#     default = "10.0.1.0/16"
# }
# variable "pvt_cidr" {
#     default = "10.0.2.0/16"
# }

variable "vpc_cidr" {}
variable "vpc_name" {}
variable "project_name" {}
variable "pub_cidr" {}
variable "pvt_subnet" {}