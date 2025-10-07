# Create VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "cis-demo-vpc"
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Name = "cis-demo"
  }
  create_igw                             = false
  enable_flow_log                        = true
  create_database_internet_gateway_route = false
  enable_network_address_usage_metrics   = true
} 