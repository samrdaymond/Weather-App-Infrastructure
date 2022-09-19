output "ecr_repo_url" {
  description = "URL of the ECR repo"
  value       = aws_ecr_repository.ecr.repository_url
}

output "ecr_name" {
  value = aws_ecr_repository.samrdaymond_wa_repo.name
}