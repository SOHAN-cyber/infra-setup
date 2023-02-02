variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.10.0.0/16"
}


variable "name" {
  description = "Name of the VPC to be created"
  type        = string
  default     = "ld-non-prod"
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default = {
    "owner" = "ot-ld"
    "env"   = "non-prod"
  }
}

variable "public_subnets_cidr" {
  description = "CIDR list for public subnet"
  type        = list(string)
  default     = ["10.10.208.0/21", "10.10.216.0/21"]
}

variable "private_subnets_cidr" {
  description = "CIDR list for private subnet"
  type        = list(string)
  default     = ["10.10.224.0/24", "10.10.225.0/24", "10.10.226.0/24", "10.10.227.0/24", "10.10.228.0/24", "10.10.229.0/24"]
}

variable "avaialability_zones" {
  description = "List of avaialability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_web_sg_name" {
  type    = string
  default = "public_security_group"
}

variable "lb_log_bucket_name" {
  description = "Name of bucket where we would be storing our logs"
  type        = string
  default     = "opstr-log-tree1"
}
variable "internal_alb" {
  description = "alb internal or not"
  type        = bool
  default     = false
}



variable "pvt_zone_name" {
  description = "Name of private zone"
  type        = string
  default     = "lenden.com"
}

variable "pub_subnet_name" {
  description = "public subnet name"
  type        = list(string)
  default     = ["ld-np-pub-subnet-1", "ld-np-pub-subnet-2"]
}

variable "pvt_subnet_name" {
  description = "private subnet name"
  type        = list(string)
  default     = ["ld-np-app-pvt-subnet-1", "ld-np-app-pvt-subnet-2", "ld-np-db-pvt-subnet-1", "ld-np-db-pvt-subnet-2", "ld-np-middleware-pvt-subnet-1", "ld-np-middleware-pvt-subnet-2"]
}




variable "enable_vpc_logs" {
  type    = bool
  default = true
}

variable "enable_alb_logging" {
  type    = bool
  default = true
}

variable "alb_certificate_arn" {
  description = "Cretificate arn for alb"
  type        = string
  default     = null
}

variable "enable_deletion_protection" {
  type    = bool
  default = true
}

variable "enable_igw_publicRouteTable_PublicSubnets_resource" {
  type        = bool
  description = "This variable is used to create IGW, Public Route Table and Public Subnets"
  default     = true
}

variable "enable_nat_privateRouteTable_PrivateSubnets_resource" {
  type        = bool
  description = "This variable is used to create NAT, Private Route Table and Private Subnets"
  default     = true
}

variable "enable_public_web_security_group_resource" {
  type        = bool
  description = "This variable is to create Web Security Group"
  default     = true
}

variable "single_nat_gateway" {
  description = "Do you want to create a single nat gateway"
  type        = bool
  default     = false
}



variable "enable_pub_alb_resource" {
  type        = bool
  description = "This variable is to create ALB"
  default     = true
}

variable "enable_aws_route53_zone_resource" {
  type        = bool
  description = "This variable is to create Route 53 Zone"
  default     = true
}



variable "enable_vpc_endpoint" {
  description = "Do you want to enable vpc endpoint"
  type        = bool
  default     = true
}

variable "enable_pub_alb" {
  description = "do you want to enable public alb"
  type        = bool
  default     = true
}

variable "acl_type" {
  description = "acl type you want to create"
  type        = string
  default     = "private"
}

variable "force_destroy" {
  description = "Do you want to enable force destroy"
  type        = bool
  default     = true
}


