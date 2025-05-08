resource "aws_autoscaling_group" "wordpress_asg" {
  name = "${var.project}-wordpress-instances-${var.stage}"
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  vpc_zone_identifier       = var.public_subnet_ids
  target_group_arns         = var.target_group_arns
  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-wordpress-instances-${var.stage}"
    propagate_at_launch = true
  }
}
