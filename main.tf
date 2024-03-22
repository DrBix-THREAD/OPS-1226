terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" 
    }
  }
}

provider "aws" {
  region = "us-east-1" # Adjust the region if needed
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "bix-bucket"
  acl    = "private"
}
