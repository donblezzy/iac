terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.7"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "3.0.1"
    }
  }
  backend "s3" {
    bucket = "ecom-actions1234"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
  required_version = ">= 1.14.0"
}

