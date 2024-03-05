# sns.tf

# Definição do tópico SNS
resource "aws_sns_topic" "meu_topico_sns" {
  name = "meu-topico-sns"                # Nome do tópico SNS

  tags = {
    Name = "MeuTopicoSNS"                # Tag para nomear o tópico SNS
  }
}
