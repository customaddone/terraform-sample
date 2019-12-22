# remote_state を設定し vpc という名前で参照できるようにしています
module "http_sg" {
  source      = "./aws_security_group"
  name        = "http-sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id
  port        = 80
  cidr_blocks = ["0.0.0.0/0"]
}

module "https_sg" {
  source      = "./aws_security_group"
  name        = "https-sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id
  port        = 443
  cidr_blocks = ["0.0.0.0/0"]
}

module "http_redirect_sg" {
  source      = "./aws_security_group"
  name        = "http-redirect-sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id
  port        = 8080
  cidr_blocks = ["0.0.0.0/0"]
}
