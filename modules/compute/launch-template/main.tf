resource "aws_launch_template" "wordpress" {
  name_prefix   = "${var.project}-wordpress-lt-${var.stage}-"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = base64encode(templatefile("${path.module}/install-wordpress.sh.tpl", {
  efs_dns_name          = var.efs_dns_name,
  db_name               = var.db_name,
  db_user               = var.db_user,
  db_password           = var.db_password,
  rds_endpoint          = var.rds_endpoint,
  load_balancer_dns_name = var.load_balancer_dns_name
}))

  lifecycle {
    create_before_destroy = true
  }
}
