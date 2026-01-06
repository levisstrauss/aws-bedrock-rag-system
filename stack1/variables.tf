variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "bedrock-rag-system"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "bedrock-poc-vpc"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cluster_identifier" {
  description = "Aurora cluster identifier"
  type        = string
  default     = "my-aurora-serverless"
}

variable "database_name" {
  description = "Database name"
  type        = string
  default     = "postgres"
}

variable "master_username" {
  description = "Master username"
  type        = string
  default     = "bedrock_admin"
}

variable "aurora_min_capacity" {
  description = "Minimum Aurora capacity in ACUs"
  type        = number
  default     = 0.5
}

variable "aurora_max_capacity" {
  description = "Maximum Aurora capacity in ACUs"
  type        = number
  default     = 1.0
}

variable "s3_bucket_prefix" {
  description = "S3 bucket prefix"
  type        = string
  default     = "bedrock-documents"
}

variable "s3_force_destroy" {
  description = "Allow deletion of S3 bucket with objects"
  type        = bool
  default     = true
}

variable "enable_s3_versioning" {
  description = "Enable S3 versioning"
  type        = bool
  default     = true
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access Aurora"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "bedrock-rag-system"
    ManagedBy   = "terraform"
  }
}
