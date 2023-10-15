variable "vpc_cidr" {
  default = "10.208.12.0/23"
}

variable "subnet_count" {
  default = 6
}

variable "subnet_cidr" {
  default = ["10.208.12.0/25", "10.208.12.128/25", "10.208.13.0/26", "10.208.13.64/26", "10.208.13.128/27", "10.208.13.160/27"]
}

variable "az" {
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "subnets" {
  default = ["Public", "Private", "Mgmt"]
}

