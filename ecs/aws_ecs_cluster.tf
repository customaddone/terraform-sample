# ECSは複数のコンポーネントを組み合わせて実装します
# ホストサーバーを束ねる「ECSクラスタ」、コンテナの実行単位となる「タスク」、タスクを長期稼働させてALB
# とのつなぎ役にもなる「ECSサービス」
resource "aws_ecs_cluster" "example" {
  name = "example"
}
