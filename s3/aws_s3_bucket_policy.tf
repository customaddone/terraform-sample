# バケットポリシーで、S3バケットへのアクセス権を設定します
# ALBのようなAWSのサービスからS3に書き込むために必要です

resource "aws_s3_bucket_policy" "alb_log" {
  bucket = aws_s3_bucket.alb_log.id
  policy = data.aws_iam_policy_document.alb_log.json
}

data "aws_iam_policy_document" "alb_log" {
  statement {
    effect    = "Allow"
    actions   = ["s3:PutObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.alb_log.id}/*"]

    # ALBの場合はAWSが管理しているアカウントから書き込みます
    # identifiersでIDを指定します
    principals {
      type        = "AWS"
      identifiers = ["582318560864"]
    }
  }
}
