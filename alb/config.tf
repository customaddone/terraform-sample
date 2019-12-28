provider "aws" {
   region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/alb/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
