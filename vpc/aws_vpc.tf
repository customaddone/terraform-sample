# VPCは他のネットワークから論理的に切り離されたネットワークです
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  # AWSのDNSサーバーによる名前解決を有効にする
  enable_dns_support   = true
  enable_dns_hostnames = true

  # タグをつけてコンソール上でわかりやすく
  tags = {
    Name = "example"
  }
}

# 送信元で下記のように書く
# terraform applyする
output "example_id" {
  value = "${aws_vpc.example.id}"
}

output "cidr_block" {
  value = "${aws_vpc.example.cidr_block}"
}
