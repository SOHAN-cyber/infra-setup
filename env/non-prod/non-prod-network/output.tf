output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "pub_route_table_id" {
  description = "Public route table ID"
  value       = module.network.pub_route_table_id
}

output "pvt_route_table_id" {
  description = "Private Route table ID"
  value       = module.network.pvt_route_table_id
}

output "pvt_hosted_zone_id" {
  description = "hosted zone id"
  value       = module.network.pvt_hosted_zone_id
}

output "pvt_subnet_ids" {
  value = module.network.pvt_subnet_ids
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "nat_gateway_id" {
  value = module.network.nat_gateway_id
}
output "nat_ip" {
  value = module.network.nat_ip
}

output "web_sg_id" {
  value = module.network.web_sg_id
}

output "dns_name" {
  description = "DNS of ALB"
  value       = module.network.dns_name
}
output "aws_lb_arn" {
  description = "ARN of alb"
  value       = module.network.aws_lb_arn
}

output "alb_listener_arn" {
  description = "ARN of alb listener"
  value       = module.network
}

output "alb_listener1_arn" {
  description = "ARN of alb listener-1"
  value       = module.network.alb_listener_arn
}

output "route53_zone_id" {
  value = module.network.alb_listener_arn
}

output "route53_name" {
  value = module.network.alb_listener_arn
}
# output "public_subnet_nacl_id" {
#   value = module.public_subnets_nacl.nacl_id
# }
# # output "middle_subnets_nacl_id" {
# #   value = module.middle_subnets_nacl.nacl_id
# # }
