variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "zone_Id" {
  default = "Z04650642PDDCGVZMN5D"

}

variable "domain_name" {
  default = "kambalas.shop"

}

variable "common_tags" {
   type = map
   default = {
    Project = "expense"
    Environment = "dev"
   }
  
}