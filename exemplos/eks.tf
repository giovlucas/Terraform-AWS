# eks.tf

# Definição do cluster EKS
resource "aws_eks_cluster" "meu_cluster_eks" {
  name     = "meu-cluster-eks"                   # Nome do cluster EKS
  role_arn = aws_iam_role.meu_role_eks.arn      # ARN (Amazon Resource Name) do role IAM associado ao cluster EKS
  version  = "1.21"                              # Versão do Kubernetes

  vpc_config {
    subnet_ids         = [aws_subnet.public_subnet.id]  # IDs das sub-redes onde o cluster EKS será lançado
    security_group_ids = [aws_security_group.meu_sg.id] # ID do grupo de segurança para o cluster EKS
    endpoint_private_access = true                # Habilita o acesso privado ao endpoint do cluster EKS
    endpoint_public_access  = true                # Habilita o acesso público ao endpoint do cluster EKS
  }

  tags = {
    Name = "MeuClusterEKS"                       # Tag para nomear o cluster EKS
  }
}

# Definição do role IAM para o cluster EKS
resource "aws_iam_role" "meu_role_eks" {
  name = "meu-role-eks"                         # Nome do role IAM
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "MeuRoleEKS"                         # Tag para nomear o role IAM
  }
}

# Definição do grupo de segurança para o cluster EKS
resource "aws_security_group" "meu_sg" {
  name        = "meu-sg"                         # Nome do grupo de segurança
  description = "Permite tráfego para o cluster EKS"
  vpc_id      = aws_vpc.minha_vpc.id             # ID da VPC onde o cluster EKS será lançado

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]                   # Permite todo o tráfego de saída
  }

  tags = {
    Name = "MeuSG"                                # Tag para nomear o grupo de segurança
  }
}
