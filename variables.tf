//Global variables
variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones"
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "public_key" {
  description = "SSH public key"
  default = "/home/joe/keys/demo.pem"


// Default variables
variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-05f37c3995fffb4fd"
}
variable "key_name" {
  default = "bluegreen"
}

variable "author" {
  default     = "Joebadmus"
  description = "Name of Author"
}

variable "tool" {
  default     = "Terraform"
  description = "IaC tool of choice"
}