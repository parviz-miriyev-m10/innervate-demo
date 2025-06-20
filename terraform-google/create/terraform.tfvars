project_id = "watchful-cirrus-463507-m0"
# ----------------------
# VPC & Networking
# ----------------------
network_name = "innervate-vpc"
subnets = [
  {
    subnet_name   = "innervate-subnet"
    subnet_ip     = "10.0.0.0/24"
    subnet_region = "us-east1"
  }
]
secondary_ranges = {
  "innervate-subnet" = [
    { range_name = "pods-range", ip_cidr_range = "10.1.0.0/16" },
    { range_name = "services-range", ip_cidr_range = "10.2.0.0/20" }
  ]
}
auto_create_subnetworks = false
enable_ipv6_ula         = true

# ----------------------
# GKE Cluster
# ----------------------
name                        = "innervate-demo"
region                      = "us-east1"
regional                    = true
network                     = "innervate-vpc"
monitoring_enable_managed_prometheus = false
add_master_webhook_firewall_rules    = false
subnetwork                   = "innervate-subnet"
ip_range_pods                = "pods-range"
ip_range_services            = "services-range"
datapath_provider            = "ADVANCED_DATAPATH"
node_pools = [
  {
    name                        = "default-pool"
    machine_type                = "e2-medium"
    min_count                   = 2
    max_count                   = 2
    auto_repair                 = true
    auto_upgrade                = true
    initial_node_count          = 2
    enable_gvnic                = false
    node_locations              = ""
    autoscaling                 = true
    node_count                  = 0
    pod_range                   = ""
    enable_private_nodes        = false
    total_egress_bandwidth_tier = 0
    local_nvme_ssd_count        = 0
    disk_size_gb                = 100
    disk_type                   = "pd-standard"
    accelerator_count           = 0
    threads_per_core            = 0
    enable_nested_virtualization = false
  }
]
cluster_autoscaling = {
  enabled = false
  gpu_resources = []
}
stateful_ha                  = false
monitoring_service           = "monitoring.googleapis.com/kubernetes"
logging_service              = "logging.googleapis.com/kubernetes"
enable_cost_allocation       = false
enable_vertical_pod_autoscaling = false
network_policy_provider      = "PROVIDER"
grant_registry_access        = false
enable_identity_service      = false
node_pools_oauth_scopes      = {}
node_pools_labels            = {}
node_pools_metadata          = {}
node_pools_taints            = {}
node_pools_tags              = {}

# ----------------------
# Cloud Router & NAT
# ----------------------
router_name                  = "innervate"
router_region                = "us-east1"
nats = [
  {
    name = "innervate-nat"
  }
]

enable_dual_stack_vpc = true
enable_nat = true
