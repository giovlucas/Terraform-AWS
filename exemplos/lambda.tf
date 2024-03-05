# lambda.tf

# Definição da função Lambda
resource "aws_lambda_function" "minha_funcao_lambda" {
  function_name = "minha-funcao-lambda"               # Nome da função Lambda
  filename      = "caminho/para/o/arquivo.zip"        # Caminho para o código da função Lambda (arquivo .zip)
  handler       = "handler"                           # Nome da função handler no código

  runtime       = "nodejs14.x"                        # Versão do ambiente de execução da função Lambda
  role          = aws_iam_role.role_lambda.arn        # ARN (Amazon Resource Name) do role IAM associado à função Lambda

  # Configurações adicionais, como variáveis de ambiente, timeout, etc.
  # Consulte a documentação do Terraform para opções adicionais

  tags = {
    Name        = "MinhaFuncaoLambda"                # Tag para nomear a função Lambda
    Environment = "Producao"                          # Outras tags conforme necessário
  }
}

# Definição do role IAM para a função Lambda
resource "aws_iam_role" "role_lambda" {
  name = "role-lambda"                                # Nome do role IAM
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}
  # Política de permissão da função Lambda
  # Personalize esta política conforme necessário para as permissões da sua função Lambda
