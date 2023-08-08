locals {
  service_project_1 = {
    service_project_id_1   = var.service_project_id_1 
  }
  service_project_2 = {
    service_project_id_2 = var.service_project_id_2 
  }
}

module "vpc-host" {
  source     = "./modules"
  depends_on = [module.vpc, module.firewall_rules]
  project_id = var.project_id 
  shared_vpc_host = true
  shared_vpc_service_projects = [
    local.service_project_1.service_project_id_1 ,
    local.service_project_2.service_project_id_2
  ]
  
}

module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 7.2"

 

    project_id   = var.project_id 
    network_name = var.network_name
    routing_mode = "GLOBAL"

 

    subnets = [
        {
            subnet_name           = var.subnet1
            subnet_ip             = var.subnet_ip1 
            subnet_region         = var.region
        },
        {
            subnet_name           = var.subnet2
            subnet_ip             = var.subnet_ip2 
            subnet_region         = var.region
            subnet_private_access = "true"
            subnet_flow_logs      = "true"
            description           = "This subnet has a description"
        },
        {
            subnet_name               = var.subnet3
            subnet_ip                 =  var.subnet_ip3 
            subnet_region             = var.region
            subnet_flow_logs          = "true"
            subnet_flow_logs_interval = "INTERVAL_10_MIN"
            subnet_flow_logs_sampling = 0.7
            subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
        }
    ]

 

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = var.ip-range-pods-gke-autopilot-private
                ip_cidr_range =  var.ip_cidr_range_pods 
            },
            {
                range_name    = var.ip-range-service-gke-autopilot-private
                ip_cidr_range = var.ip_cidr_range_service       
            },
        ]

 

        subnet-02 = []
    }

 

    # routes = [
    #     {
    #         name                   = "egress-internet"
    #         description            = "route through IGW to access internet"
    #         destination_range      = "0.0.0.0/0"
    #         tags                   = "egress-inet"
    #         next_hop_internet      = "true"
    #     },
    #     {
    #         name                   = "app-proxy"
    #         description            = "route through proxy to reach app"
    #         destination_range      = "10.50.10.0/24"
    #         tags                   = "app-proxy"
    #         next_hop_instance      = "app-proxy-instance"
    #         next_hop_instance_zone = "us-west1-a"
    #     },
    # ]
}


module "firewall_rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  depends_on = [module.vpc]
  project_id   = var.project_id
  network_name = var.network_name
  rules = [

    for r in var.rules : {
      name                    = r.name
      description             = r.description
      direction               = r.direction
      priority                = r.priority
      ranges                  = r.ranges
      source_tags             = r.source_tags
      source_service_accounts = r.source_service_accounts
      target_tags             = r.target_tags
      target_service_accounts = r.target_service_accounts
      allow                   = r.allow
      deny                    = r.deny
      log_config              = r.log_config
  }]
}


module "subnet-iam-bindings" {
  source = "terraform-google-modules/iam/google//modules/subnets_iam"
  depends_on = [module.vpc-host]
  subnets        = var.subnets_iam 
  subnets_region = var.region
  project        = var.project_id   
  mode           = "authoritative"
  bindings = {
    "roles/compute.networkUser" = [
      "serviceAccount:sricharank-km1-runcloud-iam-gs@km1-runcloud.iam.gserviceaccount.com",
      "user:baljeet@baljeetkaursce.joonix.net",
    #   "group:my-group@my-org.com",
    #   "user:my-user@my-org.com",
    ]
    # "roles/compute.networkViewer" = [
    #   "serviceAccount:my-sa@my-project.iam.gserviceaccount.com",
    #   "group:my-group@my-org.com",
    #   "user:my-user@my-org.com",
    # ]
  }
#   conditional_bindings = [
#     {
#       role = "roles/compute.networkAdmin"
#       title = "expires_after_2019_12_31"
#       description = "Expiring at midnight of 2019-12-31"
#       expression = "request.time < timestamp(\"2020-01-01T00:00:00Z\")"
#       members = ["user:my-user@my-org.com"]
#     }
#   ]
}













