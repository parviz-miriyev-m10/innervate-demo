module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  name    = var.router_name
  project = var.project_id
  network = var.network_name
  region  = var.router_region

  nats    = var.nats
}