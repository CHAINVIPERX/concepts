module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region          = "us-east-1"
  cluster_name        = "minikube"
  aws_instance_type   = "t3.medium"
  ssh_public_key      = "~/.ssh/sshkey.pub"
  aws_subnet_id       = "subnet-00207a36377e00b23"
  ami_image_id        = "ami-b81dbfc5"
  hosted_zone         = "ladoo.shop"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}
