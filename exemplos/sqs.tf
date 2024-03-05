# sqs.tf

# Definição da fila SQS
resource "aws_sqs_queue" "minha_fila_sqs" {
  name                      = "minha-fila-sqs"               # Nome da fila SQS
  delay_seconds             = 0                               # Tempo de espera antes que novas mensagens possam ser retiradas
  max_message_size          = 262144                          # Tamanho máximo da mensagem em bytes
  message_retention_seconds = 345600                          # Tempo de retenção padrão das mensagens na fila
  visibility_timeout_seconds = 30                             # Tempo que as mensagens estão invisíveis após serem lidas
  receive_wait_time_seconds = 10                              # Tempo que o recebimento de mensagens espera antes de retornar
  fifo_queue                = false                           # Define se a fila é uma fila FIFO ou padrão (true para FIFO, false para padrão)

  tags = {
    Name = "MinhaFilaSQS"                                    # Tag para nomear a fila SQS
  }
}
