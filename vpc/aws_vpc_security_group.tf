#AWSのファイアウォールには、サブネット単位で動く「ネットワークACL」と
#インスタンスレベルで動く「セキュリティグループ」がある
#セキュリティグループ本体です
resource "aws_security_group" "example" {
  name   = "example"
  vpc_id = aws_vpc.example.id
}

# typeがingressの場合インバウンドルールになります
resource "aws_security_group_rule" "ingress_example" {
  type              = "ingress"
  #80番ポートで通信する
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.example.id
}

# typeがengressの場合アウトバウンドルールになります
resource "aws_security_group_rule" "egress_example" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.example.id
}

module "example_sg" {
   source      = "./aws_security_group"
   name        = "module-sg"
   vpc_id      = aws_vpc.example.id
   port        = 80
   cidr_blocks = ["0.0.0.0/0"]
 }
