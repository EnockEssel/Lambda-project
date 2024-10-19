# provides the output of api
output "api_url" {
  value = aws_apigatewayv2_stage.api_stage.invoke_url
}
