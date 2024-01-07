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
