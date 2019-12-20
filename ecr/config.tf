# awsを使います
provider "aws" {
  region = "ap-northeast-1"
}

# terraform.tfstateにはterraform applyした結果が保存されている
# tfstateはS3などのクラウドストレージに保存しよう
# これでs3にプラグインできる
terraform {
  backend "s3" {
    bucket = "customaddone-sample-terraform"
    key    = "sample/ecr/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
