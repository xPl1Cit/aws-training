resource "aws_autoscaling_group" "wordpress_asg" {
  name = "${var.project}-wordpress-instances-${var.stage}"
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  vpc_zone_identifier       = var.public_subnet_ids
  launch_configuration      = var.launch_configuration_id
  target_group_arns         = var.target_group_arns
  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "${var.project}-wordpress-instances-${var.stage}"
    propagate_at_launch = true
  }
}
