
# 権限はポリシーで指定します
# ポリシーでは「実行可能なアクション」や「操作可能なリソース」を指定でき、柔軟に権限を設定できます
data "aws_iam_policy_document" "allow_describe_regions" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:DescribeRegions"] # リージョン一覧を取得する
    resources = ["*"]
  }
}

data "terraform_remote_state" "ecs" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/ecs/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

data "terraform_remote_state" "s3" {
  backend = "s3"
  config = {
    bucket = "customaddone-sample-terraform"
    key    = "sample/s3/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
