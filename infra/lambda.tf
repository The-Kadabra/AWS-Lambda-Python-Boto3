#################
#LAMBDA FUNCTION#
#################

resource "aws_lambda_function" "main" {

    filename                        = var.filename
    function_name                   = var.project
    handler                         = var.handler
    role                            = resource.aws_iam_role.lambda.arn
    description                     = var.description
    memory_size                     = var.memory_size
    runtime                         = var.runtime
    timeout                         = var.timeout
    publish                         = true
    source_code_hash                = filebase64sha256(var.filename)
}