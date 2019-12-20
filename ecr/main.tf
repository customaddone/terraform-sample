# AMIはソフトウェア構成を記録したテンプレートのこと
# Amazon Linux 2のAMIをベースにEC2インスタンスを生成します
resource "aws_instance" "example"{
  ami = "ami-0c3fd0f5d33134a76"
  instance_type = "t3.micro"

  # タグを追加
  # → terraform apply
  tags = {
    Name = "example"
  }
}
