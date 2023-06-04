variable "compartment_id" {
  default     = ""
  type        = "string"
  description = "The ID of the compartment for the event member management system"
}

variable "label_prefix" {
  default     = "eventmembermanagement-"
  type        = "string"
  description = "The prefix to set for all resource labels"
}

variable "freeform_tags" {
  default     = ""
  type        = "map(any)"
  description = "Simple key-value pairs to tag the created resources using freeform OCI Free-form tags."
}

variable "defined_tags" {
  default     = ""
  type        = "map(string)"
  description = "Predefined and scoped to a namespace to tag the resources created using defined tags."
}

variable "vcn_create_internet_gateway" {
  default     = true
  type        = "boolean"
  description = "Whether or not to create an internet gateway in the VCN"
}

variable "vcn_create_nat_gateway" {
  default     = true
  type        = "boolean"
  description = "Whether or not to create an NAT gateway in the VCN"
}

variable "vcn_create_service_gateway" {
  default     = true
  type        = "boolean"
  description = "Whether or not to create a service gateway in the VCN"
}

variable "vcn_enable_ipv6" {
  default     = false
  type        = "boolean"
  description = "Whether or not to enable IPv6 in the VCN"
}

variable "vcn_cidrs" {
  default     = "[10.0.0.0/16]"
  type        = "list(string)"
  description = "A list of CIDRs that the VCN should encompass"
}

variable "vcn_dns_label" {
  default     = "vcnmodule"
  type        = "string"
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet. DNS resolution of hostnames in the VCN is disabled when null."
}

variable "vcn_name" {
  default     = "vcn"
  type        = "string"
  description = "The name of the VCN"
}

variable "vcn_internet_gateway_display_name" {
  default     = "internet-gateway"
  type        = "string"
  description = "Name of Internet Gateway. Does not have to be unique."
}

variable "vcn_nat_gateway_display_name" {
  default     = "nat-gateway"
  type        = "string"
  description = "Name of NAT Gateway. Does not have to be unique."
}

variable "vcn_service_gateway_display_name" {
  default     = "service-gateway"
  type        = "string"
  description = "Name of Service Gateway. Does not have to be unique."
}

variable "vcn_attached_drg_id" {
  default     = null
  type        = "string"
  description = "The ID of DRG attached to the VCN"
}

variable "tenancy_id" {
  default     = ""
  type        = "string"
  description = "The OCID value for the tenancy"
}

variable "oke_ssh_private_key_path" {
  default     = null
  type        = "string"
  description = "The OCID value for the tenancy"
}

variable "oke_ssh_public_key_path" {
  default     = null
  type        = "string"
  description = "The OCID value for the tenancy"
}

variable "home_region" {
  default     = "ap-seoul-1"
  type        = "string"
  description = "The tenancy's home region. Required to perform identity operations."
}

variable "region" {
  default     = "ap-seoul-1"
  type        = "string"
  description = " The OCI region where OKE resources will be created."
}

variable "oke_create_bastion_host" {
  default     = false
  type        = "boolean"
  description = "Whether to create a bastion host."
}

variable "oke_create_operator" {
  default     = false
  type        = "boolean"
  description = "Whether to create an operator server in a private subnet."
}

variable "oke_cluster_name" {
  default     = "main"
  type        = "string"
  description = "The name of oke cluster."
}

variable "oke_cluster_type" {
  default     = "basic"
  type        = "string"
  description = "The cluster type. See <a href=https://docs.oracle.com/en-us/iaas/Content/ContEng/Tasks/contengworkingwithenhancedclusters.htm>Working with Enhanced Clusters and Basic Clusters</a> for more information."
}

# The below configuration matches the free tier
variable "oke_worker_shape" {
  default     = {
    "boot_volume_size": 50,
    "memory": 6,
    "ocpus": 1,
    "shape": "VM.Standard.A1.Flex"
  }
  type        = "map(any)"
  description = "Default shape of the created worker instance when unspecified on a pool."
}

# The below configuration matches the free tier
variable "oke_worker_pool_size" {
  default     = 4
  type        = "number"
  description = "Default size for worker pools when unspecified on a pool."
}

variable "oke_worker_pools" {
  default     = {
    np0 = {} # All defaults, as defined by above variables
  }
  type        = "any"
  description = "Tuple of OKE worker pools where each key maps to the OCID of an OCI resource, and value contains its definition."
}
