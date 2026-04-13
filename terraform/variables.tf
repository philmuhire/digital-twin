variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project_name))
    error_message = "Project name must contain only lowercase letters, numbers, and hyphens."
  }
}


variable "environment" {
  description = "Environment name (dev, test, prod)"
  type        = string
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment must be one of: dev, test, prod."
  }
}

variable "bedrock_model_id" {
  description = "Bedrock model ID"
  type        = string
  default     = "amazon.nova-micro-v1:0"
}

variable "openai_api_key" {
  description = <<-EOT
    OpenAI API key for Lambda (OPENAI_API_KEY). Never commit this value.
    Set at apply time: TF_VAR_openai_api_key, or OPENAI_API_KEY when using scripts/deploy.sh.
    In GitHub Actions, add repository secret OPENAI_API_KEY for the deploy workflow.
  EOT
  type        = string
  sensitive   = true
  default     = null
  nullable    = true
}

variable "openai_base_url" {
  description = <<-EOT
    Optional OpenAI-compatible API base URL for Lambda (OPENAI_BASE_URL). Do not commit real values.
    Set at apply time: TF_VAR_openai_base_url, or OPENAI_BASE_URL when using scripts/deploy.sh.
    In GitHub Actions, add repository secret OPENAI_BASE_URL for the deploy workflow (optional).
  EOT
  type        = string
  sensitive   = true
  default     = null
  nullable    = true
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 60
}

variable "api_throttle_burst_limit" {
  description = "API Gateway throttle burst limit"
  type        = number
  default     = 10
}

variable "api_throttle_rate_limit" {
  description = "API Gateway throttle rate limit"
  type        = number
  default     = 5
}

variable "use_custom_domain" {
  description = "Attach a custom domain to CloudFront"
  type        = bool
  default     = false
}

variable "root_domain" {
  description = "Apex domain name, e.g. mydomain.com"
  type        = string
  default     = ""
}