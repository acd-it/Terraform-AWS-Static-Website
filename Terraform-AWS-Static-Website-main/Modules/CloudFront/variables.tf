variable "s3_endpoint" {  #Define endpoint URL for static S3 bucket
  description = "The endpoint URL for the static S3 bucket"
  type = string
  default = "http://www.carsanddogs.info.s3-website-us-east-1.amazonaws.com"
}

variable "locations" {    #Define whitelisted locations
  description = "Countries whitelisted for distribution"
  type = list(string)
  default = ["US", "CA", "GB", "DE", "FR"]
}