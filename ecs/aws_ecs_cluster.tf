resource "aws_ecs_cluster" "example" {
  name = "handson"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

# AWSのロードバランサーに書いてあるDNSでアクセスする
data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/alb/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

output "cluster_name" {
  value = "${aws_ecs_cluster.example.name}"
}
