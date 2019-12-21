resource "aws_ecs_task_definition" "example" {
  family                   = "example"
  # タスクが使用するリソースのサイズ
  cpu                      = "256"
  memory                   = "512"
  # ネットワークモード
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./container_definitions.json")
}
