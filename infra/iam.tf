###################
# LAMBDA FUNCTION #
###################

###############
#Policy lambda#
###############
resource "aws_iam_policy" "lambda" {

    name        = format("%s-Policy", var.project)
    policy      = data.aws_iam_policy_document.policy.json
}

#############
#Role lambda#
#############
resource "aws_iam_role" "lambda" {

    name                = format("%s-Role", var.project)
    assume_role_policy  = data.aws_iam_policy_document.role.json
}


###################
#Attachment lambda#
###################
resource "aws_iam_policy_attachment" "lambda" {
    name                  = format("%s-Attachment", var.project)
    roles                 = [resource.aws_iam_role.lambda.name]
    policy_arn            = resource.aws_iam_policy.lambda.arn
}