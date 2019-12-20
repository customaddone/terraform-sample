# VPCの作成
resource "aws_vpc" "vpc" {
  # 起点となるIPアドレスの設定を行います
  cidr_block            = "10.0.0.0/16"
  # VPC内で立ち上げるインスタンスを占有するか設定します
  instance_tenancy      = "default"
  # VPCに対してDNS解決がサポートされるかを設定します
  enable_dns_support    = true
  # VPC内で起動するインスタンスがパブリックなDNSホスト名を取得するか
  enable_dns_hostnames = true
}
