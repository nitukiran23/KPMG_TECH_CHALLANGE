resource "aws_instance" "test" {

  ami                    = "ami-0d9462a653c34dab7"

  instance_type          = "t2.micro"

  count                  = var.instance_count

  subnet_id              = module.vpc.private_subnets[count.index]

  vpc_security_group_ids = ["${aws_security_group.sg.id}"]

  key_name               = terraform.workspace

  user_data              = data.template_file.init.rendered

  tags          = {

  Name        = "${terraform.workspace}-test-${count.index+1}"

  }

}



resource "aws_security_group" "sg" {

  name   = "${terraform.workspace}-test-instance-sg"

  vpc_id      = module.vpc.vpc_id

  lifecycle {

    ignore_changes        = [description]

    create_before_destroy = true

  }

}



resource "aws_security_group_rule" "instance_ssh_in" {

  security_group_id = aws_security_group.sg.id

  type              = "ingress"

  from_port         = "22"

  to_port           = "22"

  protocol          = "tcp"

  cidr_blocks       = ["${module.bastion_host.security_gp_id}"]

}

resource "aws_security_group_rule" "instance_http_in" {

  security_group_id = aws_security_group.sg.id

  type              = "ingress"

  from_port         = "80"

  to_port           = "80"

  protocol          = "tcp"

  cidr_blocks       = ["${aws_security_group.lb_sg.id}"]

}


resource "aws_security_group_rule" "instance_all_outbound" {

  security_group_id = aws_security_group.sg.id

  type              = "egress"

  from_port         = "0"

  to_port           = "65535"

  protocol          = "all"

  cidr_blocks       = ["0.0.0.0/0"]

}
