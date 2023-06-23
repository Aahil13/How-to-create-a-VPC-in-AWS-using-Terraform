######################################################################################
#                                       VARIABLES
######################################################################################

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "availablity_zone1" {
  type    = string
  default = "us-east-1a"
}

variable "availablity_zone2" {
  type    = string
  default = "us-east-1b"
}

variable "keypair" {
  type    = string
  default = "altschool"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "image_id" {
  type    = string
  default = "ami-022e1a32d3f742bd8"
}

variable "cidr_block" {
  type    = string
  default = "0.0.0.0/0"
}



