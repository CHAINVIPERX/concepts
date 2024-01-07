#variables can be declared in variables.tf as variable "name"{} and its value can be declared in [file_name].tfvars. type is always optional and default is optional value if already provide in [file_name].tfvars.

#varibale prcedence
# 1- command line -var="var_name=value"
# 2-    "         -var-file="file_name.tfvars"
# 3- terraform.tfvars and > any other file_name.tfvars
# 4- variables.tf file
# 5- environmental variables




variable "sg-name" {
  type    = string
  default = "roboshop-all"
}

variable "sg-desc" {
  type    = string
  default = "Allows-All"
}

variable "inbound-from-port" {
  type    = number
  default = 0
}

variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "ami_id" {
  type    = string
  default = "ami-03265a0778a880afb"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type = map(any)
  default = {
    Name        = "Terraform"
    Project     = "Roboshop"
    Environment = "Practice"
    Component   = "web"
    Terraform   = "true"
  }
}
