output "ecr_repo_url" {
  description = "URL of the ECR repo"
  value       = aws_ecr_repository.samrdaymond_wa_repo.repository_url
}

output "ecr_name" {
  value = aws_ecr_repository.samrdaymond_wa_repo.name
}

output "samrdaymond_wa_ecs_task_execution_role_arn" {
  value = aws_iam_role.samrdaymondEcsExecutionRole.arn
}