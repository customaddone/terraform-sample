# ECSサービスは起動するタスクの数を定義し、指定した数のタスクを維持します
resource "aws_ecs_service" "example" {
  name                              = "example"
  cluster                           = aws_ecs_cluster.example.arn
  task_definition                   = aws_ecs_task_definition.example.arn
  # ECSサービスが維持するタスク数
  desired_count                     = 2
  launch_type                       = "FARGATE"
  # latestの使用は避けましょう
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 60

  network_configuration {
    assign_public_ip = false
    security_groups  = [module.nginx_sg.security_group_id]

    subnets = [
      data.terraform_remote_state.vpc.outputs.public_0,
      data.terraform_remote_state.vpc.outputs.public_1,
    ]
  }

  load_balancer {
    target_group_arn = data.terraform_remote_state.alb.outputs.target_group_arn
    container_name   = "example"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [task_definition]
  }
}

module "nginx_sg" {
  source      = "./aws_security_group"
  name        = "nginx-sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id
  port        = 80
  cidr_blocks = [data.terraform_remote_state.vpc.outputs.cidr_block]
}
