# インターネットゲートウェイだけではまだインターネットと通信できません
# ネットワークにデータを流すためにルーティング情報を管理するルートテーブルが必要です
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.example.id
}
