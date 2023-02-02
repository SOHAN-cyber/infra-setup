variable "name" {
  description = "Name of the nat to be created"
  type        = string
  default     = "ld-non-prod"
}

variable "tags" {
  description = "Additional tags for the nat"
  type        = map(string)
  default = {
    "owner" = "ot-ld"
    "env"   = "non-prod"
  }
}

variable "vpc_id" {
  description = "Id of the vpc "
  type        = string
 
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
  default     = [80,443]
}

variable "nacl_egress_to_port" {
  description = "The to port to match rule in NACl egress"
  type        = list(number)
  default     = [80,443]
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
  default     = [80,443]
}

variable "nacl_ingress_to_port" {
  description = "The to port to match rule in NACl ingress"
  type        = list(number)
  default     = [80,443]
}

variable "nacl_cidr_block" {
  description = "nacl source CIDR"
  type        = string
}

 variable "subnet_ids" {}
