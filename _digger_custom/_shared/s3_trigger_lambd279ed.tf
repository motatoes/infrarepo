
locals {
  function_name = "${var.project_name}-${var.environment}-lambd279ed"
}

data "aws_lambda_function" "lambd279ed" {
  function_name = local.function_name
}


resource "aws_s3_bucket" "custom_s3_bucket" {
  bucket_prefix = "trggr-buckt"
}


resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = local.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.custom_s3_bucket.arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.custom_s3_bucket.id

  lambda_function {
    lambda_function_arn = data.aws_lambda_function.lambd279ed.arn
    # events              = ["s3:ObjectCreated:*"]
    # filter_prefix       = "AWSLogs/"
    # filter_suffix       = ".log"
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}


