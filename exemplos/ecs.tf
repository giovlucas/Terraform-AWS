# ecs.tf

# Definição do cluster ECS
resource "aws_ecs_cluster" "meu_cluster_ecs" {
  name = "meu-cluster-ecs"                       # Nome do cluster ECS

  tags = {
    Name = "MeuClusterECS"                       # Tag para nomear o cluster ECS
  }
}

# Definição do role IAM para o ECS
resource "aws_iam_role" "meu_role_ecs" {
  name = "meu-role-ecs"                          # Nome do role IAM
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ecs.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "MeuRoleECS"                          # Tag para nomear o role IAM
  }
}
