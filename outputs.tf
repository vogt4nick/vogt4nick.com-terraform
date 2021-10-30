output "blog_vogt4nick_com_access_keys" {
  value = {
    aws_access_key_id     = aws_iam_access_key.github_deploy_blog_vogt4nick_com.id
    aws_secret_access_key = aws_iam_access_key.github_deploy_blog_vogt4nick_com.secret
  }
  sensitive = true
}

output "recipes_vogt4nick_com_access_keys" {
  value = {
    aws_access_key_id     = aws_iam_access_key.github_deploy_recipes_vogt4nick_com.id
    aws_secret_access_key = aws_iam_access_key.github_deploy_recipes_vogt4nick_com.secret
  }
  sensitive = true
}

output "rezepte_vogt4nick_com_access_keys" {
  value = {
    aws_access_key_id     = aws_iam_access_key.github_deploy_rezepte_vogt4nick_com.id
    aws_secret_access_key = aws_iam_access_key.github_deploy_rezepte_vogt4nick_com.secret
  }
  sensitive = true
}

output "vogt4nick_com_access_keys" {
  value = {
    aws_access_key_id     = aws_iam_access_key.github_deploy_vogt4nick_com.id
    aws_secret_access_key = aws_iam_access_key.github_deploy_vogt4nick_com.secret
  }
  sensitive = true
}
