# Arquivo main.tf

# Declaração do provedor AWS
provider "aws" {
  region = "us-west-2"  # substitua pela região AWS desejada
}

# Definição da instância EC2
resource "aws_instance" "minha_instancia" {
  ami           = "ami-0c55b159cbfafe1f0" # substitua pela AMI desejada
  instance_type = "t2.micro"              # tipo de instância (tamanho)
  key_name      = "my-key-pair"           # nome da chave SSH para acesso à instância

  tags = {
    Name = "MinhaInstancia"               # nome da instância (tag)
  }
}


