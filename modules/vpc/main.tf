resource "aws_vpc" "main" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block

  tags = merge(
    {
      "Name" = format("%s", "${var.name}-vpc")
    },
    var.tags,
  )
}

resource "aws_flow_log" "vpc_flow_logs" {
  count                    = var.enable_vpc_logs == true ? 1 : 0
  log_destination          = var.logs_bucket_arn
  log_destination_type     = var.log_destination_type
  traffic_type             = var.traffic_type
  vpc_id                   = aws_vpc.main.id
  max_aggregation_interval = var.max_aggregation_interval
  destination_options {
    file_format                = var.file_format
    per_hour_partition         = var.enable_per_hourPartition
    hive_compatible_partitions = var.hive_compatible_partitions
  }
}

resource "aws_internet_gateway" "igw" {
  count  = var.enable_igw_publicRouteTable_PublicSubnets_resource == true ? 1 : 0
  vpc_id = aws_vpc.main.id
  tags = merge(
    {
      "Name" = format("%s-igw", var.name)
    },
    var.tags,
  )
}