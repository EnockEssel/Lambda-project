# Serverless Image Processing with AWS

## Overview
This project implements a serverless image processing pipeline using AWS services, including S3, Lambda, and IAM. When an image is uploaded to an S3 bucket, 
AWS Lambda automatically triggers a function that resizes the image into three different sizes (thumbnail, medium, and large) and stores them in another S3 bucket.

## Architecture
- **S3 Buckets**: 
  - `uploaded_app_image`: The bucket where users upload images.
  - `generated_image`: The bucket where resized images are stored.

- **AWS Lambda**: 
  - A function that processes the uploaded images, resizing them to specified dimensions.

- **IAM Roles**: 
  - Roles are created to grant the Lambda function necessary permissions to access S3 buckets.

## Features
- Automatically resizes images to three different sizes: 100x100 (thumbnail), 500x500 (medium), and 1000x1000 (large).
- Utilizes AWS Lambda for serverless execution, minimizing infrastructure management.
- Simple deployment using Terraform for Infrastructure as Code (IaC).

## Getting Started

### Prerequisites
- AWS Account
- Python 3.x
- Terraform installed
- `boto3` and `Pillow` libraries

### Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/name/repo.git
   cd repo
2. Configure AWS Credentials: Ensure your AWS credentials are configured using the AWS CLI   
   aws configure
   
4. Deploy with Terraform: Initialize Terraform and deploy the infrastructure:
   terraform init
   terraform apply

5. Upload an Image:

Upload an image to the uploaded_app_image bucket.
The Lambda function will automatically trigger and process the image.

6. Check Processed Images:

Access the generated_image bucket to view the resized images.
