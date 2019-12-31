provider "aws" {
   region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/ec2/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
