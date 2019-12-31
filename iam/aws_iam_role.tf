#EC2用
module "ec2_role" {
  source     = "./aws_iam_module"
  name       = ""
  identifier = "ec2.amazonaws.com"
  policy     = data.aws_iam_policy_document.ec2.json
}

#ECS用
module "ecs_role" {
  source     = "./aws_iam_module"
  name       = ""
  identifier = "ecs.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs.json
}

output "ec2_role_arn" {
  value = module.ec2_role.iam_role_arn
}
