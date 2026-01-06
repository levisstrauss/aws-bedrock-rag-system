provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

locals {
  bucket_name = "${var.s3_bucket_prefix}-${data.aws_caller_identity.current.account_id}"
  azs = [
    "${var.aws_region}a",
    "${var.aws_region}b",
    "${var.aws_region}c"
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = local.azs
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    var.common_tags,
    {
      Name = var.vpc_name
    }
  )
}

module "aurora_serverless" {
  source = "../modules/database"

  cluster_identifier = var.cluster_identifier
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.private_subnets

  database_name   = var.database_name
  master_username = var.master_username

  max_capacity = var.aurora_max_capacity
  min_capacity = var.aurora_min_capacity

  allowed_cidr_blocks = var.allowed_cidr_blocks
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"

  bucket        = local.bucket_name
  acl           = "private"
  force_destroy = var.s3_force_destroy

  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"

  versioning = {
    enabled = var.enable_s3_versioning
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  tags = merge(
    var.common_tags,
    {
      Name    = local.bucket_name
      Purpose = "bedrock-knowledge-base-documents"
    }
  )
}
