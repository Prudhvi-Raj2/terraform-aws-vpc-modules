variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"

}

variable "environment"{
  type = string
  default = "prod"
}

variable "instance_type" {
  type    = string
  default = "t3.xlarge"
}

variable "ec_tags" {
  type = map(string)
  default = {
    Project     = "expense"
    Component   = "backend"
    Environment = "dev"
    Name        = "expense-backend-dev"
  }
}

variable "from_port" {
  type    = number
  default = 22

}

variable "to_port" {
  type    = number
  default = 22

}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable "sg_tags" {
  type = map(string)
  default = {
    Name = "expense-backend-dev"
  }

}

