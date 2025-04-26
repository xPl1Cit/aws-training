module "vpc" {
  source  = "../../modules/network/vpc"
  project = var.project
  stage   = var.stage
  region = var.region

  vpc_cidr = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
  private_app_subnet_cidrs = var.private_app_subnet_cidrs
  private_db_subnet_cidrs = var.private_db_subnet_cidrs
}

module "database" {
    source = "../../modules/database"
    project = var.project
    stage   = var.stage

    private_db_subnet_ids = module.vpc.private_db_subnet_ids
    rds_sg_id = module.vpc.rds_sg_id
    db_instance_type = var.db_instance_type
    db_name = var.db_name
    db_username = var.db_username
    db_password = var.db_password
}

module "efs" {
  source = "../../modules/storage"
  project = var.project
  stage   = var.stage

  private_app_subnet_ids = {
    for idx, id in module.vpc.private_app_subnet_ids : idx => id
  }
  security_group_efs_id = module.vpc.efs_sg_id
}

module "key_pair" {
  source = "../compute/key-pair"
  project = var.project
  stage   = var.stage
}

module "ec2_launch_configuration" {
  source = "../compute/launch-configuration"
  project = var.project
  stage   = var.stage

  instance_type = var.ec2_instance_type
  ami = var.ami
  security_group_id = module.vpc.ec2_sg_id
  key_name = module.key_pair.key_name

  rds_endpoint = module.database.db_endpoint
  db_name = var.db_name
  db_user = var.db_username
  db_password = var.db_password
 
  load_balancer_dns_name = module.vpc.load_balancer_dns
  efs_dns_name = module.efs.efs_dns_name
}

module "ec2_auto_scaling_group" {
  source = "../compute/auto-scaling-group"
  project = var.project
  stage   = var.stage

  public_subnet_ids = module.vpc.private_app_subnet_ids
  
  launch_configuration_id = module.ec2_launch_configuration.launch_configuration_id
  target_group_arns = [ module.vpc.target_group_arn ]

  desired_capacity = var.desired_capacity
  min_size = var.min_size
  max_size = var.max_size
}

module "bastion" {
  source = "../compute/bastion"
  project = var.project
  stage = var.stage

  bastion_security_group_id = module.vpc.bastion_sg_id
  public_subnet_ids = module.vpc.public_subnet_ids
  ami = var.bastion_ami
  instance_type = var.bastion_instance_type
  key_name = module.key_pair.key_name
}