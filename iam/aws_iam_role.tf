#EC2用
module "ec2_role" {
  source     = "./aws_iam_module"
  name       = "ec2_role"
  identifier = "ec2.amazonaws.com"
  policy     = data.aws_iam_policy_document.ec2.json
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = module.ec2_role.iam_role_name
}

#ECS用
module "ecs_role" {
  source     = "./aws_iam_module"
  name       = "ecs_role"
  identifier = "ecs.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs.json
}

output "ec2_role_arn" {
  value = module.ec2_role.iam_role_arn
}

output "ecs_role_arn" {
  value = module.ecs_role.iam_role_arn
}

output "ecs_instance_profile_name" {
      value = aws_iam_instance_profile.ecs_instance_profile.name
}
