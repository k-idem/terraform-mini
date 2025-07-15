terraform {
  backend "s3" {
    bucket = ""                     # passed in at init via -backend-config
    key    = "state/terraform.tfstate"
    region = ""
  }
}
