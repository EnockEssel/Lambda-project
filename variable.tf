# variables.tf

variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "uploaded_app_image" {
  description = "The name of the S3 bucket for uploading images"
  type        = string 
  default = "uploaded_app_image"
}

variable "edited_images_bucket" {
  description = "The name of the S3 bucket for processed images"
  type        = string
  default = "edited_images_bucket"
}

variable "lambda_zip_file" {
  description = "The path to the Lambda function zip file"
  type        = string
  default = "lambdafunction.py"
}

variable "prevent_destroy" {
  description = "Prevent the S3 buckets from being destroyed"
  type        = bool
  default     = true
}

variable "enable_api_gateway" {
  description = "Whether or not to create API Gateway for image upload"
  type        = bool
  default     = false
}
