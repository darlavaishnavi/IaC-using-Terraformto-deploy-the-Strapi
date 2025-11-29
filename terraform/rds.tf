resource "aws_db_instance" "strapi_db" {
  identifier           = "strapi-db"
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  allocated_storage    = var.db_allocated_storage
  username             = var.db_username
  password             = "ChangeMe123!"
  publicly_accessible  = false
  skip_final_snapshot  = true
}

