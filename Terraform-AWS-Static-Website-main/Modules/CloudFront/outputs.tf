output "cloudfront_distribution_arn" {      #Output ARN after creation
  value = module.cloudfront.cloudfront_distribution_arn
}

output "cloudfront_distribution_domain_name" {  #Output Domain Name after creation
  value = module.cloudfront.cloudfront_distribution_domain_name

}

output "cloudfront_distribution_status" {   #Output status after creation
  value = module.cloudfront.cloudfront_distribution_status

}