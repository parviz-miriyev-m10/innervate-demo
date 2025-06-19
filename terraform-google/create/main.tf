module "vpc-dual-stack" {
    for_each = var.enable_dual_stack_vpc ? { "active" = true } : {}
    source = "../modules/vpc-dual-stack"
    subnets = var.subnets
    network_name = var.network_name
    project_id = var.project_id
    secondary_ranges = var.secondary_ranges
    routes = var.routes
    egress_rules = var.egress_rules
    ingress_rules = var.ingress_rules
    delete_default_internet_gateway_routes = var.delete_default_internet_gateway_routes
    shared_vpc_host = var.shared_vpc_host
    auto_create_subnetworks = var.auto_create_subnetworks
    enable_ipv6_ula = var.enable_ipv6_ula
}
module "nat" {
    for_each                          = var.enable_nat ? { "active" = true } : {}
    source                            = "../modules/nat"
    project_id                        = var.project_id
    network_name                      = var.network_name
    router_name                       = var.router_name
    router_region                     = var.router_region
    nats                              = var.nats

    depends_on = [ module.vpc-dual-stack ]
}
module "gke" {
    source = "../modules/gke"
    project_id                        = var.project_id
    name                              = var.name
    region                            = var.region
    zones                             = var.zones
    network                           = var.network
    subnetwork                        = var.subnetwork
    ip_range_pods                     = var.ip_range_pods
    ip_range_services                 = var.ip_range_services
    http_load_balancing               = var.http_load_balancing
    network_policy                    = var.network_policy
    horizontal_pod_autoscaling        = var.horizontal_pod_autoscaling
    filestore_csi_driver              = var.filestore_csi_driver
    dns_cache                         = var.dns_cache
    stack_type                        = var.stack_type
    create_service_account            = var.create_service_account
    remove_default_node_pool          = var.remove_default_node_pool
    disable_legacy_metadata_endpoints = var.disable_legacy_metadata_endpoints
    deletion_protection               = var.deletion_protection
    service_account                   = var.service_account
    logging_variant                   = var.logging_variant
    master_authorized_networks        = var.master_authorized_networks
    add_cluster_firewall_rules        = var.add_cluster_firewall_rules
    firewall_inbound_ports            = var.firewall_inbound_ports
    release_channel                   = var.release_channel
    node_pools                        = var.node_pools
    node_pools_oauth_scopes           = var.node_pools_oauth_scopes
    node_pools_labels                 = var.node_pools_labels
    node_pools_metadata               = var.node_pools_metadata
    node_pools_taints                 = var.node_pools_taints
    node_pools_tags                   = var.node_pools_tags
    cluster_autoscaling               = var.cluster_autoscaling
    enable_cost_allocation            = var.enable_cost_allocation
    stateful_ha                       = var.stateful_ha
    regional                          = var.regional
    enable_gke_auth                   = var.enable_gke_auth
    default_max_pods_per_node         = var.default_max_pods_per_node
    use_private_cluster               = var.use_private_cluster
    enable_vertical_pod_autoscaling   = var.enable_vertical_pod_autoscaling
    network_policy_provider           = var.network_policy_provider
    datapath_provider                 = var.datapath_provider
    monitoring_service                = var.monitoring_service
    logging_service                   = var.logging_service
    additional_ip_range_pods          = var.additional_ip_range_pods
    enable_identity_service           = var.enable_identity_service
    grant_registry_access             = var.grant_registry_access
    monitoring_enable_managed_prometheus = var.monitoring_enable_managed_prometheus
}