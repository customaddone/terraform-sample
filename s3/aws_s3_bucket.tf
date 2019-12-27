# バケットはprivate, public, alb用の３つ用意する
# 外部公開しないプライベートバケット
resource "aws_s3_bucket" "private" {
  bucket = "customaddone-private-pragmatic-terraform"

  # versioningの設定を有効にすると、オブジェクトを変更、削除してもいつでも戻れる
  versioning {
    enabled = true
  }

  # 暗号化
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# 外部公開用
resource "aws_s3_bucket" "public" {
  bucket = "customaddone-public-pragmatic-terraform"
  # アクセス権はaclで設定します
  # public-readでインターネットからの読み込みを可能にしている
  acl    = "public-read"

  # クロスオリジン可能
  cors_rule {
    allowed_origins = ["https://example.com"]
    allowed_methods = ["GET"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }
}

# AWSの各種サービスがログを保存するためのログバケット
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
