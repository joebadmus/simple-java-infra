terraform {
  backend "s3" {
    bucket = "joebadmus-dev-s3-backend"
    key    = "infra/******/terraform.tfstate"
    region = "eu-west-2"
  }
}