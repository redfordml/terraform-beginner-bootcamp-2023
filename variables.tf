variable "user_uuid" {
  description = "User UUID in UUID format"
  type        = string

  validation {
     
    #condition = (regex("^(?!-)[a-z0-9-]{1,61}[a-z0-9]$"), var.user_uuid)

    condition = can(regex("^([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})$", var.user_uuid))
    error_message = "User UUID must be in the UUID format (e.g., 123e4567-e89b-12d3-a456-426655440000)"
  }
}
variable "bucket_name" {
  type        = string
  description = "Name of the AWS S3 bucket"
  
  validation {
    condition     = can(regex("^[a-zA-Z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Invalid bucket name. Bucket names must be between 3 and 63 characters long and can only contain alphanumeric characters, hyphens, and periods."
  }
}

