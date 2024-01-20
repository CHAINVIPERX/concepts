variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "tags" {
  default = {
    Name      = "robo"
    Enivr     = "Dev"
    terraform = "true"
  }
}
