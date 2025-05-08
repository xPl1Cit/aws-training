resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project}-vpc-${var.stage}"
  }
}

module "internet_gateway" {
    source = "../internet_gw"
    project = var.project
    stage = var.stage

    vpc_id = aws_vpc.main.id 
}

module "nat_gateway" {
  source = "../nat_gw"
  project = var.project
  stage = var.stage
  region = var.region

  vpc_id = aws_vpc.main.id

  public_subnet_ids = module.subnets.public_subnet_ids
  private_subnet_ids = module.subnets.private_app_subnet_ids
}

module "subnets" {
  source = "../subnets"
  project = var.project
  stage = var.stage
  availability_zones = var.availability_zones
  vpc_id = aws_vpc.main.id
  public_subnet_cidrs = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs = var.private_db_subnet_cidrs
}

module "route_tables" {
  source = "../route_tables"
  project = var.project
  stage = var.stage
  vpc_id = aws_vpc.main.id
  internet_gw_id = module.internet_gateway.internet_gateway_id
  nat_gw_id = module.nat_gateway.nat_gateway_id
  public_subnet_ids = module.subnets.public_subnet_ids
  private_app_subnet_ids = module.subnets.private_app_subnet_ids
  private_db_subnet_ids = module.subnets.private_db_subnet_ids
}

module "security_groups" {
  source = "../security_groups"
  project = var.project
  stage = var.stage
  vpc_id = aws_vpc.main.id
}

module "application_load_balancer" {
    source = "../alb"
    project = var.project
    stage = var.stage
    vpc_id = aws_vpc.main.id
    public_subnet_ids = module.subnets.public_subnet_ids
    security_group_ids = [module.security_groups.alb_sg_id]
} 