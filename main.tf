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
}

resource "aws_sns_topic" "bucket_notifications" {
  name = "bucket-notifications"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bix_bucket.id

  topic {
    topic_arn     = aws_sns_topic.bucket_notifications.arn
    events        = ["s3:ObjectCreated:*"]
    filter_prefix = "logs/"
  }
}
