terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.4.0"
    }
  }
  
  backend "s3"{
      bucket = "vpc-module-test1-july25"
      key    = "vpc-test-25jul25" # you should have unique key, same cannot use in other repos
      region = "us-east-1"
      dynamodb_table = "vpc-module-test1-july25"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}