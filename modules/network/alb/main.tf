resource "aws_lb" "app_lb" {
  name               = "${var.project}-lb-${var.stage}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.public_subnet_ids

  enable_deletion_protection = false
  enable_http2              = true
  idle_timeout              = 60

  tags = {
    Name = "${var.project}-igw-${var.stage}"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "${var.project}-target-group-${var.stage}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol = "HTTP"
    path     = "/wp-json"
    port     = "80"
    interval = 30
  }

  tags = {
    Name = "${var.project}-target-group-${var.stage}"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.tg.arn
    type             = "forward"
  }
}