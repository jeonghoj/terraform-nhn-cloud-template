resource "openstack_compute_instance_v2" "test" {
  name      = "terraform-test"
  region    = local.region
  key_pair  = var.keypairs["testbed"]

  network {
    name = data.openstack_networking_network_v2.vpc.name
    uuid = data.openstack_networking_network_v2.vpc.id
  }

  block_device {
    uuid                  = data.openstack_images_image_v2.centos.id
    source_type           = "image"
    destination_type      = "volume"
    boot_index            = 0
    volume_size           = 20
    volume_type           = "General SSD"
    delete_on_termination = true
  }
  
  flavor_id = data.openstack_compute_flavor_v2.t2c1m1.id
  security_groups = [
    openstack_networking_secgroup_v2.internal.name,
    openstack_networking_secgroup_v2.svc-ssh.name,
  ]
}

# float ip
resource "openstack_compute_floatingip_v2" "fip" {
  pool = "Public Network"
}

# float ip 할당
resource "openstack_compute_floatingip_associate_v2" "fip_associate" {
  floating_ip = openstack_compute_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.test.id
}