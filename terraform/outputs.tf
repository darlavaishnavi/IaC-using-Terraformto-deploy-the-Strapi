output "alb_dns" {
  value = aws_lb.strapi_lb.dns_name
}

output "rds_endpoint" {
  value = aws_db_instance.strapi_db.address
}

output "s3_bucket" {
  value = aws_s3_bucket.media.bucket
}

