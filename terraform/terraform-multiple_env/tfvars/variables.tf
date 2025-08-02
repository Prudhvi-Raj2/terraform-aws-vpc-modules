variable "project" {
  default = "expense"  
}

variable "environment" {
  
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]  
}

variable "zone_Id" {
  default = "Z014511939UW0YQ3HBHGV"

}

variable "domain_name" {
  default = "kambalas.shop"

}

variable "common_tags" {
   type = map
   default = {
    Project = "expense"
    Terraform = "true"
   }
  
}