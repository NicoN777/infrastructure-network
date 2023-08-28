variable "base" {
  description = "Base Configurations"
  type        = map(string)
  default = {
    "network_reserved"                 = "192.168"
    "region"                           = "us-east-1"
    "team"                             = "pika"
    "name"                             = "vpc-pika"
    "cidr_block"                       = "192.168.0.0/16"
  }
}

data "aws_availability_zones" "available" {}

locals {
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  public_subnets     = [for k, v in local.azs: cidrsubnet(var.base.cidr_block, 8, k)]
  public_subnet_names     = [for az in local.azs : "${var.base.name}-public-subnet-${az}"]
  

  private_subnets     = [for k, v in local.azs: cidrsubnet(var.base.cidr_block, 8, k+4)]
  private_subnet_names     = [for az in local.azs : "${var.base.name}-private-subnet-${az}"]

  database_subnets    = [for k, v in local.azs : cidrsubnet(var.base.cidr_block, 8, k + 8)]
  database_subnet_names = [for az in local.azs : "${var.base.name}-database-subnet-${az}"]

  elasticache_subnets = [for k, v in local.azs : cidrsubnet(var.base.cidr_block, 8, k + 12)]
  elasticache_subnet_names = [for az in local.azs : "${var.base.name}-elasticache-subnet-${az}"]
  
}


variable "vpc_tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Team = "pika"
    
  }
}


