
variable "bucket_acl" {   #Defining bucket ACL variable
  type        = string
  description = "The ACL for the S3 bucket"
  default     = "public-read"
}