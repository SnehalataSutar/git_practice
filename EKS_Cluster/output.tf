output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_id
}

output "kubeconfig_command" {
  //value = "aws eks --region ${var.region} update-kubeconfig --name ${module.eks.cluster_id}"
  value = var.region != null && module.eks.cluster_id != null ? "aws eks --region ${var.region} update-kubeconfig --name ${module.eks.cluster_id}" : "Cluster not created yet"

}




# cluster_endpoint = "https://EF51AA8E6A016EADF774B08FACF06CDD.gr7.us-east-1.eks.amazonaws.com"
# kubeconfig_command = "Cluster not created yet"