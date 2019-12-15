variable "region" {
  default = "eu-west-2"
}

variable "managed_by" {
  default     = "terraform"
  description = "terraform"
}

variable "environment" {
  default     = "dev"
  description = "Name of the environment. e.g. prod, qa, dev"
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "az_count" {
  description = "Number of availability zones to use"
  default     = 2
}

variable "app_name" {
  description = "sample Java infra"
  default     = "sample Java infra"
}

variable "public_cidr_block" {
  type = "list"
  default = ["10.0.0.0/24", "10.0.1.0/24" ]
}


 variable "private_cidr_block" {
  type = "list"
  default = ["10.0.2.0/24", "10.0.3.0/24" ]
} 
  

