variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.10.0.0/16"
}


variable "name" {
  description = "Name of the VPC to be created"
  type        = string
  default     = "ld-vpc"
}

variable "avaialability_zones" {
  description = "List of avaialability zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}


variable "pvt_rt_name" {
  description = "Name of the private route table"
  type        = list(string)
  default     = ["ld-private-1", "ld-private-2"]
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

variable "single_nat_gateway" {
  description = "Do you want to create a single nat gateway"
  type        = bool
  default     = false
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


variable "internal_alb" {
  description = "alb internal or not"
  type        = bool
  default     = false
}

variable "lb_log_bucket_name" {
  description = "Name of bucket where we would be storing our logs"
  type        = string
  default     = "opstr-log-tree1"
}
variable "region" {
  description = "infra region"
  type        = string
  default     = "ap-south-1"
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default = {
    "owner" = "ot-ld"

  }
}


variable "default_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default = {
    "createdBy" = "terraform"
    "env"       = "non-prod"

  }
}


###########################nacl vars#############33
variable "enable_nacl" {
  description = "Do you want to enable nacl or not"
  type        = bool
  default     = true
}

variable "nacl_egress_rule_no" {
  description = "Starting rule number for the entry in NACL egress rule"
  default     = 200
}
variable "nacl_egress_protocol" {
  description = "Protocol on which NACL egress rule applied. If using the -1 'all' protocol,"
  default     = "tcp"
}

variable "nacl_egress_action" {
  description = "Action to allow or deny the traffic that matches the rule"
  default     = "allow"
}

variable "nacl_egress_from_port" {
  description = "The from port to match rule in NACl egress"
  type        = list(number)
  default     = [80, 443, 53, 22, 1024]
}

variable "nacl_egress_to_port" {
  description = "The to port to match rule in NACl egress"
  type        = list(number)
  default     = [80, 443, 53, 22, 65535]
}

variable "nacl_ingress_rule_no" {
  description = "Starting rule number for the entry in NACL ingress rule"
  default     = 100
}

variable "nacl_ingress_protocol" {
  description = "Protocol on which NACL ingress rule applied. If using the -1 'all' protocol,"
  default     = "tcp"
}

variable "nacl_ingress_action" {
  description = "Action to allow or deny the traffic that matches the rule"
  default     = "allow"
}

variable "nacl_ingress_from_port" {
  description = "The from port to match rule in NACl ingress"
  type        = list(number)
  default     = [80, 443, 53, 22, 1024]
}

variable "nacl_ingress_to_port" {
  description = "The to port to match rule in NACl ingress"
  type        = list(number)
  default     = [80, 443, 53, 22, 65535]
}

variable "nacl_cidr_block" {
  description = "nacl source CIDR"

  default = "0.0.0.0/0"
}