import boto3
from PIL import Image
from io import BytesIO
import io

# Initialize the S3 client
s3 = boto3.client('s3')

def resize_image(image, size):
    """Resizes an image to the given size."""
    img = image.open(image)
    img = img.resize(size)
    buffer = io.BytesIO()
    img.save(buffer, 'JPEG')
    buffer.seek(0)
    return buffer

def lambda_handler(event, context):
    # Get bucket and key from the event trigger
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']

    # Fetch the image from S3
    response = s3.get_object(Bucket=bucket, Key=key)
    image = response['Body'].read()

    # Resize the image to different sizes
    thumbnail = resize_image(io.BytesIO(image), (100, 100))
    medium = resize_image(io.BytesIO(image), (500, 500))
    large = resize_image(io.BytesIO(image), (1000, 1000))

    # Upload resized images back to another S3 bucket (processed-images-bucket)
    processed_bucket = 'processed-images-bucket'  # Change this to your actual bucket name
    s3.put_object(Bucket=processed_bucket, Key=f'thumb/{key}', Body=thumbnail, ContentType='image/jpeg')
    s3.put_object(Bucket=processed_bucket, Key=f'medium/{key}', Body=medium, ContentType='image/jpeg')
    s3.put_object(Bucket=processed_bucket, Key=f'large/{key}', Body=large, ContentType='image/jpeg')
    
    # Return success response
    return {
        'statusCode': 200,
        'body': 'Image resized and uploaded successfully'
    }
