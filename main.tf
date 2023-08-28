provider "aws" {
  region = var.base.region
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.base.name
  cidr = var.base.cidr_block
  azs  = local.azs

  public_subnets      = local.public_subnets
  public_subnet_names = local.public_subnet_names

  private_subnets      = local.private_subnets
  private_subnet_names = local.private_subnet_names

  database_subnets = local.database_subnets
  database_subnet_names = local.database_subnet_names

  elasticache_subnets = local.elasticache_subnets
  elasticache_subnet_names = local.elasticache_subnet_names

  create_igw = true

  tags = var.vpc_tags
}

# resource "aws_route" "public_subnet_route_table_to_igw_route" {
#   for_each = module.vpc.public_route_table_ids
#   public_route_table_id = each.value
#   route_table_id = public_route_table_id.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id = module.vpc.igw_id
# }