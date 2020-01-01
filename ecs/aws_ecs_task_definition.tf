#タスク定義ではコンテナ実行時の設定を記述する
resource "aws_ecs_task_definition" "example" {
  family                   = "example"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = data.terraform_remote_state.iam.outputs.ecs_role_arn
  container_definitions    = file("./container_definitions.json")
}
