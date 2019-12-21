# ALBはAWSが提供するロードバランサーです
# HTTPSでアクセスできるよう設定します
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

  subnets = [
    aws_subnet.public_0.id,
    aws_subnet.public_1.id,
  ]

  access_logs {
    bucket  = aws_s3_bucket.alb_log.id
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
