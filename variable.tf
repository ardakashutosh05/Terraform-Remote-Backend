variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "ap-southeast-1"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  default     = "terraform-backend-demo-bucket-ashutosh"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for state locking"
  default     = "terraform-lock-table-demo"
}
