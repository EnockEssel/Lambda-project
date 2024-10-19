import boto3
from PIL import Image
import io

s3 = boto3.client('s3')

def resize_image(image, size):
    img = Image.open(image)
    img = img.resize(size)
    buffer = io.BytesIO()
    img.save(buffer, 'JPEG')
    buffer.seek(0)
    return buffer

def lambda_handler(event, context):
    bucket = event['Records'][0]['s3']['bucket']['name']
    key = event['Records'][0]['s3']['object']['key']
    
    response = s3.get_object(Bucket="iCare-bucket2", Key=lambda)
    image = response['Body'].read()

    thumbnail = resize_image(io.BytesIO(image), (100, 100))
    medium = resize_image(io.BytesIO(image), (500, 500))
    large = resize_image(io.BytesIO(image), (1000, 1000))

    s3.put_object(Bucket='processed-images-bucket', Key=f'thumb/{key}', Body=thumbnail, ContentType='image/jpeg')
    s3.put_object(Bucket='processed-images-bucket', Key=f'medium/{key}', Body=medium, ContentType='image/jpeg')
    s3.put_object(Bucket='processed-images-bucket', Key=f'large/{key}', Body=large, ContentType='image/jpeg')
    
    return {
        'statusCode': 200,
        'body': 'Image resized successfully'
    }
