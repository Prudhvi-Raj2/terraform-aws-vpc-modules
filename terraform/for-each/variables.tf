variable "instances" {
  type = map 
    default = {
        mysql = "t3.small"
        backend = "t3.micro"
        frontent = "t3.micro"
    }
  }

variable "domain_name" {
   default = "kambalas.shop"
}

variable "zone_Id" {
  default = "Z04650642PDDCGVZMN5D"

}