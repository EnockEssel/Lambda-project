# api_gateway.tf (optional)
/*
resource "aws_apigatewayv2_api" "image_upload_api" {
  name          = "image-upload-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.image_upload_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.image_resizer.invoke_arn
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "image_upload_route" {
  api_id    = aws_apigatewayv2_api.image_upload_api.id
  route_key = "POST /upload"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.image_upload_api.id
  name        = "v1"
  auto_deploy = true
}

output "api_url" {
  value = aws_apigatewayv2_stage.api_stage.invoke_url
}
*/