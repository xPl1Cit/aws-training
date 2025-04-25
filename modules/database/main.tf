resource "aws_db_subnet_group" "wordpress" {
  name        = "${var.project}-wordpress-db-subnet-group-${var.stage}"
  subnet_ids  = var.private_db_subnet_ids

  tags = {
    Name = "${var.project}-wordpress-db-subnet-group-${var.stage}"
  }
}

resource "aws_db_instance" "wordpress" {
  identifier        = "${var.project}-wordpress-db-${var.stage}"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = var.db_instance_type 
  allocated_storage = 20
  max_allocated_storage = 100
  db_subnet_group_name = aws_db_subnet_group.wordpress.name
  multi_az          = true 
  storage_type      = "gp2"
  publicly_accessible = false 
  username          = var.db_username
  password          = var.db_password
  db_name           = var.db_name
  port              = 3306
  backup_retention_period = 7
  deletion_protection = true
  auto_minor_version_upgrade = true
  tags = {
    Name = "${var.project}-wordpress-db-${var.stage}"
  }

  final_snapshot_identifier = "${var.project}-wordpress-db-snapshot-${var.stage}"
}
