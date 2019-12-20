# tfstateをS3に保存します
terraform {
  backend "s3" {
  bucket = "customaddone-sample-terraform"
  key    = "sample/iam/terraform.tfstate"
  region = "ap-northeast-1"
  }
}

provider "aws" {
      region = "ap-northeast-1"
}
