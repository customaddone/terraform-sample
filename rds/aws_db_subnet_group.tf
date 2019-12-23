data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_db_subnet_group" "example" {
  name       = "example"
  subnet_ids = [
    data.terraform_remote_state.vpc.outputs.public_0,
    data.terraform_remote_state.vpc.outputs.public_1
  ]
}
