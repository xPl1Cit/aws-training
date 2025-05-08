output "load_balancer_dns" {
  value = aws_lb.app_lb.dns_name
  description = "The DNS name of the ALB."
}

output "target_group_arn" {
  description = "The ARN of the target group"
  value       = aws_lb_target_group.tg.arn
}