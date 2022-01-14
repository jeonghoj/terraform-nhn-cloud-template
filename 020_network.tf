data "openstack_networking_network_v2" "vpc" {
  name        = var.vpc.name
  network_id  = var.vpc.id
}

data "openstack_networking_subnet_v2" "subnet" {
  name        = var.subnet.name
  subnet_id   = var.subnet.id
  network_id  = var.vpc.id
}
