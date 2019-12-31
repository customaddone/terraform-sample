# IAMロールとIAMポリシーの名前
variable "name" {}
# ポリシードキュメント
variable "policy" {}
# IAMロールを関連づけるAWSのサービス識別子
variable "identifier" {}

resource "aws_iam_role" "default" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [var.identifier]
    }
  }
}

resource "aws_iam_policy" "default" {
  name   = var.name
  policy = var.policy
}

# ロールとポリシーをアタッチメント
resource "aws_iam_role_policy_attachment" "default" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}

output "iam_role_arn" {
  value = aws_iam_role.default.arn
}

#moduleから本体に値を送る際に必要
output "iam_role_name" {
  value = aws_iam_role.default.name
}
