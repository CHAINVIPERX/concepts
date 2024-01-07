locals {
  instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Shipping" || var.instance_names[count.index] == "Mysql" ? "t2.small" : "t2.micro"
  records_ip    = [var.instance_names[count.index] == "Web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}

