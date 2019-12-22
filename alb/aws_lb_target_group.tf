# ALBがリクエストを飛ばす対象をターゲットグループと言う
# このターゲットグループはECSサービスと関連付けます
resource "aws_lb_target_group" "example" {
  name                 = "example"
  # ターゲットの種類
  target_type          = "ip"
  # ターゲットにipを指定した場合は以下も書いてね
  vpc_id               = data.terraform_remote_state.vpc.outputs.example_id
  port                 = 80
  protocol             = "HTTP"
  deregistration_delay = 300

  health_check {
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = 200
    port                = "traffic-port"
    protocol            = "HTTP"
  }
  # ロードバランサーとターゲットグループとECSサービスを同時に作成するとエラーになります
  depends_on = [aws_lb.example]
}

output "target_group_arn" {
  value = "${aws_lb_target_group.example.arn}"
}
