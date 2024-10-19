# Main code to be triggered lambda.tf
resource "aws_lambda_function" "image_resizer" {
  filename         = "lambdafunction.py"  # Path to the zipped Lambda code
  function_name    = "image_resizer_lambda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.9"
  timeout          = 15
  source_code_hash = filebase64sha256("lambdafunction.py")

  environment {
    variables = {
      DEST_BUCKET = aws_s3_bucket.generated_image.bucket
    }
  }
}

# Create permissions for S3 to invoke the Lambda function
resource "aws_lambda_permission" "s3_invocation" {
  statement_id  = "AllowS3InvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.image_resizer.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.uploaded_app_image.arn
}

