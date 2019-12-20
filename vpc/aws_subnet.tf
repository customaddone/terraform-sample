# サブネットを作成します
# サブネットは VPC 内のアドレス空間をさらに分割し、別々のアベイラビリティゾーンを指定し冗長化することが可能です。
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.0.0/20"
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.0.16.0/20"
  availability_zone = "ap-northeast-1c"
}
