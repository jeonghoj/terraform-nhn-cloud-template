# CPU IMAGE
data "openstack_images_image_v2" "centos" {
  name = var.os_images.centos
  most_recent = true
}
# GPU IMAGE
data "openstack_images_image_v2" "gpu" {
  name = var.os_images.gpu

  # TODO FIXME NHN Cloud에서 해당 태그 삭제 예정
  tag = "_GPU"
  most_recent = true
}

# instance type
# CPU
data "openstack_compute_flavor_v2" "t2c1m1"{
  name = "t2.c1m1"
}
data "openstack_compute_flavor_v2" "m2c8m16"{
  name = "m2.c8m16"
}
data "openstack_compute_flavor_v2" "m2c16m32"{
  name = "m2.c16m32"
}