# AWSの各種サービスがログを保存するためのログバケットを作成します
resource "aws_s3_bucket" "alb_log" {
  bucket = "customaddone-alb-log-pragmatic-terraform"

  # 期限を設定し、無限にファイルが増えないようにする
  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
