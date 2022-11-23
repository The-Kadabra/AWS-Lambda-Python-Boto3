import json
import boto3


def lambda_handler(event, context):
    
    arquivo_processar   =   "processar.txt"
    bucket_s3           =   "gabriel-pires-bucket-app-py"

    s3      = boto3.resource('s3')
    obj     = s3.Object(bucket_s3, arquivo_processar)
    body    = obj.get()['Body'].read().decode()
    print(body)