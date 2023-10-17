output "bucket_name" { 
    description = "bucket name for our static web hosting"
    value = module.terrahouse_aws.bucket_name
  
}