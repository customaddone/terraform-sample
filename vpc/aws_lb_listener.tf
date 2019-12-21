# リスナーで、どのポートのリクエストを受け付けるか設定します
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.example.arn
  # httpの８０番
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "これは『HTTP』です"
      status_code  = "200"
    }
  }
}
