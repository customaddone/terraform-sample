# ルーティングテーブルに追加するルートのリソースは次のコードで定義されます。
resource "aws_route" "public_route" {
  # route_table_id: 登録するルーティングテーブルの id を指定します。
  route_table_id         = "${aws_route_table.public_route_table.id}"
  # destination_cidr_block: 宛先の CIRR ブロックを指定します。
  destination_cidr_block = "0.0.0.0/0"
  # gateway_id: インターネットゲートウェイの id を指定します。
  gateway_id             = "${aws_internet_gateway.internet_gateway.id}"
}
