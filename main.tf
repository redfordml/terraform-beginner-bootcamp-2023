
#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string

resource "random_string" "bucket_name" {
  lower = true
  upper =false
  length = 23
  special = false
 }



#s3 Rules
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

 resource "aws_s3_bucket" "example" {
   bucket = random_string.bucket_name.result

  tags = {

      user_uuid = var.user_uuid

  }
 }
