# サービスに権限(policyで作ったやつ)を与えるロール
# このファイル構成がいいと思う
module "codebuild_role" {
  source     = "./aws_iam_role"
  name       = "codebuild"
  # codebuildで使いますと宣言
  identifier = "codebuild.amazonaws.com"
  # policyを選択
  policy     = data.aws_iam_policy_document.codebuild.json
}
