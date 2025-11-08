output "repository_urls" {
  value = aws_ecr_repository.main.*.repository_url
}
