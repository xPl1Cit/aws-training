resource "aws_launch_configuration" "wordpress" {
  name          = "${var.project}-wordpress-lc-${var.stage}"
  image_id      = var.ami
  instance_type = var.instance_type
  security_groups = [ var.security_group_id ]
  key_name = var.key_name
  
  lifecycle {
    create_before_destroy = true
  }

  user_data = file("${path.module}/install-wordpress.sh")
}
