terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.14.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  access_key= "AKIA3AI6QDZYEWLPDBOF"
  secret_key = "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" 
}


terraform {
  required_version = ">= 0.12"
}