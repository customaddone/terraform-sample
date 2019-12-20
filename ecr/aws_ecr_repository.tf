# sample-imageという名前でECRを作成します
resource "aws_ecr_repository" "sample-image" {
  name = "sample-image"
}
