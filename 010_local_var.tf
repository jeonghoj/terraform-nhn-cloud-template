locals {
  region   = "KR1"
  auth_url = "https://api-identity.infrastructure.cloud.toast.com/v2.0"
  # availability_zone = "kr-pub-a"

  # 광주 GPU는 AZ:kr-pub-a 에서만 생성 가능
  availability_zone_gpu = "kr-pub-a"
}