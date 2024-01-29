variable "instance_names" {
  type = map(any)
  default = {
    # Redis    = "t2.micro"
    # RabbitMQ = "t2.micro"
    # # Catalogue = "t2.micro"
    # # User      = "t2.micro"
    # # Cart      = "t2.micro"
    # # Dispatch  = "t2.micro"
    # Web = "t2.micro"
    # Payment  = "t2.micro"
    # MongoDB   = "t2.small"
    # Mysql     = "t2.micro"
    # Shipping  = "t2.small"
  }
}

# variable "ami_id" {

#   default = data.aws_ami.centos8.id

# }

variable "zone_id" {
  type = string
  # default = "Z04496693IX1XH6O3HSH2"

}
# variable "hi" {
#   type = 
#   default = 

# }
