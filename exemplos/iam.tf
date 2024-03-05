# iam.tf

# Definição do role IAM
resource "aws_iam_role" "meu_role_iam" {
  name               = "meu-role-iam"                    # Nome do role IAM
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"          # Serviço que pode assumir esse role
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = {
    Name = "MeuRoleIAM"                                # Tag para nomear o role IAM
  }
}
