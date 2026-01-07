output "cluster_name" {
  description = "AWS EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "Endpoint for AWS EKS"
  value       = module.eks.cluster_endpoint
}

output "region" {
  description = "AWS region"
  value       = var.region
}









