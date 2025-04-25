output "efs_dns_name" {
  value = aws_efs_file_system.wordpress.dns_name
  description = "The DNS name of the EFS file system"
}