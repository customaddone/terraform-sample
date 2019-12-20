# まずはデプロイ用のIAMユーザーを作成します
# name IAMユーザー名を指定します
resource "aws_iam_user" "deploy-user" {
  name = "deploy-user"
}
