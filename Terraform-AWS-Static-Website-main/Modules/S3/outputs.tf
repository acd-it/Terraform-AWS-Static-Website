output "s3_bucket_id" {   #Output name of S3 bucket after creation
  description = "Name of the bucket."
  value       = module.s3-bucket.s3_bucket_id
}
output "s3_bucket_website_endpoint" {  #Output endpoint of S3 bucket after creation
  description = "The website endpoint."
  value       = module.s3-bucket.s3_bucket_website_endpoint
}