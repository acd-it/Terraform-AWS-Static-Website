provider "aws" {
  region = "us-east-1"  # Define AWS Region
}


module "cloudfront" {    #Define module and settins within module
  source  = "terraform-aws-modules/cloudfront/aws"
  version = "3.2.1"
  comment = "Distrubution for Static S3 Site"
  enabled = true
  http_version = "http2and3"
  origin = [{
    domain_name = var.s3_endpoint
    origin_id   = "S3-website"
  }]
  default_cache_behavior = {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-website"
    viewer_protocol_policy = "allow-all" // Allowed values: allow-all, https-only, redirect-to-https"
    forwarded_values = {
      query_string = false
      cookies = {
        forward = "none"
      }
    }

    geo_restriction = {
      restriction_type = "whitelist"
      locations        = var.locations
    }
  }
}
