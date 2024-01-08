resource "aws_instance" "web" {
  for_each      = var.instance_names
  ami           = var.ami_id
  instance_type = each.value
  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "www" {
  for_each = aws_instance.web
  zone_id  = var.zone_id
  name     = "${lower(each.key)}.ladoo.shop"
  type     = "A"
  ttl      = 300
  records  = [each.key == "Web" ? each.value.public_ip : each.value.private_ip]
}
