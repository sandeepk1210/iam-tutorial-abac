provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-sk1210"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"

    encrypt        = true
  }
}