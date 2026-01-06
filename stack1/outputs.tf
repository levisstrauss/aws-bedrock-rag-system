output "aurora_cluster_endpoint" {
  description = "Aurora cluster endpoint for connections"
  value       = module.aurora_serverless.cluster_endpoint
}

output "aurora_reader_endpoint" {
  description = "Aurora reader endpoint"
  value       = module.aurora_serverless.cluster_reader_endpoint
}

output "aurora_cluster_arn" {
  description = "ARN of Aurora cluster (NEEDED FOR STACK 2)"
  value       = module.aurora_serverless.database_arn
}

output "aurora_secret_arn" {
  description = "ARN of Secrets Manager secret (NEEDED FOR STACK 2)"
  value       = module.aurora_serverless.database_secretsmanager_secret_arn
}

output "database_name" {
  description = "Database name"
  value       = var.database_name
}

output "master_username" {
  description = "Master username"
  value       = var.master_username
  sensitive   = true
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnets
}

output "s3_bucket_name" {
  description = "S3 bucket name (NEEDED FOR STACK 2 AND UPLOAD SCRIPT)"
  value       = module.s3_bucket.s3_bucket_id
}

output "s3_bucket_arn" {
  description = "S3 bucket ARN (NEEDED FOR STACK 2)"
  value       = module.s3_bucket.s3_bucket_arn
}
