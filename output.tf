output "bucket name" {
  value = module.s3.s3_bucket_name(
}

output "bucket arn" {
  value = module.s3.s3_bucket_arn(
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
