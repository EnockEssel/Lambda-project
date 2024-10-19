# variables.tf
variable "region" {
  default = "us-east-1"
}

variable "uploaded_app_image" {
  default = "uploaded_app_image"
}

variable "generated_image" {
  description = "Icare-bucket2"
}

variable "aws_s3_bucket" {
  description = "iCare-bucket1"
}