resource "aws_ecs_task_definition" "example" {
  family = "handson"

  # データプレーンの選択
  requires_compatibilities = ["FARGATE"]

  # ECSタスクが使用可能なリソースの上限
  # タスク内のコンテナはこの上限内に使用するリソースを収める必要があり、メモリが上限に達した場合OOM Killer にタスクがキルされる
  cpu    = "256"
  memory = "512"

  # ECSタスクのネットワークドライバ
  # Fargateを使用する場合は"awsvpc"決め打ち
  network_mode = "awsvpc"

# 503出てたのはこれのせいらしい
  container_definitions = <<EOL
 [
   {
     "name": "example",
     "image": "nginx:latest",
     "portMappings": [
       {
         "containerPort": 80,
         "hostPort": 80
       }
     ]
   }
 ]
 EOL
 }
