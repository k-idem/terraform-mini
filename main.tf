provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "demo" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    project = "terraform-iac-demo"
    owner   = "terraform_project_user"
  }
}
