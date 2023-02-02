variable "vpc_id" {}

variable "availability_zones" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "pub_subnet_name" {
  description = "A map of tags to be added to subnets"
  type        = list(string)
}

variable "subnets_cidr" {
  description = "List of CIDR's for subnets"
  type        = list(string)
}

variable "route_table_id" {
  description = "Route table to which subnets will be associated"

}

###########################nacl vars#############33
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
  default     = [80,443,53,22,1024-65535]
}

variable "nacl_egress_to_port" {
  description = "The to port to match rule in NACl egress"
  type        = list(number)
  default     = [80,443,53,22,1024-65535]
}

variable "nacl_ingress_rule_no" {
  description = "Starting rule number for the entry in NACL ingress rule"
  default     = 100
}

variable "nacl_ingress_protocol" {
  description = "Protocol on which NACL ingress rule applied. If using the -1 'all' protocol,"
  default = "tcp"
}

variable "nacl_ingress_action" {
  description = "Action to allow or deny the traffic that matches the rule"
  default     = "allow"
}

variable "nacl_ingress_from_port" {
  description = "The from port to match rule in NACl ingress"
  type        = list(number)
  default     = [80,443,53,22,1024-65535]
}

variable "nacl_ingress_to_port" {
  description = "The to port to match rule in NACl ingress"
  type        = list(number)
  default     = [80,443,53,22,1024-65535]
}

variable "nacl_cidr_block" {
  description = "nacl source CIDR"
  
  default = "0.0.0.0/0"
}
variable "name" {
  description = "Name of the VPC to be created"
  type        = string
  default     = "ld-vpc"
}