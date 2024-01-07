resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type == "user" ? "t2.small" : "t2.micro"
}
