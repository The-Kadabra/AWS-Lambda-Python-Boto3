######################
### LAMBDA Fuction ###
#####################

###############
#Policy Lambda#
###############
data "aws_iam_policy_document" "policy" {
    #permissões default de funcionamento do Lambda na AWS
    statement {
        effect        = "Allow" 
        actions       = [
                        "lambda:InvokeFunction",
                        "ec2:CreateNetworkInterface",
                        "ec2:DescribeInstances",
                        "ec2:DescribeNetworkInterfaces",
                        "ec2:DeleteNetworkInterface",
                        "ec2:AttachNetworkInterface"
                        ]
        resources     = [
                        "*"
                        ]
    }
    #Permissões para o Lambda consumir o Bucket S3
    statement {
        effect           = "Allow"
        actions          =  [
                "s3:*"
                        ]
        resources = [
                    "*"
                    ]
    }
    #permissão para criar e gravar Logs
    statement {
        effect           = "Allow"
        actions          =  [
                "logs:*"
                        ]
        resources = [
                "*"
                    ]
    }
    
}

##################
#Data role Slicer#
##################

data "aws_iam_policy_document" "role"{
    statement {
        effect = "Allow"
        actions =   [
                "sts:AssumeRole"
                    ]
        principals {
                    type        =   "Service"
                    identifiers =   [
                                    "lambda.amazonaws.com",
                                    ]
        }        
    }
}

##########################################
#Zip no arquivo python durante a execução#
##########################################

data "archive_file" "lambda_my_function" {
    type             = "zip"
    source_file      = "../../AWS-Lambda-Python-Boto3/app/app.py"
    output_file_mode = "0666"
    output_path      = "../../AWS-Lambda-Python-Boto3/app/app.zip"
}


###########
#S3 POLICY#
###########

data "aws_iam_policy_document" "s3_bucket" {
#BLOCO DE PERMISSÃO FULL PARA OS SERVIÇOS DE S3 E LAMBDA NO BUCKET VAR.BUCKET_NAME
    statement {
        principals {
            type        = "Service"
            identifiers = ["s3.amazonaws.com", "lambda.amazonaws.com"]
        }
    actions = [
        "s3:*"
    ]
    resources = [
            format("arn:aws:s3:::%s", var.bucket_name),
            format("arn:aws:s3:::%s/*", var.bucket_name)
    ]
    }
}