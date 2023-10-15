resource "aws_elb" "elb" {

  name            = "my-elb"

  subnets         = module.vpc.public_subnets

  security_groups = ["${aws_security_group.lb_sg.id}"]

  internal        = var.internal


  listener {

    instance_port     = var.target_port

    instance_protocol = var.target_protocol

    lb_port           = var.lb_listener_port

    lb_protocol       = var.lb_listener_protocol

  }



  health_check {

    healthy_threshold   = var.health_check_healthy_threshold

    unhealthy_threshold = var.health_check_unhealthy_threshold

    timeout             = var.health_check_timeout

    target              = "${var.health_check_protocol}:${var.health_check_port}${var.health_check_path}"

    interval            = var.health_check_interval

  }



  tags =  {

    Name        = "my-elb"

     }

}
