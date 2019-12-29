terraform {
  backend "s3" {
    encrypt = "true"
    bucket  = "joebadmus-dev-s3-backend"
    key     = "infra/webservers/terraform.tfstate"
    region  = "eu-west-2"
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "default"
}

