output "jenkins_user_access_key" {
  value = aws_iam_access_key.jenkins.id
  sensitive = true
}

output "jenkins_user_secret_key" {
  value = aws_iam_access_key.jenkins.secret
  sensitive = true
}
