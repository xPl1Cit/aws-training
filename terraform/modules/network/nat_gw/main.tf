resource "aws_eip" "nat_gateway_eip" {
  network_border_group = var.region
  
  tags = {
    Name = "${var.project}-nat-gateway-eip-${var.stage}"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = var.public_subnet_ids[0]
  
  tags = {
    Name = "${var.project}-nat-gateway-${var.stage}"
  }
}
