data "template_file" "task-role-template" {
  template = file("./task_role.json")
}

resource "aws_iam_role" "task-role" {
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.template_file.task-role-template.rendered
}

resource "aws_iam_role_policy_attachment" "task-role-attachment" {
  role       = "${aws_iam_role.task-role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

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

output "ecs_role_arn" {
  value = aws_iam_role.task-role.arn
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
