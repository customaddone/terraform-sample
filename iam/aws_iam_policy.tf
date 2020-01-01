# 一から作ってみよう
# まずAWSでIAMユーザーを作成（手動）し、権限AdministratorAccessを与える

# AWSでは、あるサービスから別のサービスを操作する際に、権限が必要になります
# 権限はポリシーで指定します
# ポリシーでは「実行可能なアクション」や「操作可能なリソース」を指定でき、柔軟に権限を設定できます
data "aws_iam_policy_document" "codebuild" {
  statement {
    # effect AllowかDenyか
    effect    = "Allow"
    # なんのサービスで、どんな操作が実行できるか
    actions   = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
    ]
    # なんのリソースを利用できるか
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "codepipeline" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
      "ecs:DescribeServices",
      "ecs:DescribeTaskDefinition",
      "ecs:DescribeTasks",
      "ecs:ListTasks",
      "ecs:RegisterTaskDefinition",
      "ecs:UpdateService",
      "iam:PassRole",
    ]
  }
}
