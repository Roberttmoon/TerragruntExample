terragrunt = {
  terraform {
    source = "../../../../modules/s3_bucket"
  }

  include = {
    path = "${find_in_parent_folders()}"
  }
}

aws_region = "us-east-1"
bucket_name = "moon-test-terragrunt-bucket"
