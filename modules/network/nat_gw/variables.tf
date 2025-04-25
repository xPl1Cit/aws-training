variable "project" {
  description = "The AWS Project Name."
  type        = string
}

variable "stage" {
  description = "The Deployment Stage."
  type        = string
}

variable "region" {
  description = "The AWS region."
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID."
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs where the NAT Gateway will be deployed."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs that will use the NAT Gateway for outbound internet access."
  type        = list(string)
}