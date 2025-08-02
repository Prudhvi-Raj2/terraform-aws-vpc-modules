variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "sg_idd" {
  
}

variable "instance_type" {
  default = "t2.micro"
  validation {
    condition = contains(["t3.micro","t2.micro", "t3.small"],var.instance_type)
    error_message = "Valid values for instance_type are: t3.micro, t2.micro, t3.small"
  }
}

variable "tags" {
  default = {}
}