variable "project_name" {
  description = "The name of the project."
}

variable "repository_names" {
  description = "A list of ECR repository names to create."
  type        = list(string)
}
