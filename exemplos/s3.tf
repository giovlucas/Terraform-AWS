# s3.tf

# Definição do bucket S3
resource "aws_s3_bucket" "meu_bucket" {
  bucket = "meu-bucket-unico"          # Nome único do bucket
# acl    = "private"                   # Configuração de controle de acesso (ACL)

  tags = {
    Name        = "MeuBucket"          # Tag para nomear o bucket
    Environment = "Producao"           # Outras tags conforme necessário
  }
}



# O parâmetro acl define as configurações de controle de acesso do bucket, neste caso, como private, 
# o que significa que somente o proprietário do bucket terá acesso aos objetos.

# Lembre-se de que os nomes de bucket devem ser únicos em todo o serviço S3, 
# então você pode precisar alterar o nome do bucket se o nome especificado já estiver em uso.