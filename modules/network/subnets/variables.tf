variable "project" {
  description = "The AWS Project Name."
  type        = string
}

variable "stage" {
  description = "The Deployment Stage."
  type        = string
}

variable "availability_zones" {
  description = "The AWS availablity zones used for public subnets."
  type = list(string)
}

variable "public_subnet_cidrs" {
  description = "The CIDRs used for public subnets."
  type = list(string)
}

variable "private_app_subnet_cidrs" {
  description = "The CIDRs used for private application subnets."
  type = list(string)
}

variable "private_db_subnet_cidrs" {
  description = "The CIDRs used for private database subnets."
  type = list(string)
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}