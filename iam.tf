# I'd love to move the policies to their own json, but per terraform v12 docs:
#
#     If the string you want to generate will be in JSON or YAML syntax,
#     it's often tricky and tedious to write a template that will generate
#     valid JSON or YAML that will be interpreted correctly when using lots of
#     individual interpolation sequences and directives.
#
# https://www.terraform.io/docs/configuration/functions/templatefile.html#generating-json-or-yaml-from-a-template

##############################################################################
# Deploy blog.vogt4nick.com ##################################################
##############################################################################
resource "aws_iam_user" "github_deploy_blog_vogt4nick_com" {
  name = "github-deploy-blog.vogt4nick.com"
  tags = var.common_tags
}

resource "aws_iam_access_key" "github_deploy_blog_vogt4nick_com" {
  user = aws_iam_user.github_deploy_blog_vogt4nick_com.name
}

resource "aws_iam_user_policy" "github_deploy_blog_vogt4nick_com" {
  name = "DeployBlogVogt4nickStaticSite"
  user = aws_iam_user.github_deploy_blog_vogt4nick_com.name

  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.blog_vogt4nick_com.arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListObjectsV2",
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Resource": [
        "${aws_s3_bucket.blog_vogt4nick_com.arn}/*"
      ]
    }
  ]
}
EOF
}

##############################################################################
# Deploy recipes.vogt4nick.com ###############################################
##############################################################################
resource "aws_iam_user" "github_deploy_recipes_vogt4nick_com" {
  name = "github-deploy-recipes.vogt4nick.com"
  tags = var.common_tags
}

resource "aws_iam_access_key" "github_deploy_recipes_vogt4nick_com" {
  user = aws_iam_user.github_deploy_recipes_vogt4nick_com.name
}

resource "aws_iam_user_policy" "github_deploy_recipes_vogt4nick_com" {
  name = "DeployRecipesVogt4nickStaticSite"
  user = aws_iam_user.github_deploy_recipes_vogt4nick_com.name

  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.recipes_vogt4nick_com.arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListObjectsV2",
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Resource": [
        "${aws_s3_bucket.recipes_vogt4nick_com.arn}/*"
      ]
    }
  ]
}
EOF
}

##############################################################################
# Deploy vogt4nick.com #######################################################
##############################################################################
resource "aws_iam_user" "github_deploy_vogt4nick_com" {
  name = "github-deploy-vogt4nick.com"
  tags = var.common_tags
}

resource "aws_iam_access_key" "github_deploy_vogt4nick_com" {
  user = aws_iam_user.github_deploy_vogt4nick_com.name
}

resource "aws_iam_user_policy" "github_deploy_vogt4nick_com" {
  name = "DeployVogt4nickStaticSite"
  user = aws_iam_user.github_deploy_vogt4nick_com.name

  policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": [
        "${aws_s3_bucket.vogt4nick_com.arn}"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:GetObjectAcl",
        "s3:ListObjectsV2",
        "s3:PutObject",
        "s3:PutObjectAcl"
      ],
      "Resource": [
        "${aws_s3_bucket.vogt4nick_com.arn}/*"
      ]
    }
  ]
}
EOF
}
