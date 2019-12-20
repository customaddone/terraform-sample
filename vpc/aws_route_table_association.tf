# ルートテーブルとサブネットを紐付ける関連のリソースは次のコードで定義されます。
resource "aws_route_table_association" "public_route_table_assocication" {
  #subnet_id: 紐付けるサブネットの id を指定します。
  subnet_id      = "${aws_subnet.public_subnet_1.id}"
  #route_table_id: 紐付けるルートテーブルの id を指定します。
  route_table_id = "${aws_route_table.public_route_table.id}"
}
