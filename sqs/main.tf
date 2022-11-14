provider "aws"{
    region = "us-east-1"
}

resource "aws_sqs_queue" "sample_queue" {
    name = "terraform_sample_queue"
    delay_seconds = 90
    max_message_size = 2048
    message_retention_seconds = 86400
    receive_wait_time_seconds = 10
    tags = {
      Name = "SQS Queue"
    }
}

output "queue_id" {
    value = aws_sqs_queue.sample_queue.id
}