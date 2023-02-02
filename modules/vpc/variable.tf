variable "cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.10.0.0/16"
}


variable "assign_generated_ipv6_cidr_block" {
  description = "Do you want to add ipv6 address to your vpc cidr"
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the VPC to be created"
  type        = string
  default     = "ld-vpc"
}

variable "tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default = {
    "owner" = "ot-ld"
    "env"   = "non-prod"
  }
}


variable "logs_bucket_arn" {
  description = "ARN of bucket where we would be storing vpc our logs"
  type        = string
  default     = ""
}
variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "log_destination_type" {
  type    = string
  default = "s3"
}

variable "traffic_type" {
  type    = string
  default = "ALL"
}

variable "enable_vpc_logs" {
  type    = bool
  default = true
}
variable "enable_per_hourPartition" {
  description = "Do you want to create S3 bucket"
  type        = bool
  default     = false
}

variable "hive_compatible_partitions" {
  description = "Hive-compatible prefixes for flow logs stored in Amazon S3"
  type        = bool
  default     = false
}
variable "max_aggregation_interval" {
  description = "(optional) describe your variable"
  type        = number
  default     = 600
}

variable "file_format" {
  description = "In which format you want the logs to created"
  type        = string
  default     = "parquet"
}
variable "enable_igw_publicRouteTable_PublicSubnets_resource" {
  type        = bool
  description = "This variable is used to create IGW, Public Route Table and Public Subnets"
  default     = true
}