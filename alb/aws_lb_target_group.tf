resource "aws_lb_target_group" "example" {
  name = "handson"

  # ターゲットグループを作成するVPC
  vpc_id = data.terraform_remote_state.vpc.outputs.example_id

  # ALBからECSタスクのコンテナへトラフィックを振り分ける設定
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"

  # コンテナへの死活監視設定
  health_check {
    port = 80
    path = "/"
  }
}

resource "aws_lb_listener_rule" "example" {
  # ルールを追加するリスナー
  listener_arn = "${aws_lb_listener.https.arn}"

  # 受け取ったトラフィックをターゲットグループへ受け渡す
  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.example.id}"
  }

  # ターゲットグループへ受け渡すトラフィックの条件
  condition {
    field  = "path-pattern"
    values = ["*"]
  }
}

output "target_group_arn" {
  value = "${aws_lb_target_group.example.arn}"
}
