# ポリシーの詳細をJSONで定義します
# CIでECRにpushするためにECRのアクションを許可しています
resource "aws_iam_policy" "deploy" {
  # ポリシー名を指定します
  name        = "deploy"
  # 一意なパスを指定します
  path        = "/"
  # ポリシーの説明を書きます
  description = "deploy policy"
  # ポリシーの詳細を指定します
  policy      = "${file("aws_iam_policies/ecr_policy.json")}"
}
