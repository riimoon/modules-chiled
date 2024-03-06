variable "aws_region" {
  type    = string  # N.Virginia
}

variable "vpc_cidr" {
  type    = string  # VPC CIDR block based on needs
}

variable "public_subnet_cidrs" {
  type    = list(string)
}

variable "private_subnet_cidrs" {
  type    = list(string)
}