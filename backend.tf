terraform {
  backend "s3" {
    encrypt = "true"
    bucket  = "joebadmus-dev-s3-backend"
    key     = "infra/appservers/terraform.tfstate"
    region  = "eu-west-2"
  }
}


data "terraform_remote_state" "config" {
  backend = "s3"
  config = {
    bucket = "joebadmus-dev-s3-backend"
    key    = "infra/network/terraform.tfstate"
    region = "eu-west-2"
  }
}

provider "aws" {
  region  = "eu-west-2"
  profile = "default"
}

