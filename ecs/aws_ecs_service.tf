resource "aws_ecs_service" "example" {
  name                              = "example"
  cluster                           = aws_ecs_cluster.example.arn
  task_definition                   = aws_ecs_task_definition.example.arn
  desired_count                     = 2
  launch_type                       = "EC2"
}

module "nginx_sg" {
  source      = "./aws_security_group"
  name        = "nginx-sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id
  port        = 80
  cidr_blocks = ["10.0.0.0/16"]
}

output "ecs_service_name" {
  value = aws_ecs_service.example.name
}
