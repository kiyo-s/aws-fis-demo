terraform {
  backend "s3" {
    bucket         = "saikyo-fisdemo-tfstate"
    key            = "fault-injection/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "saikyo-fisdemo-tfstate"
  }

  required_version = ">= 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = local.region
  default_tags {
    tags = local.common_tags
  }
}
