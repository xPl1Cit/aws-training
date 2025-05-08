resource "aws_efs_file_system" "wordpress" {
  creation_token = "wordpress-${var.project}-${var.stage}"
  performance_mode = "generalPurpose"
  encrypted = true
  tags = {
    Name = "${var.project}-wordpress-efs-${var.stage}"
  }
}

resource "aws_efs_mount_target" "wordpress" {
  for_each = var.private_app_subnet_ids

  file_system_id  = aws_efs_file_system.wordpress.id
  subnet_id       = each.value
  security_groups = [var.security_group_efs_id]
}

