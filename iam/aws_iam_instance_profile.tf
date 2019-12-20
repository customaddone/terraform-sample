resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecs-instance-profile"
  # role IAMインスタンスプロファイルに割り当てるロールを指定します
  role = "${aws_iam_role.ecs_instance_role.name}"
}
