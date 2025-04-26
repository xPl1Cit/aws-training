output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
  description = "The IDs of the public subnets"
}

output "private_db_subnet_ids" {
  value = module.subnets.private_db_subnet_ids
  description = "The IDs of the private db subnets"
}

output "private_app_subnet_ids" {
  value = module.subnets.private_app_subnet_ids
  description = "The IDs of the private app subnets"
}

output "ec2_sg_id" {
  value       = module.security_groups.ec2_sg_id
  description = "The ID of the security group for the EC2 instances"
}

output "efs_sg_id" {
  value       = module.security_groups.efs_sg_id
  description = "The ID of the security group for the EFS instance"
}

output "bastion_sg_id" {
  value       = module.security_groups.bastion_sg_id
  description = "The ID of the security group for the Bastion host"
}

output "rds_sg_id" {
  value       = module.security_groups.rds_sg_id
  description = "The ID of the security group for the RDS DB"
}

output "load_balancer_dns" {
  value = module.application_load_balancer.load_balancer_dns
  description = "The DNS name of the ALB."
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = module.application_load_balancer.target_group_arn
}