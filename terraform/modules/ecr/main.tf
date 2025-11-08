resource "aws_ecr_repository" "main" {
  count = length(var.repository_names)
  name  = "${var.project_name}-${var.repository_names[count.index]}"
}
