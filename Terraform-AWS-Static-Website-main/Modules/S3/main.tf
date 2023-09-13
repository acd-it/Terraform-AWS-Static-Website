provider "aws" {
  region = "us-east-1"  # Define AWS Region
}


resource "aws_s3_object" "index_html" {
  bucket = module.s3-bucket.s3_bucket_id
  key    = "index.html"       #Naming
  content_type = "text/html"  #Setting content-type for S3.
  source = "./static-website.html"  # Path to HTML file.
}

resource "aws_s3_object" "picture" {
  bucket = module.s3-bucket.s3_bucket_id
  key    = "static-picture.jpeg"    #Naming
  content_type = "image/jpeg"       #Setting content-type for S3.
  source = "./static-picture.jpeg"  # Path to picture file
}


module "s3-bucket" {      #Using S3 Module from TF Registry and defining configuration
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.1"

  bucket = "www.carsanddogs.info"
  acl = var.bucket_acl
  website = {
    index_document = "index.html"
  }
  control_object_ownership = true
  object_ownership ="ObjectWriter"
  block_public_acls       = false 
  block_public_policy     = false
  restrict_public_buckets = false
  ignore_public_acls = false
  attach_policy = true
  policy = jsonencode({
    Version: "2012-10-17",
    Statement: [
      {
        Effect: "Allow",
        Principal: "*",
        Action: "s3:GetObject",
        Resource: "arn:aws:s3:::www.carsanddogs.info/*"
      }
    ]
  })
}
