#This Terraform module provisions a serverless image processing pipeline using AWS S3, Lambda, IAM, and optionally API Gateway.

module "image_resizer" {
  source                 = "../lambda"
  region                 = "us-east-1"
  uploaded_app_image = "uploaded_app_image"
  edited_images_bucket = "generated_image"
  lambda_zip_file        = "lambdafunction.py"
  enable_api_gateway     = true  # Set to true if using API Gateway
}