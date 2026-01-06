variable "aws_region" {
  description = "AWS region (MUST match Stack 1)"
  type        = string
  default     = "us-east-1"
}

variable "knowledge_base_name" {
  description = "Knowledge Base name"
  type        = string
  default     = "bedrock-document-kb"
}

variable "knowledge_base_description" {
  description = "Knowledge Base description"
  type        = string
  default     = "Knowledge Base for RAG system connected to Aurora PostgreSQL and S3"
}

variable "aurora_arn" {
  description = "Aurora cluster ARN (FROM STACK 1)"
  type        = string
  default     = ""
}

variable "aurora_secret_arn" {
  description = "Secrets Manager secret ARN (FROM STACK 1)"
  type        = string
  default     = ""
}

variable "aurora_endpoint" {
  description = "Aurora endpoint (FROM STACK 1)"
  type        = string
  default     = ""
}

variable "aurora_db_name" {
  description = "Database name (MUST match Stack 1)"
  type        = string
  default     = "postgres"
}

variable "aurora_username" {
  description = "Database username (MUST match Stack 1)"
  type        = string
  default     = "bedrock_admin"
}

variable "aurora_table_name" {
  description = "Full table name with schema"
  type        = string
  default     = "bedrock_integration.bedrock_kb"
}

variable "aurora_primary_key_field" {
  description = "Primary key column name"
  type        = string
  default     = "id"
}

variable "aurora_metadata_field" {
  description = "Metadata column name"
  type        = string
  default     = "metadata"
}

variable "aurora_text_field" {
  description = "Text column name"
  type        = string
  default     = "chunks"
}

variable "aurora_vector_field" {
  description = "Vector column name"
  type        = string
  default     = "embedding"
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN (FROM STACK 1)"
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "bedrock-rag-system"
    Stack       = "stack2"
  }
}
