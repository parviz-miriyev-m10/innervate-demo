### VPC ###
output "dual_stack_vpc_summary" {
  description = "Combined output of the VPC Dual-Stack module"
  value = var.enable_dual_stack_vpc ? {
    vpc = {
      network_name            = module.vpc-dual-stack["active"].network_name
      network_self_link       = module.vpc-dual-stack["active"].network_self_link
      project_id              = module.vpc-dual-stack["active"].project_id
      subnets_names           = module.vpc-dual-stack["active"].subnets_names
      subnets_ips             = module.vpc-dual-stack["active"].subnets_ips
      subnets_regions         = module.vpc-dual-stack["active"].subnets_regions
      subnets_private_access  = module.vpc-dual-stack["active"].subnets_private_access
      subnets_flow_logs       = module.vpc-dual-stack["active"].subnets_flow_logs
      route_names             = module.vpc-dual-stack["active"].route_names
    }
  } : null
}

### GKE ###
output "kubernetes_endpoint" {
  description = "The cluster endpoint"
  sensitive   = true
  value       = module.gke.kubernetes_endpoint
}

output "cluster_name" {
  description = "Cluster name"
  value       = module.gke.cluster_name
}

output "location" {
  value = module.gke.location
}

output "master_kubernetes_version" {
  description = "Kubernetes version of the master"
  value       = module.gke.master_kubernetes_version
}

output "ca_certificate" {
  description = "The cluster CA certificate (base64 encoded)"
  value       = module.gke.ca_certificate
  sensitive = true
}

output "service_account" {
  description = "The service account to default running nodes as if not overridden in `node_pools`."
  value       = module.gke.service_account
}

output "region" {
  description = "The region in which the cluster resides"
  value       = module.gke.region
}

output "zones" {
  description = "List of zones in which the cluster resides"
  value       = var.regional ? [var.region] : module.gke.zones
}

output "client_token" {
  description = "The bearer token for auth"
  sensitive   = true
  value       = module.gke.client_token
}

output "type" {
  description = "Cluster type (regional / zonal)"
  value       = module.gke.type
}

output "kubeconfig_raw" {
  sensitive = true
  value = var.enable_gke_auth ? module.gke.kubeconfig_raw : null
}