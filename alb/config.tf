provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "customaddone-sample-terraform"
    key    = "sample/alb"
    region = "ap-northeast-1"
  }
}
