variable "instance_type" {
  default = "t2.micro"
  description = "this variable is created for initilizing instance using variable input"
  
}
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "vpc_name" {
    default = "harry"
  
}
variable "project_name" {
    default = "pluto"
  
}
variable "pub_cidr" {
    default = "10.0.2.0/24"
  
}
variable "pvt_subnet" {
    default = "10.0.3.0/24"
}