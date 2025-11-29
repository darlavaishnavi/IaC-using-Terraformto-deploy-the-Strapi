resource "aws_s3_bucket" "media" {
  bucket = "strapi-media-${var.environment}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.media.id
  versioning_configuration {
    status = "Enabled"
  }
}

