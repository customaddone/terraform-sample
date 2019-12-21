# セキュリティグループはインスタンスレベルで動作します
# セキュリティグループを使うと、OSへ到達する前にネットワークレベルでパケットをフィルタリングします


resource "aws_security_group" "example" {
  name   = "example"
  vpc_id = aws_vpc.example.id
}
