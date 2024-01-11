resource "aws_instance" "ec2" {
  ami           = "ami-03265a0778a880afb"
  instance_type = lookup(var.instance_type, terraform.workspace)
  #vpc_security_group_ids = "vpc-00f2c39f424c95f81"

  tags = {
    Name = "Test"
  }
}
