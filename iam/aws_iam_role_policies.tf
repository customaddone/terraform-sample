# AWSのサービスに権限を付与するためにIAMロールを作成します
# IAMロールでは、自身を何のサービスに関連づけるか宣言する必要があります

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"
      # このIAMロールはEC2にのみ関連づけできる
      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}
