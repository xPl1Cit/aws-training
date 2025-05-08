output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "The ID of the security group for the Application Load Balancer (ALB)"
}

output "ec2_sg_id" {
  value       = aws_security_group.ec2_sg.id
  description = "The ID of the security group for the EC2 instances"
}

output "bastion_sg_id" {
  value       = aws_security_group.bastion_sg.id
  description = "The ID of the security group for the Bastion host"
}

output "efs_sg_id" {
  value       = aws_security_group.efs_sg.id
  description = "The ID of the security group for the EFS Storage"
}

output "rds_sg_id" {
  value       = aws_security_group.rds_sg.id
  description = "The ID of the security group for the RDS DB"
}