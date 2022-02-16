
resource "aws_s3_bucket" "custom_s3_bucket" {
  
  {% if environment_config.bucket_name %}
    bucket_prefix = "{{environment_config.bucket_name}}"
  {% else %}
    bucket_prefix = "${var.app}-${var.environment}"
  {% endif %}

}


