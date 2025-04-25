resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2" {
  key_name   = "${var.project}-key-pair-${var.stage}"
  public_key = tls_private_key.ec2.public_key_openssh
}