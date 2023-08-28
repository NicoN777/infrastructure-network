output "main" {
  description = "VPC Information"
  value = {
    id                  = module.vpc.vpc_id
    arn                 = module.vpc.vpc_arn
    cidr_block          = module.vpc.vpc_cidr_block
    main_route_table_id = module.vpc.vpc_main_route_table_id
    owner               = module.vpc.vpc_owner_id
    default_security_group_id = module.vpc.default_security_group_id
  }
}

output "public" {
  description = "Public Components of VPC"
  value = {
    igw_arn     = module.vpc.igw_arn
    igw_id      = module.vpc.igw_id
    subnet_ids  = module.vpc.public_subnets
    subnet_arns = module.vpc.public_subnet_arns
    subnet_cidr_blocks         = module.vpc.public_subnets_cidr_blocks
    route_table_ids            = module.vpc.public_route_table_ids
    route_table_assocation_ids = module.vpc.public_route_table_association_ids
    nat_ids        = module.vpc.nat_ids
    nat_public_ips = module.vpc.nat_public_ips
    natgw_ids      = module.vpc.natgw_ids
  }
}

output "private" {
  description = "Private Components of VPC"
  value = {
    subnet_ids  = module.vpc.private_subnets
    subnet_arns = module.vpc.private_subnet_arns
    subnet_cidr_blocks         = module.vpc.private_subnets_cidr_blocks
    route_table_ids            = module.vpc.private_route_table_ids
    route_table_assocation_ids = module.vpc.private_route_table_association_ids
  }
}

output "database" {
  description = "VPC Components for Database Subnets"
  value = {
    subnets = module.vpc.database_subnets
    subnet_arns = module.vpc.database_subnet_arns
    subnets_cidr_blocks = module.vpc.database_subnets_cidr_blocks
    subnet_group = module.vpc.database_subnet_group
    subnet_group_name = module.vpc.database_subnet_group_name
  }
}

output "debug" {
  description = "Debugger"
  value = {
    data = module.vpc.private_subnets
  }
}