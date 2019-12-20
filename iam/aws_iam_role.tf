resource "aws_iam_role" "ecs_instance_role" {
  # name IAMロールの名前を指定します
  name = "ecs_instance_role"
  # path 一意なパスを指定します
  path = "/"
  # assumeポリシーを指定します
  assume_role_policy = "${file("aws_iam_role_policies/ec2_assume_role_policy.js
on")}"
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "ecs-task-role"
  path               = "/"
  assume_role_policy = "${file("aws_iam_role_policies/ecs_task_assume_role_policy.json")}"
}
