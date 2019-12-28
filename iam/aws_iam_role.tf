# サービスに権限(policyで作ったやつ)を与えるロール
# このファイル構成がいいと思う
module "codebuild_role" {
  source     = "./aws_iam_role"
  name       = "codebuild"
  # codebuildで使いますと宣言
  identifier = "codebuild.amazonaws.com"
  # policyを選択
  # ポリシードキュメントを保持するリソースです
  # ポリシー名とポリシードキュメントを設定します codebuildで使う
  policy     = data.aws_iam_policy_document.codebuild.json
}

module "codepipeline_role" {
  source     = "./aws_iam_role"
  name       = "codepipeline"
  identifier = "codepipeline.amazonaws.com"
  policy     = data.aws_iam_policy_document.codepipeline.json
}

data "terraform_remote_state" "ecs" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/ecs/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
