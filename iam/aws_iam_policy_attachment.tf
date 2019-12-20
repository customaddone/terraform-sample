# IAMロールにIAMポリシーをアタッチします
# terraformはファイル名があまり関係ない感じ？
resource "aws_iam_role_policy_attachment" "example" {
  role       = aws_iam_role.example.name
  policy_arn = aws_iam_policy.example.arn
}
