resource "aws_security_group" "roboshop-all" {
  name        = "Dynamic-Demo"
  description = "Demo"

  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
      description = ingress.value["description"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    description = "Allow-All-Out"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dynamic"
  }
}
