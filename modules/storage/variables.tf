variable "project" {
  description = "The AWS Project Name."
  type        = string
}

variable "stage" {
  description = "The Deployment Stage."
  type        = string
}

variable "private_app_subnet_ids" {
    description = "The private subnet app IDs."
  type = map(string)
}

variable "security_group_efs_id" {
  type = string
}