terraform {
  required_version = "~> 1.5.0" #Lazy way
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.36.0"
    }
  }
}