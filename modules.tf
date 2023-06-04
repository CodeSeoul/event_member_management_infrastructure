module "oracle-virtual-cloud-network" {
  source = "github.com/oracle-terraform-modules/terraform-oci-vcn"
  # to use the terraform registry version comment the previous line and uncomment the 2 lines below
  # source  = "oracle-terraform-modules/vcn/oci"
  # version = "specify_version_number"

  # general oci parameters
  compartment_id = var.compartment_id
  label_prefix   = var.label_prefix
  freeform_tags  = var.freeform_tags
  defined_tags = var.defined_tags

  # vcn parameters
  create_internet_gateway  = var.vcn_create_internet_gateway  # boolean: true or false
  lockdown_default_seclist = var.lockdown_default_seclist # boolean: true or false
  create_nat_gateway       = var.vcn_create_nat_gateway       # boolean: true or false
  create_service_gateway   = var.vcn_create_service_gateway   # boolean: true or false
  enable_ipv6              = var.vcn_enable_ipv6
  vcn_cidrs                = var.vcn_cidrs # List of IPv4 CIDRs
  vcn_dns_label            = var.vcn_dns_label
  vcn_name                 = var.vcn_name

  # gateways parameters
  internet_gateway_display_name = var.vcn_internet_gateway_display_name
  nat_gateway_display_name      = var.vcn_nat_gateway_display_name
  service_gateway_display_name  = var.vcn_service_gateway_display_name
  attached_drg_id               = var.vcn_attached_drg_id
}

# Yes, this module can create the VCN, but I prefer separation to better isolate changes
module "oracle-kubernetes-engine" {
  source                                =   "oracle-terraform-modules/oke/oci"
  version                               =   "4.5.9"

  cluster_name                          =   var.oke_cluster_name
  cluster_type                          =   var.oke_cluster_type

  compartment_id                        =   var.compartment_id
  tenancy_id                            =   var.tenancy_id

  ssh_private_key_path                  =   var.oke_ssh_private_key_path
  ssh_public_key_path                   =   var.oke_ssh_public_key_path

  label_prefix                          =   var.label_prefix
  home_region                           =   var.home_region
  region                                =   var.region

  vcn_name                              =   var.vcn_name

  create_bastion_host                   =   var.oke_create_bastion_host

  create_operator                       =   var.oke_create_operator

  # add additional parameters for availability_domains, oke etc as you need

  control_plane_is_public               =   true
  control_plane_allowed_cidrs           =   jsondecode(data.http.github-meta-api.response_body)["actions"]
  # The above allows access to the Kubernetes control place from Github Actions hosts

  worker_shape                          =   var.oke_worker_shape
  worker_pool_size                      =   var.oke_worker_pool_size
  worker_pools                          =   var.oke_worker_pools
}