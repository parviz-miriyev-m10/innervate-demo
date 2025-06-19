variable "use_private_cluster" {
  type    = bool
  default = false
}

variable "enable_gke_auth" {
  type    = bool
  default = false
}

variable "project_id" {
  type = string
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