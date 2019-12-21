# VPCは隔絶されたネットワークであり、単体ではインターネットと接続出来ません
# インターネットゲートウェイを作成し、VPCとインターネットの間で通信ができるように
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
}
