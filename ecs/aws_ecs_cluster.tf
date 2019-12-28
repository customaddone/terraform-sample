#コンテナオーケストレーション
#ホストサーバーを束ねるECSクラスタ、コンテナの実行単位となるタスク、コンテナを長時間稼働させるECSサービス
#clusterは名前を指定するだけ
resource "aws_ecs_cluster" "example" {
  name = "example"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/alb/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
