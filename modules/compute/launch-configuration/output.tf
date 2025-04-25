output "launch_configuration_id" {
  description = "The ID of the launch configuration for the WordPress EC2 instances"
  value       = aws_launch_configuration.wordpress.id
}