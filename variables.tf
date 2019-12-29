
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
  description = "Name of secret key"
}
