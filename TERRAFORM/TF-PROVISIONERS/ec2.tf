resource "aws_instance" "web" {
  ami                    = "ami-03265a0778a880afb"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test-all.id]

  tags = {
    Name = "Test"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

  connection {
    type     = "ssh"
    user     = "centos"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'okay remote-exec' > /tmp/remote.txt",
      "sudo yum install nginx -y",
      "sudo systemctl start nginx",
    ]
  }
}



