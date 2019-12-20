# サブネットを作成するだけではインターネットに公開はされません。
# インターネット ゲートウェイを作成し、インターネットから接続できるようにします。
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = "${aws_vpc.vpc.id}"
}
