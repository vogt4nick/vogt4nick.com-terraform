output "travis_access_keys" {
    value = {
        aws_access_key_id = aws_iam_access_key.travis.id
        aws_secret_access_key = aws_iam_access_key.travis.secret
    }
    sensitive = true
}