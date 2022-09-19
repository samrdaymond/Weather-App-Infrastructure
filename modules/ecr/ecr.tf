#create ECR Repo
resource "aws_ecr_repository" "samrdaymond_wa_repo" {
    name = "samrdaymond_weather_app"
    image_tag_mutability = "MUTABLE"
    force_delete = true
    image_scanning_configuration {
    scan_on_push = false
    }
}

#create role for ECS to ECR access
resource "aws_iam_role" "samrdaymond_Ecs_EcrAccessRole" {
  name = "samrdaymondEcsEcrAccess"
  path = "/"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:BatchGetImage",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetAuthorizationToken"
            ],
            "Resource": "*"
        }
    ]
  })
}

#create ecs execution role and policy

resource "aws_iam_role" "samrdaymondEcsExecutionRole" {
  name = "samrdaymondEcsExecutionRole"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ecs-tasks.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

#attach role policy
resource "aws_iam_role_policy_attachment" "ecr_role_policy_attachment" {
  role = aws_iam_role.samrdaymondEcsExecutionRole.name
  policy_arn = aws_iam_role.samrdaymond_Ecs_EcrAccessRole
}

resource "aws_ecr_repository_policy" "samrdaymond_wa_ecrrepopolicy" {
  repository = aws_ecr_repository.samrdaymond_wa_repo

  policy = {
    "Version": "2008-10-17",
        "Statement": [
            {
                "Sid": "Attach ECR Policy with Role",
                "Effect": "Allow",
                "Principal": {
                    "AWS": "${aws_iam_role.samrdaymondEcsExecutionRole.arn}"
                },
                "Action": [
                "ecr:*"
                ]
            }
  ]
  }
}

resource "aws_ssm_parameter" "ecr_repo_url" {
  name = "samrdaymond/wa/ecr/ecr_repo_url"
  type = "String"
  overwrite = true
  value = aws_ecr_repository.samrdaymond_wa_repo.repository_url
}

resource "aws_ssm_parameter" "samrdaymond_ecs_execution_role_arn" {
  name = "samrdaymond/wa/ecr/execution_role_arn"
  type = "String"
  overwrite = true
  value = aws_iam_role.samrdaymondEcsExecutionRole.arn
}


