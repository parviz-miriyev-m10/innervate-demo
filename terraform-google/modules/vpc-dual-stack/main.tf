module "dual-stack-vpc-module" {
  source  = "terraform-google-modules/network/google"

  auto_create_subnetworks = var.auto_create_subnetworks
  delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
  egress_rules  = var.egress_rules
  ingress_rules = var.ingress_rules

  project_id   = var.project_id
  network_name = var.network_name
  mtu          = 1460

  enable_ipv6_ula = var.enable_ipv6_ula
  routes = var.routes
  shared_vpc_host = var.shared_vpc_host

  routing_mode = "GLOBAL"
  subnets = var.subnets

  secondary_ranges = var.secondary_ranges
}