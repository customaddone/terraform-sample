provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "customaddone-sample-terraform"
    key    = "sample/ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
