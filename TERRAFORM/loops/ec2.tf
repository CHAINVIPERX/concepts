resource "aws_instance" "web" {
  #count         = 11
  count         = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names[count.index] == "MongoDB" || var.instance_names[count.index] == "Shipping" || var.instance_names[count.index] == "Mysql" ? "t2.small" : "t2.micro"
  tags = {
    Name = var.instance_names[count.index]
  }
}

resource "aws_route53_record" "www" {
  #count   = 11
  count   = length(var.instance_names)
  zone_id = var.zone_id
  name    = "${lower(var.instance_names[count.index])}.ladoo.shop"
  type    = "A"
  ttl     = 300
  records = [var.instance_names[count.index] == "Web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}
