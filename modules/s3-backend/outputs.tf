output "bucket_name" {
  value = aws_s3_bucket.tfstate.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.tfstate.arn
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.locks.name
}

output "dynamodb_table_arn" {
  value = aws_dynamodb_table.locks.arn
}
