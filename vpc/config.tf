terraform {
  backend "s3" {
    bucket = "customaddone-sample-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}
