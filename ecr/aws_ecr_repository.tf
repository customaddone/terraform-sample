# ECRはDockerイメージを保管します
resource "aws_ecr_repository" "example" {
  name = "example"
}
