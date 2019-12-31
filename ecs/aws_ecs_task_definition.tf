resource "aws_ecs_task_definition" "example" {
  family                   = "example"
  network_mode             = "bridge"
  task_role_arn = data.terraform_remote_state.iam.outputs.ecs_task_role_arn
  container_definitions    = file("./container_definitions.json")
}
