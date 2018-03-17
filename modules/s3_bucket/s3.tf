provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {}
}
resource "aws_s3_bucket" "basic_bucket" {
  bucket = "${var.bucket_name}"
}
