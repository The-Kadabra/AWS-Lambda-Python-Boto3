########
#GLOBAL#
########
variable "project" {
    default = "NOME-DO-PROJETO"  
}

variable "account" {
    default = {
            qa             = ""
            prod           = ""
            }
}

variable "region" {
    default = {
            qa             = "us-east-1"
            prod           = "sa-east-1"
            }
}



#########
#LAMBDA #
#########
variable "filename" {
    type    = string
    default = "/home/gabriel.pires/Documentos/gabriel/python/app/app.zip"
}
variable "handler" {
    type    = string
    default = "app.lambda_handler"
    #O valor do prefixo do nome precisa ser o mesmo do ponto de execução do seu python. No nosso contexto ficaria app.lambda_handler o valor .lambda_handler deve sempre existir caso contrario não vai funcionar

}
variable "description" {
    type    = string
    default = "https://github.com/The-Kadabra/AWS-Lambda-Python-Boto3"
}
variable "runtime" {
    type    = string
    default = "python3.9"
}
variable "timeout" {
    type    = number
    default = 900
}
variable "memory_size" {
    default = "512"
}


###########
#S3 Bucket#
###########

variable "bucket_name" {
    default = "gabriel-pires-bucket-app-py"  
}