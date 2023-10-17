
terraform {
  
 required_providers {
    
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }

  }

}



provider "aws" {
  # Configuration options
}


#s3 Rules
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

 resource "aws_s3_bucket" "website_bucket" {
   bucket = var.bucket_name

  tags = {

      user_uuid = var.user_uuid

  }
 }
