# provides the output of api
output "api_url" {
  value = aws_apigatewayv2_stage.api_stage.invoke_url
}
# outputs.tf

output "uploaded_images_bucket" {
  description = "The uploaded images S3 bucket name"
  value       = aws_s3_bucket.uploaded_app_image.bucket
}

output "processed_images_bucket" {
  description = "The processed images S3 bucket name"
  value       = aws_s3_bucket.generated_image
}

output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.image_resizer.arn
}

