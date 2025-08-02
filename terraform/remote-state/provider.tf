terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }
  backend "s3" {
    bucket = "myawsbucket-practice-remotestate"
    key    = "expense-backend-infra" # you should have unique key, same cannot use in other repos
    region = "us-east-1"
    dynamodb_table = "82S-state-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}

