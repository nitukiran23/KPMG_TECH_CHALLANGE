variable "region" {

  default = "ap-south-1"

}



variable "internal" {

  default = false

}



# elb target group vars

variable "cross_zone_load_balancing" {

 default = true

}



variable "lb_listener_port" {

  default = "80"

}

variable "lb_listener_protocol" {

  default = "HTTP"

}

variable "target_port" {

  default = "80"

}

variable "target_protocol" {

  default = "HTTP"

}

variable "health_check_unhealthy_threshold" {

  default = "5"

}

variable "health_check_healthy_threshold" {

  default = "2"

}

variable "health_check_interval" {

  default = "5"

}

variable "health_check_timeout" {

  default = "4"

}

variable "health_check_path" {

  default = "/index.html"

}

variable "health_check_port" {

  default = "80"

}

variable "health_check_protocol" {

  default = "HTTP"

}

variable "instance_count" {

  default = 2

}

