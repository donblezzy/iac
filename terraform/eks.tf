module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = local.cluster_name
  kubernetes_version = "1.33"

  vpc_id = module.vpc.vpc_id

  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  endpoint_private_access = true
  endpoint_public_access  = true

  enable_cluster_creator_admin_permissions = true

  addons = {
    vpc-cni                = { before_compute = true }
    coredns                = {}
    kube-proxy             = {}
    eks-pod-identity-agent = { before_compute = true }
  }

  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]

      min_size     = 1
      desired_size = 2
      max_size     = 3
    }

    two = {
      name           = "node-group-2"
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.small"]

      min_size     = 1
      desired_size = 1
      max_size     = 2
    }



  }


}
