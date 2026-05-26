variable "billing_mode" {
  description = "Billing mode (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PAY_PER_REQUEST"
  validation {
    condition     = contains(["PROVISIONED", "PAY_PER_REQUEST"], var.billing_mode)
    error_message = "billing_mode must be PROVISIONED or PAY_PER_REQUEST."
  }
}

variable "hash_key" {
  description = "Hash key attribute name"
  type        = string
  validation {
    condition     = length(var.hash_key) > 0
    error_message = "hash_key must not be empty."
  }
}

variable "range_key" {
  description = "Range key attribute name (optional)"
  type        = string
  default     = null
}

variable "dynamodb_attributes" {
  description = "List of attribute definitions"
  type = list(object({
    name = string
    type = string
  }))
  validation {
    condition     = length(var.attributes) > 0
    error_message = "At least one attribute must be defined."
  }
}

variable "global_secondary_indexes" {
  description = "List of GSI configurations"
  type        = list(any)
  default     = []
}

variable "local_secondary_indexes" {
  description = "List of LSI configurations"
  type        = list(any)
  default     = []
}

variable "read_capacity" {
  description = "Read capacity units (only for PROVISIONED)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity units (only for PROVISIONED)"
  type        = number
  default     = 5
}

variable "point_in_time_recovery_enabled" {
  description = "Enable point-in-time recovery"
  type        = bool
  default     = true
}

variable "server_side_encryption_enabled" {
  description = "Enable server-side encryption"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "KMS key ARN for encryption (null uses AWS managed key)"
  type        = string
  default     = null
}

variable "ttl_attribute_name" {
  description = "TTL attribute name"
  type        = string
  default     = ""
}

variable "ttl_enabled" {
  description = "Enable TTL"
  type        = bool
  default     = false
}

variable "deletion_protection_enabled" {
  description = "Enable deletion protection"
  type        = bool
  default     = false
}
