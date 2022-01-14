resource "openstack_networking_secgroup_v2" "remote-ssh" {
  name        = "remote-ssh"
  description = "ssh 통신 허용"
}
resource "openstack_networking_secgroup_rule_v2" "remote_ssh_rule_01" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = var.remote_ssh_ip
  security_group_id = openstack_networking_secgroup_v2.svc-ssh.id
}