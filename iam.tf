# I'd love to move the policies to their own json, but per terraform v12 docs:
#
#     If the string you want to generate will be in JSON or YAML syntax,
#     it's often tricky and tedious to write a template that will generate
#     valid JSON or YAML that will be interpreted correctly when using lots of
#     individual interpolation sequences and directives.
#
# https://www.terraform.io/docs/configuration/functions/templatefile.html#generating-json-or-yaml-from-a-template

resource "aws_iam_user" "travis" {
  name = "travis"
  tags = var.common_tags
}

resource "aws_iam_access_key" "travis" {
  user = aws_iam_user.travis.name
}

resource "aws_iam_role" "DeployVogt4nickStaticSite" {
  name = "DeployVogt4nickStaticSite"

  assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "AWS": [
          "${aws_iam_user.travis.arn}"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "DeployVogt4nickStaticSite" {
  name = "DeployVogt4nickStaticSite"
  role = aws_iam_role.DeployVogt4nickStaticSite.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "${aws_s3_bucket.vogt4nick_com.arn}",
        "${aws_s3_bucket.recipes_vogt4nick_com.arn}"
      ]
    }
  ]
}
EOF
}
