# HTTPS化するために必要なSSL
resource "aws_acm_certificate" "example" {
  domain_name               = aws_route53_record.example.name
  subject_alternative_names = []
  # ドメインの所有権の検証方法
  validation_method         = "DNS"

  lifecycle {
    # 新しいSSL証明書を作ってから、古いSSLと差し替える
    create_before_destroy = true
  }
}
