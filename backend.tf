terraform {
  backend "s3" {
    bucket  = "terraform-bucket-bcp-education-aconso"
    key     = "default.tfstate"
    region  = "eu-central-1"
    encrypt = true
  }
}