###########
#S3 BUCKET#
###########
resource "aws_s3_bucket" "bucket_app" {

    bucket  =   var.bucket_name
}

#################################
#ATTACHAMENT POLICY IN S3 BUCKET#
#################################

resource "aws_s3_bucket_policy" "main" {

    bucket    = resource.aws_s3_bucket.bucket_app.bucket
    policy    = data.aws_iam_policy_document.s3_bucket.json
}