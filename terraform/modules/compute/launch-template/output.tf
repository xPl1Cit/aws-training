output "launch_template_id" {
  description = "The ID of the launch template for the WordPress EC2 instances"
  value       = aws_launch_template.wordpress.id
}