resource "openstack_networking_secgroup_v2" "internal" {
  name        = "internal"
  description = "내부 서버 통신 허용"
}

resource "openstack_networking_secgroup_rule_v2" "internal_rule_1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  remote_ip_prefix  = "192.168.0.0/24"
  security_group_id = openstack_networking_secgroup_v2.internal.id
}