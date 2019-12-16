provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "java-infra-dev-backend" {
  bucket = "joebadmus-dev-s3-backend"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

terraform {
  backend "s3" {
    bucket = "joebadmus-dev-s3-backend"
    key    = "infra/lock/terraform.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
    region = "eu-west-2"
  }
}


resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "DynamoDB Terraform State Lock Table"
    Environment = "dev"
  }
}