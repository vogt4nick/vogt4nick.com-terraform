# Do not track CNAME, SOA, or NS records.
# AWS manages these, and we really don't want to change them.

data "aws_route53_zone" "vogt4nick_com" {
  name         = "vogt4nick.com."
  private_zone = false
}

resource "aws_route53_record" "vogt4nick_com" {
  name    = "vogt4nick.com"
  zone_id = data.aws_route53_zone.vogt4nick_com.id
  type    = "A"
  alias {
    name                   = aws_s3_bucket.vogt4nick_com.website_domain
    zone_id                = aws_s3_bucket.vogt4nick_com.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www_vogt4nick_com" {
  name    = "www.vogt4nick.com"
  zone_id = data.aws_route53_zone.vogt4nick_com.id
  type    = "A"
  alias {
    name                   = aws_s3_bucket.www_vogt4nick_com.website_domain
    zone_id                = aws_s3_bucket.www_vogt4nick_com.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "recipes_vogt4nick_com" {
  name    = "recipes.vogt4nick.com"
  zone_id = data.aws_route53_zone.vogt4nick_com.id
  type    = "A"
  alias {
    name                   = aws_s3_bucket.recipes_vogt4nick_com.website_domain
    zone_id                = aws_s3_bucket.recipes_vogt4nick_com.hosted_zone_id
    evaluate_target_health = false
  }
}
