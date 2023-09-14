resource "aws_s3_bucket" "s3" {
  bucket = "bucket-alltribes"

  tags = {
    Owner = "alltribes"
    Name        = "alltribes-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_website_configuration" "static_website" {
  bucket = aws_s3_bucket.s3.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "PublicReadGetObject"
    principals {
      identifiers = ["*"]
      type        = "*"
    }
    actions   = ["s3:GetObject"]
    resources = [
      aws_s3_bucket.s3.arn,
      "${aws_s3_bucket.s3.arn}/*"
    ]
  }
}
resource "aws_s3_bucket_policy" "allow_all" {
  bucket = aws_s3_bucket.s3.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}

resource "aws_s3_bucket_public_access_block" "alllow_all" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
