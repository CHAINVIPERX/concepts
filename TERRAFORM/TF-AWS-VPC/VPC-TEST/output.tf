output "a_zone" {
  value = module.robo-vpc.a_zone
}
output "vpc_id" {
  value = module.robo-vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.robo-vpc.public_subnet_ids
}
output "private_subnet_ids" {
  value = module.robo-vpc.private_subnet_ids
}
output "database_subnet_ids" {
  value = module.robo-vpc.database_subnet_ids
}
