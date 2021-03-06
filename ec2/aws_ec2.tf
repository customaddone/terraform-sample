resource "aws_security_group" "instance" {
  name        = "instance"
  description = "instance sg"
  vpc_id      = data.terraform_remote_state.vpc.outputs.example_id
}

data "template_file" "user_data" {
  template = "${file("./user_data.tpl")}"
}

resource "aws_instance" "sample" {
  ami                         = "ami-05b296a384694dfa4"
  instance_type               = "t2.small"
  monitoring                  = true
  iam_instance_profile        = data.terraform_remote_state.iam.outputs.ecs_instance_profile_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.private_0
  user_data                   = data.template_file.user_data.rendered
  associate_public_ip_address = true

  vpc_security_group_ids = [
        "${aws_security_group.instance.id}",
  ]

  root_block_device {
    volume_size = "20"
    volume_type = "gp2"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/vpc/terraform.tfstate"
    region = "ap-northeast-1"
  }
}


data "terraform_remote_state" "iam" {
  backend = "s3"
  config = {
    bucket = "customaddone-private-pragmatic-terraform"
    key    = "sample/iam/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
