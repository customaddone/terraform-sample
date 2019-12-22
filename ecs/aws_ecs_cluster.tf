# ECSは複数のコンポーネントを組み合わせて実装します
# ホストサーバーを束ねる「ECSクラスタ」、コンテナの実行単位となる「タスク」、タスクを長期稼働させてALB
# とのつなぎ役にもなる「ECSサービス」
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/alb/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_ecs_cluster" "example" {
  name = "example"
}
