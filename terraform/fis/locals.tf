locals {
  name   = "saikyo-fisdemo"
  region = "ap-northeast-1"

  category   = "fault-injection"
  managed_by = "https://github.com/kiyo-s/aws-fis-demo.git"

  common_tags = {
    ManagedBy = local.managed_by
    Category  = local.category
  }
}
