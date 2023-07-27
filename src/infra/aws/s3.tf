resource "aws_s3_bucket" "s3" {
  bucket = "bucket-alltribes"

  tags = {
    Owner = "ANTE"
    Name        = "ante-bucket"
    Environment = "dev"
  }
}