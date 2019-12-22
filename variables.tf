//Global variables
variable "region" {
  description = "AWS region"
  default     = "eu-west-2"
}

variable "shared_credentials_file" {
  description = "AWS credentials file path"
  default     = "/home/joe/keys/demo.pem"
}

variable "aws_profile" {
  description = "AWS profile"
  default     = "default"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of Availability Zones"
  default     = ["eu-west-2a", "eu-west-2b"]
}

variable "public_key" {
  description = "SSH public key"
  default = "/home/joe/keys/demo.pem"
  # default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIyId1RsxTtB8x0gUkt5wqqAX1h/wY2HALVPjfnZYD52OHe5bNcMMZt/fKZ/fwONiwNDh+Dj8vnjSVkeP6sWy2SQFlUQU3Xne1VGVwr7SDrsUALdjUAJNw8gGne1dYsp3TXADSvyZ+OABPNRZJjWJK1VClCeLBVm83sbomG5ERovqRiOoFSOq0uRqivfCv08FyptZLEo8KDYMwxxO35tIm+7xAV6AtMpFhOHvkfruVzW4gwtuvHkKh8QW9smiJ0PIkP5EeIA8loP6oZyZ2gBq5lB8c5gVtkAdx55PqakHzKtG7B5YIH6IZTvOnXVAibjoDmFJ4W2oGV4ibZSytHCRv"
}

// variable "hosted_zone_id" {
//   description = "Route53 zone id"
// }

// Default variables
variable "vpc_name" {
  description = "VPC name"
  default     = "bluegreendemo"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_count" {
  default     = 2
  description = "Number of public subnets"
}

variable "private_count" {
  default     = 2
  description = "Number of private subnets"
}

variable "instance_type" {
  default     = "t2.micro"
  description = "EC2 instance type"
}

variable "ami" {
  description = "Amazon Linux AMI"
  default     = "ami-05f37c3995fffb4fd"
}

variable "author" {
  default     = "Joebadmus"
  description = "Name of Author"
}

variable "tool" {
  default     = "Terraform"
  description = "IaC tool of choice"
}

