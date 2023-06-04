terraform {
  # https://registry.terraform.io/providers/oracle/oci/latest/docs
  required_providers {
    oci = {
      source = "oracle/oci"
      version = "4.123.0"
    }
    
    http = {
      source = "hashicorp/http"
      version = "3.3.0"
    }
  }

  # https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/terraformUsingObjectStore.htm#s3
  backend "s3" {
    bucket   = "codeseoul-eventmembermanagement-terraform-states"
    key      = "eventmembermanagement/terraform.tfstate"
    region   = "ap-seoul-1"
    endpoint = "https://eventmembermanagement.compat.objectstorage.ap-seoul-1.oraclecloud.com"
  }
}

provider "oci" {
  # Configuration options
}