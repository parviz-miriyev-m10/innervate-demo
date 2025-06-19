data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                            = "terraform-google-modules/kubernetes-engine/google"
  project_id                        = var.project_id
  name                              = var.name
  regional                          = var.regional
  region                            = var.region
  zones                             = var.zones
  enable_cost_allocation            = var.enable_cost_allocation
  stateful_ha                       = var.stateful_ha
  network                           = var.network
  subnetwork                        = var.subnetwork
  ip_range_pods                     = var.ip_range_pods
  additional_ip_range_pods          = var.additional_ip_range_pods
  enable_identity_service           = var.enable_identity_service
  grant_registry_access             = var.grant_registry_access
  ip_range_services                 = var.ip_range_services
  http_load_balancing               = var.http_load_balancing
  network_policy                    = var.network_policy
  horizontal_pod_autoscaling        = var.horizontal_pod_autoscaling
  enable_vertical_pod_autoscaling   = var.enable_vertical_pod_autoscaling
  filestore_csi_driver              = var.filestore_csi_driver
  dns_cache                         = var.dns_cache
  stack_type                        = var.stack_type
  datapath_provider                 = var.datapath_provider
  create_service_account            = var.create_service_account
  remove_default_node_pool          = var.remove_default_node_pool
  disable_legacy_metadata_endpoints = var.disable_legacy_metadata_endpoints
  deletion_protection               = var.deletion_protection
  service_account                   = var.service_account
  logging_variant                   = var.logging_variant
  logging_service                   = var.logging_service
  monitoring_service                = var.monitoring_service
  master_authorized_networks        = var.master_authorized_networks
  add_cluster_firewall_rules        = var.add_cluster_firewall_rules
  firewall_inbound_ports            = var.firewall_inbound_ports
  release_channel                   = var.release_channel
  default_max_pods_per_node         = var.default_max_pods_per_node
  network_policy_provider           = var.network_policy_provider
  monitoring_enable_managed_prometheus = var.monitoring_enable_managed_prometheus

  node_pools = var.node_pools

  node_pools_oauth_scopes = var.node_pools_oauth_scopes
  node_pools_labels = var.node_pools_labels
  node_pools_metadata = var.node_pools_metadata
  node_pools_taints = var.node_pools_taints
  node_pools_tags = var.node_pools_tags

  cluster_autoscaling = var.cluster_autoscaling
}

module "gke_auth" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/auth"
  for_each = var.enable_gke_auth ? { "active" = true } : {}

  project_id   = var.project_id
  location     = module.gke.location
  cluster_name = module.gke.name
}