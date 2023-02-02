module "vpc" {
  
  source                                             = "../modules/vpc"
  cidr_block                                         = var.cidr_block
  name                                               = var.name
  tags                                               = var.tags
  enable_vpc_logs                                    = var.enable_vpc_logs
  logs_bucket_arn                                    = module.pub_alb[0].bucket_arn
  enable_igw_publicRouteTable_PublicSubnets_resource = var.enable_igw_publicRouteTable_PublicSubnets_resource
}




module "PublicSubnets" {
  source             = "../modules/PublicSubnets"
  count              = var.enable_igw_publicRouteTable_PublicSubnets_resource == true ? 1 : 0
  availability_zones = var.avaialability_zones
  pub_subnet_name    = var.pub_subnet_name
  route_table_id     = module.publicRouteTable.id
  subnets_cidr       = var.public_subnets_cidr
  vpc_id             = module.vpc.vpc_id
  tags               = var.tags

 

}

module "nat-gateway" {
  source             = "../modules/nat-gateway"
  count              = var.enable_nat_privateRouteTable_PrivateSubnets_resource == true ? 1 : 0
  single_nat_gateway = var.single_nat_gateway
  nat_gateway_name   = format("%s-nat-${count.index + 1}", var.name)
  subnets_for_nat_gw = module.PublicSubnets[count.index].ids  
  tags               = var.tags
}

module "publicRouteTable" {
  source     = "../modules/route-table"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "0.0.0.0/0"
  gateway_id = module.vpc.igw_id
  name       = format("%s-pub-rt", var.name)
}

module "privateRouteTable" {
  source             = "../modules/route-table"
  count              = var.single_nat_gateway ? 1 : length(var.public_subnets_cidr)
  cidr_block         = "0.0.0.0/0"
  vpc_id             = module.vpc.vpc_id
  gateway_id         = module.nat-gateway.*.id[0][count.index]
  name               = format("%s-pvt-rt-${count.index + 1}", var.name)
  tags               = var.tags
}


module "PrivateSubnets" {
  source             = "../modules/PrivateSubnets"
  count              = var.enable_nat_privateRouteTable_PrivateSubnets_resource == true ? 1 : 0
  availability_zones = var.avaialability_zones
  single_nat_gateway = var.single_nat_gateway
  pvt_subnet_name    = var.pvt_subnet_name
  subnets_for_nat_gw = module.PublicSubnets[count.index].ids
  subnets_cidr       = var.private_subnets_cidr
  vpc_id             = module.vpc.vpc_id
  route_table_id     = module.privateRouteTable.*.id
  tags               = var.tags
  
}



module "public_web_security_group" {
  source              = "../modules/security_group"
  enable_whitelist_ip = true
  name_sg             = "Public web Security Group"
  vpc_id              = module.vpc.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Rule for port 80"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = ["0.0.0.0/0"]
          source_SG_ID = []
        },
        {
          description  = "Rule for port 443"
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = ["0.0.0.0/0"]
          source_SG_ID = []
        }
      ]
    }
  }
}

module "pub_alb" {
  source                     = "../modules/pub_alb"
  count                      = var.enable_pub_alb ? 1 : 0
  alb_name                   = format("%s-pub", var.name)
  internal                   = var.internal_alb
  force_destroy              = var.force_destroy
  acl_type                   = var.acl_type
  lb_log_bucket_name         = var.lb_log_bucket_name
  security_groups_id         = [module.public_web_security_group.sg_id]
  subnets_id                 = module.PublicSubnets[count.index].ids
  tags                       = var.tags
  enable_logging             = var.enable_alb_logging
  enable_deletion_protection = var.enable_deletion_protection
}

resource "aws_route53_zone" "private_hosted_zone" {
  name = var.pvt_zone_name
  vpc {
    vpc_id = module.vpc.vpc_id
  }
}