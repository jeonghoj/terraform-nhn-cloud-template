variable "nhn_account" {
  type = object({
    username     = string
    api_password = string
  })
  description = "NHN Cloud 계정"
}

variable "tenant_id" {
  type        = string
  description = "NHN Cloud Tenant_ID"
}

#FIXME map으로 변경
variable "vpc" {
  type  = object({
    name  = string
    id    = string
  })
  description = "vpc"
}

#FIXME map으로 변경
variable "subnet" {
  type  = object({
    name  = string
    id    = string
  })
  description = "subnet"
}

variable "os_images" {
  type = object({
    centos       = string
    gpu   = string
  })
  default = {
    centos="CentOS 7.8 (2021.12.21)"
    gpu="Ubuntu Server 18.04.6 LTS with NVIDIA (2021.12.21)"
  }
  description = "NHN Cloud OS Image 이름"
}

variable "keypairs" {
  type        = map
  default = {}
}

variable "region" {
  type        = map
  default     = {
    KR="KR1"
    KR2="KR2"
    JP="JP1"
  }
}
variable "availability_zone" {
  type        = map
  default={
    a="kr-pub-a"
    b="kr-pub-b"
  }
}

variable "remote-ssh-ip" {
  type        = string
}
