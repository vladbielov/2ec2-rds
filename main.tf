provider "aws" {
  region = var.region
}


terraform {
  backend "s3" {
    bucket         = "weasel-crm-state-bucket" #use name of your bucket
    key            = "path/to/my/tfstate"
    region         = "us-east-1"
    dynamodb_table = "weasel-crm-dynamodb" #use name of your DynamoDB
    encrypt        = true
  }
}



##DB
data "aws_secretsmanager_secret" "weasel_crm_rds_credentials" {
  name = var.db_credentials
}

data "aws_secretsmanager_secret_version" "current" {
  secret_id = data.aws_secretsmanager_secret.weasel_crm_rds_credentials.id
}



resource "aws_db_instance" "weasel_crm_rds" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.34"
  instance_class       = "db.t2.micro"
  db_name              = "weasel_crm_db"
  username             = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["username"]
  password             = jsondecode(data.aws_secretsmanager_secret_version.current.secret_string)["password"]
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true #use in case you don't need to save db snapshot; in case db snapshot is necessary - comment this line and uncomment 2 next lines
  #skip_final_snapshot   = false
  #final_snapshot_identifier = "weasel-crm-db-final-snapshot"
  vpc_security_group_ids = [aws_security_group.weasel_crm_rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.weasel_crm_db_subnet_group.id
}


# S3 Bucket
resource "aws_s3_bucket" "private_bucket" {
  bucket = var.s3_bucket_name
}