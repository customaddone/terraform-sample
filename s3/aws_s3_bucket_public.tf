resource "aws_s3_bucket" "public" {
  bucket = "customaddone-public-pragmatic-terraform"
  # アクセス権はaclで設定します
  acl    = "public-read"

  cors_rule {
    allowed_origins = ["https://example.com"]
    allowed_methods = ["GET"]
    allowed_headers = ["*"]
    max_age_seconds = 3000
  }
}
