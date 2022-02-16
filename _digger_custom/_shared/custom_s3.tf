
resource "aws_s3_bucket" "custom_s3_bucket" {
  bucket_prefix = "${var.app}-${var.environment}"
}
