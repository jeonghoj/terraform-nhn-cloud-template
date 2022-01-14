terraform {
required_version = ">= 1.0.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42.0"
    }
  }
}

provider "openstack" {
  # Configuration options
  user_name   = var.nhn_account.username
  password    = var.nhn_account.api_password
  tenant_id   = var.tenant_id

  auth_url    = local.auth_url
  region      = local.region
}