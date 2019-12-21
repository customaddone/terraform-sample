# route53で独自ドメインを扱える
data "aws_route53_zone" "example" {
  name = "wikiforlearningenglish.com"
}
