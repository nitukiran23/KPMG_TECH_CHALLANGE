resource "aws_security_group" "lb_sg" {

  name   = "${terraform.workspace}-test-lb-sg"

  vpc_id      = module.vpc.vpc_id

  lifecycle {

    ignore_changes        = [description]

    create_before_destroy = true

  }

}


resource "aws_security_group_rule" "lb_http_in" {

  security_group_id = aws_security_group.lb_sg.id

  type              = "ingress"

  from_port         = "80"

  to_port           = "80"

  protocol          = "tcp"

  cidr_blocks       = ["0.0.0.0/0"]

}


resource "aws_security_group_rule" "lb_all_outbound" {

  security_group_id = aws_security_group.lb_sg.id

  type              = "egress"

  from_port         = "0"

  to_port           = "65535"

  protocol          = "all"

  cidr_blocks       = ["0.0.0.0/0"]

}

