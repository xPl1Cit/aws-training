variable "project" {
  description = "The AWS Project Name."
  type        = string
}

variable "stage" {
  description = "The Deployment Stage."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "internet_gw_id" {
  description = "The Internet Gateway ID."
  type        = string
}

variable "nat_gw_id" {
  description = "The NAT Gateway ID."
  type        = string
}

variable "public_subnet_ids" {
  description = "The IDs used for public subnets."
  type = list(string)
}

variable "private_app_subnet_ids" {
  description = "The IDs used for private application subnets."
  type = list(string)
}

variable "private_db_subnet_ids" {
  description = "The IDs used for private database subnets."
  type = list(string)
}