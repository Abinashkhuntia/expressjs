terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "latest"
    }
  }
}

provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


terraform {
  required_version = ">= 0.12"
}