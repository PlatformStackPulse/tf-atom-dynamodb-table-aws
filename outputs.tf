output "id" {
  description = "ID of the DynamoDB table"
  value       = try(aws_dynamodb_table.this[0].id, null)
}

output "arn" {
  description = "ARN of the DynamoDB table"
  value       = try(aws_dynamodb_table.this[0].arn, null)
}

output "name" {
  description = "Name of the DynamoDB table"
  value       = try(aws_dynamodb_table.this[0].name, null)
}

output "hash_key" {
  description = "Hash key of the table"
  value       = try(aws_dynamodb_table.this[0].hash_key, null)
}

output "stream_arn" {
  description = "ARN of the DynamoDB table stream"
  value       = try(aws_dynamodb_table.this[0].stream_arn, null)
}
