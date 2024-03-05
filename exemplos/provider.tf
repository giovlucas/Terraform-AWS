# provider.tf

# Declaração do provedor AWS
provider "aws" {
  region = "us-west-2"  # substitua pela região AWS desejada
}


# Antes de usar este arquivo, você precisará configurar suas credenciais da AWS, 
# geralmente definindo as variáveis de ambiente AWS_ACCESS_KEY_ID e AWS_SECRET_ACCESS_KEY, 
# ou configurando o arquivo ~/.aws/credentials.

# Após configurar suas credenciais e personalizar o arquivo provider.tf conforme necessário,
# você pode usá-lo em conjunto com outros arquivos Terraform para criar, modificar ou excluir recursos na AWS. 
# Certifique-se de que este arquivo esteja no mesmo diretório que seus outros arquivos Terraform, 
# e o Terraform usará automaticamente este provedor ao executar os comandos.