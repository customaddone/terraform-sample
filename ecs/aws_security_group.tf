resource "aws_security_group" "example" {
  name        = "handson-ecs"
  description = "handson ecs"

  # セキュリティグループを配置するVPC
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id

  # セキュリティグループ内のリソースからインターネットへのアクセス許可設定
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "handson-ecs"
  }
}

# SecurityGroup Rule
resource "aws_security_group_rule" "example" {
  security_group_id = "${aws_security_group.example.id}"

  # インターネットからセキュリティグループ内のリソースへのアクセス許可設定
  type = "ingress"

  # TCPでの80ポートへのアクセスを許可する
  from_port = 80
  to_port   = 80
  protocol  = "tcp"

  # 同一VPC内からのアクセスのみ許可
  cidr_blocks = ["10.0.0.0/16"]
}

# ECS Service
resource "aws_ecs_service" "example" {
  name = "handson"

  # 当該ECSサービスを配置するECSクラスターの指定
  cluster = "${aws_ecs_cluster.example.name}"

  # データプレーンとしてFargateを使用する
  launch_type = "FARGATE"

  # ECSタスクの起動数を定義
  desired_count = "2"

  # 起動するECSタスクのタスク定義
  task_definition = "${aws_ecs_task_definition.example.arn}"

  # ECSタスクへ設定するネットワークの設定
  network_configuration {
    # タスクの起動を許可するサブネット
    subnets         = [
      data.terraform_remote_state.vpc.outputs.public_0,
      data.terraform_remote_state.vpc.outputs.public_1,
    ]
    # タスクに紐付けるセキュリティグループ
    security_groups = ["${aws_security_group.example.id}"]
  }

  # ECSタスクの起動後に紐付けるELBターゲットグループ
  load_balancer{
      target_group_arn = data.terraform_remote_state.alb.outputs.target_group_arn
      container_name   = "nginx"
      container_port   = "80"
  }
}
