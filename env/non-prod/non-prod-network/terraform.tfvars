cidr_block           = "10.10.0.0/16"
name                 = "ld-non-prod"
avaialability_zones  = ["ap-south-1a", "ap-south-1b"]
pvt_rt_name          = ["ld-private-1", "ld-private-2"]
pub_subnet_name      = ["ld-non-prod-public-subnet-1", "ld-non-prod-public-subnet-2"]
pvt_subnet_name      = ["ld-non-prod-application-subnet-1", "ld-non-prod-application-subnet-2", "ld-non-prod-middleware-subnet-1", "ld-non-prod-middleware-subnet-2", "ld-non-prod-database-subnet-1", "ld-non-prod-database-subnet-2"]
single_nat_gateway   = false
public_subnets_cidr  = ["10.10.208.0/21", "10.10.216.0/21"]
private_subnets_cidr = ["10.10.224.0/24", "10.10.225.0/24", "10.10.226.0/24", "10.10.227.0/24", "10.10.228.0/24", "10.10.229.0/24"]

internal_alb       = false
lb_log_bucket_name = "ld-non-prod-lb-log"
tags = {
  "owner" = "DEVOPS",

}

default_tags = {
  "createdBy" = "terraform"
  "env"       = "non-prod"
}
region = "ap-south-1"