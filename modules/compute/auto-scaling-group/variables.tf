variable "project" {
  description = "The AWS Project Name."
  type        = string
}

variable "stage" {
  description = "The Deployment Stage."
  type        = string
}

variable "desired_capacity" {
  description = "The desired amount of EC2 instances to be launched."
  type        = number
}

variable "min_size" {
  description = "The minimum amount of EC2 instances to be launched."
  type        = number
}

variable "max_size" {
  description = "The maximum amount of EC2 instances to be launched."
  type        = number
}

variable "launch_configuration_id" {
  description = "The ID for the launch configuration to be used by the EC2 instances."
  type        = string
}

variable "target_group_arns" {
  description = "The Target Groups that the EC2 instances will be registered with."
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "The List of public subnet IDs."
  type        = list(string)
}