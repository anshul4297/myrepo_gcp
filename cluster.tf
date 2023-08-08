data "google_client_config" "default" {}

 

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

 

module "gke" {
  source                          = "./modules/gke-autopilot-private-cluster"
  depends_on = [module.subnet-iam-bindings]
  project_id                      = var.project_id
  name                            = var.cluster_name 
  regional                        = true
  region                          = var.region
  network                         = module.vpc.network_name
  subnetwork                      = var.subnet1
  ip_range_pods                   =  var.ip-range-pods-gke-autopilot-private
  ip_range_services               =  var.ip-range-service-gke-autopilot-private
  release_channel                 = "REGULAR"
  enable_vertical_pod_autoscaling = true
  enable_private_endpoint         = true
  enable_private_nodes            = true
  master_ipv4_cidr_block          = var.gke_master_ipv4  
  


  master_authorized_networks = [
    {
      cidr_block   = var.gke_master_authorized_nw 
      display_name = "VPC"
    },
  ]
}
