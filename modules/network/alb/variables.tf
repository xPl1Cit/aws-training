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

variable "security_group_ids" {
    description = "The Security Group IDs applied to the ALB."
    type = list(string)
}

variable "public_subnet_ids" {
  description = "The public subnet Ids that the ALB should be connected to."
  type = list(string)
}