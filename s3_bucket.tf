# AWS s3 bucket
resource "aws_s3_bucket" "uploaded_app_image" {
  bucket = var.aws_s3_bucket.uploaded_app_image.description

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
  
}
resource "aws_s3_bucket" "generated_image" {
  bucket = var.generated_image.name

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}





