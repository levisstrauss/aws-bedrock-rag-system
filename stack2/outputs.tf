output "bedrock_knowledge_base_id" {
  description = "Knowledge Base ID (NEEDED FOR PYTHON APP)"
  value       = module.bedrock_kb.id
}

output "bedrock_knowledge_base_arn" {
  description = "Knowledge Base ARN"
  value       = module.bedrock_kb.arn
}
