#タスク定義ではコンテナ実行時の設定を記述する
resource "aws_ecs_task_definition" "example" {
  family                   = "example"
  container_definitions    = file("./container_definitions.json")
  task_role_arn = "${data.terraform_remote_state.aws_iam.ecs_task_role_arn}"
  network_mode  = "bridge"
}
