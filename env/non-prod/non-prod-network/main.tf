module "network" {
  source               = "../../../network-skeleton"
  cidr_block           = var.cidr_block
  name                 = var.name
  avaialability_zones  = var.avaialability_zones
  pub_subnet_name      = var.pub_subnet_name
  pvt_subnet_name      = var.pvt_subnet_name
  single_nat_gateway   = var.single_nat_gateway
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
  internal_alb         = var.internal_alb
  lb_log_bucket_name   = var.lb_log_bucket_name
  tags                 = var.tags

}
module "public_subnets_nacl" {
  count                  = var.enable_nacl ? 1 : 0
  source                 = "../../../modules/nacl"
  name                   = format("%s-public-sb", var.name)
  tags                   = var.tags
  vpc_id                 = module.network.vpc_id
  nacl_egress_rule_no    = var.nacl_egress_rule_no
  nacl_egress_protocol   = var.nacl_egress_protocol
  nacl_egress_action     = var.nacl_egress_action
  nacl_egress_from_port  = var.nacl_egress_from_port
  nacl_egress_to_port    = var.nacl_egress_to_port
  nacl_ingress_to_port   = var.nacl_ingress_to_port
  nacl_ingress_rule_no   = var.nacl_ingress_rule_no
  nacl_ingress_protocol  = var.nacl_ingress_protocol
  nacl_ingress_action    = var.nacl_ingress_action
  nacl_cidr_block        = var.nacl_cidr_block
  nacl_ingress_from_port = var.nacl_ingress_from_port
  subnet_ids             = module.network.public_subnet_ids[count.index]
}

module "middle_subnets_nacl" {
  count                  = var.enable_nacl ? 1 : 0
  source                 = "../../../modules/nacl"
  name                   = format("%s-middle-sb", var.name)
  tags                   = var.tags
  vpc_id                 = module.network.vpc_id
  nacl_egress_rule_no    = var.nacl_egress_rule_no
  nacl_egress_protocol   = var.nacl_egress_protocol
  nacl_egress_action     = var.nacl_egress_action
  nacl_egress_from_port  = var.nacl_egress_from_port
  nacl_egress_to_port    = var.nacl_egress_to_port
  nacl_ingress_to_port   = var.nacl_ingress_to_port
  nacl_ingress_rule_no   = var.nacl_ingress_rule_no
  nacl_ingress_protocol  = var.nacl_ingress_protocol
  nacl_ingress_action    = var.nacl_ingress_action
  nacl_cidr_block        = var.nacl_cidr_block
  nacl_ingress_from_port = var.nacl_ingress_from_port
  subnet_ids             = [module.network.pvt_subnet_ids[0][2], module.network.pvt_subnet_ids[0][3]]
}

module "database_subnets_nacl" {
  count                  = var.enable_nacl ? 1 : 0
  source                 = "../../../modules/nacl"
  name                   = format("%s-database-sb", var.name)
  tags                   = var.tags
  vpc_id                 = module.network.vpc_id
  nacl_egress_rule_no    = var.nacl_egress_rule_no
  nacl_egress_protocol   = var.nacl_egress_protocol
  nacl_egress_action     = var.nacl_egress_action
  nacl_egress_from_port  = var.nacl_egress_from_port
  nacl_egress_to_port    = var.nacl_egress_to_port
  nacl_ingress_to_port   = var.nacl_ingress_to_port
  nacl_ingress_rule_no   = var.nacl_ingress_rule_no
  nacl_ingress_protocol  = var.nacl_ingress_protocol
  nacl_ingress_action    = var.nacl_ingress_action
  nacl_cidr_block        = var.nacl_cidr_block
  nacl_ingress_from_port = var.nacl_ingress_from_port
  subnet_ids             = [module.network.pvt_subnet_ids[0][4], module.network.pvt_subnet_ids[0][5]]
}

module "application_subnets_nacl" {
  count                  = var.enable_nacl ? 1 : 0
  source                 = "../../../modules/nacl"
  name                   = format("%s-application-sb", var.name)
  tags                   = var.tags
  vpc_id                 = module.network.vpc_id
  nacl_egress_rule_no    = var.nacl_egress_rule_no
  nacl_egress_protocol   = var.nacl_egress_protocol
  nacl_egress_action     = var.nacl_egress_action
  nacl_egress_from_port  = var.nacl_egress_from_port
  nacl_egress_to_port    = var.nacl_egress_to_port
  nacl_ingress_to_port   = var.nacl_ingress_to_port
  nacl_ingress_rule_no   = var.nacl_ingress_rule_no
  nacl_ingress_protocol  = var.nacl_ingress_protocol
  nacl_ingress_action    = var.nacl_ingress_action
  nacl_cidr_block        = var.nacl_cidr_block
  nacl_ingress_from_port = var.nacl_ingress_from_port
  subnet_ids             = [module.network.pvt_subnet_ids[0][0], module.network.pvt_subnet_ids[0][1]]
}