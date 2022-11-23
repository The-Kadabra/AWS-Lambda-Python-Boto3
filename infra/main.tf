provider "aws" {
    region = "us-east-1"
#TAGS QUE VC DESEJA APLICAR EM TODOS OS RECURSOS
    default_tags {
    tags = {
        Environment     = "prod"
        E-mail          = "gabriel@gmail.com"
        Time            = "ninjas"
        }
    }
}
