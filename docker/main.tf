# Arquivo main.tf

# Definindo o provedor AWS
provider "aws" {
  region = "us-east-1" # Altere para a região desejada
}

# Recurso para criar uma instância EC2
resource "aws_instance" "docker_host" {
  ami           = "ami-0c55b159cbfafe1f0" # AMI padrão do Amazon Linux 2
  instance_type = "t2.micro"

  # Script de inicialização para instalar Docker na instância
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              EOF
}

# Recurso para executar o contêiner do frontend
resource "aws_ecs_task_definition" "frontend" {
  family                   = "frontend"
  container_definitions    = <<DEFINITION
[
  {
    "name": "frontend",
    "image": "sua_imagem_frontend:latest",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_service" "frontend" {
  name            = "frontend"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.frontend.arn
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.main.id]
    security_groups = [aws_security_group.frontend.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.frontend.arn
    container_name   = "frontend"
    container_port   = 80
  }
}

# Recurso para executar o contêiner do backend
resource "aws_ecs_task_definition" "backend" {
  family                   = "backend"
  container_definitions    = <<DEFINITION
[
  {
    "name": "backend",
    "image": "sua_imagem_backend:latest",
    "cpu": 256,
    "memory": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 3000,
        "hostPort": 3000
      }
    ]
  }
]
DEFINITION
}

resource "aws_ecs_service" "backend" {
  name            = "backend"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.backend.arn
  desired_count   = 1

  network_configuration {
    subnets         = [aws_subnet.main.id]
    security_groups = [aws_security_group.backend.id]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.backend.arn
    container_name   = "backend"
    container_port   = 3000
  }
}
