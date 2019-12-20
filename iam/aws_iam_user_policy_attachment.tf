resource "aws_iam_user_policy_attachment" "deploy-attach" {
  # ポリシーにアタッチする対象ユーザーの名前を指定します
  user       = "${aws_iam_user.deploy-user.name}"
  # アタッチするポリシーのAmazon Resource Nameを指定します
  policy_arn = "${aws_iam_policy.deploy.arn}"
}
