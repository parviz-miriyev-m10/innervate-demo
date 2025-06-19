variable "enable_dual_stack_vpc" {
  type    = bool
  default = false
}
variable "enable_nat" {
  type    = bool
  default = false
}
variable "project_id" {
  type = string
}

### VPC ###
variable "network_name" {
    type = string
}
variable "subnets" {
  description = "List of subnet configurations"
  type = list(object({
    subnet_name                      = string
    subnet_ip                        = string
    subnet_region                    = string
    subnet_private_access            = optional(string)
    subnet_private_ipv6_access       = optional(string)
    subnet_flow_logs                 = optional(string)
    subnet_flow_logs_interval        = optional(string)
    subnet_flow_logs_sampling        = optional(string)
    subnet_flow_logs_metadata        = optional(string)
    subnet_flow_logs_filter          = optional(string)
    subnet_flow_logs_metadata_fields = optional(list(string))
    description                      = optional(string)
    purpose                          = optional(string)
    role                             = optional(string)
    stack_type                       = optional(string)
    ipv6_access_type                 = optional(string)
  }))
}
variable "secondary_ranges" {
  type = map(list(object({
    range_name    = string
    ip_cidr_range = string
  })))
}

variable "routes" {
  type = list(map(string))
  default = []
}

variable "egress_rules" {
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
  default = []
}

variable "ingress_rules" {
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
  default = []
}

variable "delete_default_internet_gateway_routes" {
  type = bool
  default = false
}

variable "shared_vpc_host" {
  type = bool
  default = false
}

variable "auto_create_subnetworks" {
  type = bool
}

variable "enable_ipv6_ula" {
  type = bool
}


### GKE ###
variable "use_private_cluster" {
  type    = bool
  default = false
}
variable "enable_gke_auth" {
  type    = bool
  default = false
}
variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "regional" {
  type = bool
}

variable "zones" {
  type    = list(string)
  default = []
}

variable "network" {
  type = string
}
variable "monitoring_enable_managed_prometheus" {
  type = bool
}
variable "add_master_webhook_firewall_rules" {
  type = bool
}

variable "subnetwork" {
  type = string
}
variable "ip_range_pods" {
  type = string
}

variable "ip_range_services" {
  type = string
}

variable "http_load_balancing" {
  type    = bool
  default = false
}

variable "network_policy" {
  type    = bool
  default = false
}

variable "datapath_provider" {
  type = string
}

variable "horizontal_pod_autoscaling" {
  type    = bool
  default = true
}

variable "filestore_csi_driver" {
  type    = bool
  default = false
}

variable "dns_cache" {
  type    = bool
  default = false
}

variable "stack_type" {
  type    = string
  default = "IPV4"
}

variable "create_service_account" {
  type    = bool
  default = false
}

variable "remove_default_node_pool" {
  type    = bool
  default = true
}

variable "disable_legacy_metadata_endpoints" {
  type    = bool
  default = true
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "service_account" {
  type    = string
  default = ""
}

variable "logging_variant" {
  type    = string
  default = "DEFAULT"
}

variable "default_max_pods_per_node" {
  type = number
  default = "110"
}

variable "master_authorized_networks" {
  type    = list(object({
    cidr_block   = string
    display_name = string
  }))
  default = []
}

variable "add_cluster_firewall_rules" {
  type    = bool
  default = false
}

variable "firewall_inbound_ports" {
  type    = list(string)
  default = ["443"]
}

variable "release_channel" {
  type    = string
  default = "REGULAR"
}

variable "stateful_ha" {
  type = bool
}
variable "monitoring_service" {
  type = string
}
variable "logging_service" {
  type = string
}

variable "enable_cost_allocation" {
  type = bool
}

variable "enable_vertical_pod_autoscaling" {
  type = bool
}

variable "network_policy_provider" {
  type = string
}

variable "additional_ip_range_pods" {
  type = list(string)
  default = []
}
variable "grant_registry_access" {
  type = bool
}
variable "enable_identity_service" {
  type = bool
}

variable "node_pools_oauth_scopes" {
  type = map(list(string))
}

variable "node_pools_labels" {
  type = map(map(bool))
}

variable "node_pools_metadata" {
  type = map(map(string))
}

variable "node_pools_taints" {
  type = map(list(object({
    key    = string
    value  = string
    effect = string
  })))
}

variable "node_pools_tags" {
  type = map(list(string))
}

variable "node_pools" {
  type = list(object({
    name                        = optional(string)
    machine_type                = optional(string)
    node_locations              = optional(string)
    min_count                   = optional(number)
    max_count                   = optional(number)
    local_ssd_count             = optional(number)
    spot                        = optional(bool)
    disk_size_gb                = optional(number)
    disk_type                   = optional(string)
    image_type                  = optional(string)
    enable_gcfs                 = optional(bool)
    enable_gvnic                = optional(bool)
    logging_variant             = optional(string)
    auto_repair                 = optional(bool)
    auto_upgrade                = optional(bool)
    service_account             = optional(string)
    preemptible                 = optional(bool)
    initial_node_count          = optional(number)
    accelerator_count           = optional(number)
    accelerator_type            = optional(string)
    gpu_driver_version          = optional(string)
    gpu_sharing_strategy        = optional(string)
    max_shared_clients_per_gpu  = optional(number)
    pod_range                   = optional(string)
    sandbox_enabled             = optional(bool)
    node_count                  = optional(number)
    enable_nested_virtualization = optional(bool)
    enable_private_nodes        = optional(bool)
    autoscaling                 = optional(bool)
    enable_confidential_nodes   = optional(bool)
    local_nvme_ssd_count        = optional(number)
    enable_confidential_storage = optional(bool)
    total_max_count             = optional(number)
    max_pods_per_node           = optional(number)
    max_surge                   = optional(number)
    max_unavailable             = optional(number)
    total_min_count             = optional(number)
  }))
}

variable "cluster_autoscaling" {
  type = object({
    enabled                     = bool
    autoscaling_profile         = optional(string)
    min_cpu_cores               = optional(number)
    max_cpu_cores               = optional(number)
    min_memory_gb               = optional(number)
    max_memory_gb               = optional(number)
    gpu_resources               = list(object({ resource_type = string, minimum = number, maximum = number }))
    auto_repair                 = optional(bool, true)
    auto_upgrade                = optional(bool, true)
    disk_size                   = optional(number)
    disk_type                   = optional(string)
    image_type                  = optional(string)
    strategy                    = optional(string)
    max_surge                   = optional(number)
    max_unavailable             = optional(number)
    node_pool_soak_duration     = optional(string)
    batch_soak_duration         = optional(string)
    batch_percentage            = optional(number)
    batch_node_count            = optional(number)
    enable_secure_boot          = optional(bool, false)
    enable_integrity_monitoring = optional(bool, true)
  })
}


### CLoud Router ###
variable "router_name" {
  type = string
}
variable "router_region" {
  type = string
}
variable "nats" {
  type = list(object({
    name                                = string
    nat_ip_allocate_option              = optional(string)
    source_subnetwork_ip_ranges_to_nat  = optional(string)
    nat_ips                             = optional(list(string), [])
    drain_nat_ips                       = optional(list(string), [])
    min_ports_per_vm                    = optional(number)
    max_ports_per_vm                    = optional(number)
    udp_idle_timeout_sec                = optional(number)
    icmp_idle_timeout_sec               = optional(number)
    tcp_established_idle_timeout_sec    = optional(number)
    tcp_transitory_idle_timeout_sec     = optional(number)
    tcp_time_wait_timeout_sec           = optional(number)
    enable_endpoint_independent_mapping = optional(bool)
    enable_dynamic_port_allocation      = optional(bool)

    log_config = optional(object({
      enable = optional(bool, true)
      filter = optional(string, "ALL")
    }), {})

    subnetworks = optional(list(object({
      name                     = string
      source_ip_ranges_to_nat  = list(string)
      secondary_ip_range_names = optional(list(string))
    })), [])

  }))
}