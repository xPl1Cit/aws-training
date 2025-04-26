variable "project" {
  description = "The AWS Project Name."
  type        = string
}

variable "stage" {
  description = "The Deployment Stage."
  type        = string
}

variable "ami" {
  description = "The EC2 ami to be launched."
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type to be launched."
  type        = string
}

variable "db_name" {
  description = "The Database Name to connect to on RDS."
  type        = string
}

variable "db_user" {
  description = "The Database Username to connect with on RDS."
  type        = string
}

variable "db_password" {
  description = "The Database Password to connect with on RDS."
  type        = string
}

variable "rds_endpoint" {
  description = "The Database Endpoint to connect to."
  type        = string
}

variable "efs_dns_name" {
  description = "The DNS for the EFS to connect to."
  type        = string
}

variable "load_balancer_dns_name" {
  description = "The DNS for the Load Balancer name for initial Wordpress setup."
  type        = string
}

variable "security_group_id" {
  description = "The ID for the security group of the instances."
  type        = string
}

variable "key_name" {
  description = "The EC2 instance key name to be used."
  type        = string
}