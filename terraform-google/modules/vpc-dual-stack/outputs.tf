output "network_name" {
  value       = module.dual-stack-vpc-module.network_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = module.dual-stack-vpc-module.network_self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value       = module.dual-stack-vpc-module.project_id
  description = "VPC project id"
}

output "subnets_names" {
  value       = module.dual-stack-vpc-module.subnets_names
  description = "The names of the subnets being created"
}

output "subnets_ips" {
  value       = module.dual-stack-vpc-module.subnets_ips
  description = "The IP and cidrs of the subnets being created"
}

output "subnets_regions" {
  value       = module.dual-stack-vpc-module.subnets_regions
  description = "The region where subnets will be created"
}

output "subnets_private_access" {
  value       = module.dual-stack-vpc-module.subnets_private_access
  description = "Whether the subnets will have access to Google API's without a public IP"
}

output "subnets_flow_logs" {
  value       = module.dual-stack-vpc-module.subnets_flow_logs
  description = "Whether the subnets will have VPC flow logs enabled"
}

output "route_names" {
  value       = module.dual-stack-vpc-module.route_names
  description = "The routes associated with this VPC"
}