provider "aws" {
   region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
