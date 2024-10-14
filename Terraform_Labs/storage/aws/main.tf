# Define the AWS provider
provider "aws" {
  region = "us-east-1"  # Replace with your preferred region
}

# Create an S3 bucket
resource "aws_s3_bucket" "instructor_bucket" {
  bucket = "instructoriac1"

  tags = {
    Name        = "Instructor S3 Bucket"
    Environment = "Development"
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "instructor_bucket_versioning" {
  bucket = aws_s3_bucket.instructor_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
