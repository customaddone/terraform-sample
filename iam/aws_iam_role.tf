#EC2用
resource "aws_iam_role" "this" {
  name        = "ecs-instance-role"
  path        = "/"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
            "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "this" {
  name   = "iam_role_policy"
  role   = aws_iam_role.this.id
  policy = data.aws_iam_policy_document.deploy.json
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  role = aws_iam_role.this.name
}

#ECS用
resource "aws_iam_policy" "ecs_instance_policy" {
  name        = "ecs-instance-policy"
  path        = "/"
  description = ""
  policy      = data.aws_iam_policy_document.ecs_instance_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role_attach" {
  role = aws_iam_role.this.name
  policy_arn = aws_iam_policy.ecs_instance_policy.arn
}

output "ecs_instance_profile_name" {
      value = aws_iam_instance_profile.ecs_instance_profile.name
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
