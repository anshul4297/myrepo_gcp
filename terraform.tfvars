project_id = "km1-runcloud"


service_project_id_1 = "service-project1-367504"

service_project_id_2 = "baljeetsce1"

delete_default_internet_gw = "true"

cluster_name = "gke-cluster-test"


network_name = "host-vpc"

region = "us-east1" 

subnets_iam = [
    "subnet-01","subnet-02", "subnet-03"
]

subnet1 = "subnet-01"

subnet2 = "subnet-02"

subnet3 = "subnet-03"

subnet_ip1 = "10.10.10.0/24"

subnet_ip2 = "10.10.20.0/24"

subnet_ip3 = "10.10.30.0/24"

ip-range-pods-gke-autopilot-private = "ip-range-pods-gke-autopilot-private"

ip-range-service-gke-autopilot-private = "ip-range-service-gke-autopilot-private"

ip_cidr_range_pods = "192.168.64.0/24"

ip_cidr_range_service = "172.16.1.0/28"

gke_master_ipv4 = "172.16.0.0/28"

gke_master_authorized_nw = "10.60.0.0/17"




rules = [{
    name                    = "firewall-allow-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    allow = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    deny = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]