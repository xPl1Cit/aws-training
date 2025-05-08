output "public_subnet_ids" {
  value = aws_subnet.public[*].id
  description = "The IDs of the public subnets"
}

output "private_app_subnet_ids" {
  value = aws_subnet.private_app[*].id
  description = "The IDs of the private app subnets"
}

output "private_subnet_ids" {
  value = concat(aws_subnet.private_db[*].id, aws_subnet.private_app[*].id)
  description = "The IDs of the private app and db subnets combined"
}

output "private_db_subnet_ids" {
  value = aws_subnet.private_db[*].id
  description = "The IDs of the private db subnets"
}