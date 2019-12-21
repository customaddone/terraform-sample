# resource "aws_nat_gateway" "example" {
  # EIPを指定します
  # allocation_id = aws_eip.nat_gateway_0.id
  # NATゲートウェイを配置するパブリックサブネットを指定します
  # subnet_id     = aws_subnet.public_0.id
  # EIPやNATは暗黙的にインターネットゲートウェイに依存しています
  # 下記で明示しています
  # depends_on    = [aws_internet_gateway.example]
#}
