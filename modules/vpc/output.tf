output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "igw_id" {
  description = "The ID of the VPC"
  value       = aws_internet_gateway.igw[0].id
}