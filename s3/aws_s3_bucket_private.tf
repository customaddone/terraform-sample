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
