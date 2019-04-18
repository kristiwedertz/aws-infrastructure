resource "aws_dynamodb_table" "this" {
  name           = "${var.name}"
  hash_key       = "${var.hash_key}"
  read_capacity  = "${var.read_capacity}"
  write_capacity = "${var.write_capacity}"

  attribute {
    name = "${var.hash_key}"
    type = "${var.type}"
  }

  tags {
    Name        = "${var.name}"
    Environment = "${var.environment}"
  }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.name}-kristi-wedertz-573-${var.region}"
  region = "${var.region}"

  versioning = {
    enabled = "${var.versioning}"
  }

  tags = {
    Name        = "${var.name}"
    Environment = "${var.environment}"
  }
}

output "bucket_name" {
  value = "${aws_s3_bucket.this.id}"
}
