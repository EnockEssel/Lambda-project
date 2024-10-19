# AWS s3 bucket
resource "aws_s3_bucket" "uploaded_app_image" {
  bucket = var.aws_s3_bucket.uploaded_app_image.default
  

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
  
}
resource "aws_s3_bucket" "generated_image" {
  bucket = var.aws_s3_bucket.generated_image.default

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}





