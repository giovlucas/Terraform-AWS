# vpc.tf

# Criação da VPC
resource "aws_vpc" "minha_vpc" {
  cidr_block = "10.0.0.0/16"      # CIDR block para a VPC

  tags = {
    Name = "MinhaVPC"             # Nome da VPC
  }
}

# Subnet pública
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.minha_vpc.id    # ID da VPC
  cidr_block              = "10.0.1.0/24"           # CIDR block para a subnet pública
  availability_zone       = "us-west-2a"            # Zona de disponibilidade
  map_public_ip_on_launch = true                    # Associa IPs públicos automaticamente

  tags = {
    Name = "SubnetPublica"                          # Nome da subnet pública
  }
}

# Subnet privada
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.minha_vpc.id    # ID da VPC
  cidr_block = "10.0.2.0/24"           # CIDR block para a subnet privada
  availability_zone = "us-west-2b"      # Zona de disponibilidade

  tags = {
    Name = "SubnetPrivada"             # Nome da subnet privada
  }
}
