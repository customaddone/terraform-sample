# ALBはAWSが提供するロードバランサーです
# HTTPSでアクセスできるよう設定します
# remote_state を設定し vpc という名前で参照できるようにしています
# 送信先で下記のように書く
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_lb" "example" {
  # 名前はnameで設定します
  name                       = "example"
  # 種別はload_balancer_typeで設定します
  load_balancer_type         = "application"
  # ALBがインターネット向けなのかVPC内部向けなのか
  internal                   = false
  idle_timeout               = 60
  # 削除保護
  enable_deletion_protection = true

  # 下記のようにデータを参照する
  subnets = [
    data.terraform_remote_state.vpc.outputs.public_0,
    data.terraform_remote_state.vpc.outputs.public_1,
  ]

  access_logs {
    bucket  = data.terraform_remote_state.s3.outputs.alb_log_id
    enabled = true
  }

  security_groups = [
    module.http_sg.security_group_id,
    module.https_sg.security_group_id,
    module.http_redirect_sg.security_group_id,
  ]
}

output "alb_dns_name" {
  value = aws_lb.example.dns_name
}
