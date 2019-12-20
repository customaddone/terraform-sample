resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id // <= HCL2 の記法に変更
}
