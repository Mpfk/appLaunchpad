resource "aws_iam_policy" "amplify_codecommit_access" {
  name        = "${var.project}-amplify-codecommit-access"
  description = "Policy for Amplify to access CodeCommit repository"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "codecommit:GitPull",
        ]
        Effect   = "Allow"
        Resource = aws_codecommit_repository.repo.arn
      },
    ]
  })
}

resource "aws_iam_role" "amplify_access_role" {
  name = "${var.project}-amplify-access-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "amplify.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "amplify_codecommit_attach" {
  role       = aws_iam_role.amplify_access_role.name
  policy_arn = aws_iam_policy.amplify_codecommit_access.arn
}