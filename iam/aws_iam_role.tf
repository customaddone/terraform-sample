module "codebuild_role" {
  source     = "./aws_iam_module"
  name       = "codebuild"
  identifier = "codebuild.amazonaws.com"
  policy     = data.aws_iam_policy_document.codebuild.json
}

module "codepipeline_role" {
  source     = "./aws_iam_module"
  name       = "codepipeline"
  identifier = "codepipeline.amazonaws.com"
  policy     = data.aws_iam_policy_document.codepipeline.json
}

output "codebuild_role_arn" {
  value = module.codebuild_role.iam_role_arn
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
