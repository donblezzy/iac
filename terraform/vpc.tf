module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = local.cluster_name
  cidr = "172.20.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = ["172.20.1.0/24", "172.20.11.0/24", "172.20.21.0/24"]
  public_subnets  = ["172.20.100.0/24", "172.20.110.0/24", "172.20.120.0/24"]
  intra_subnets   = ["172.20.0.0/24", "172.20.10.0/24", "172.20.20.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true


  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = 1
  }


  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = 1
  }

}





 