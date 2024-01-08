locals {
  instance_type = var.isProd ? "t2.micro" : "t2.small"
}

