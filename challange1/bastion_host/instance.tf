resource "aws_instance" "test" {

  ami                    = "ami-0d9462a653c34dab7"

  instance_type          = "t2.micro"

  subnet_id              = module.vpc.public_subnets[0]

  vpc_security_group_ids = ["${aws_security_group.bastion_sg.id}"]

  key_name               = terraform.workspace

  associate_public_ip_address = "true"

  tags          = {

  Name        = "Bastion_host"

  }

}



resource "aws_security_group" "bastion_sg" {

  name   = "${terraform.workspace}-test-instance-sg"

  vpc_id      = module.vpc.vpc_id

  lifecycle {

    ignore_changes        = [description]

    create_before_destroy = true

  }

}



resource "aws_security_group_rule" "instance_ssh_in" {

  security_group_id = aws_security_group.bastion_sg.id

  type              = "ingress"

  from_port         = "22"

  to_port           = "22"

  protocol          = "tcp"

  cidr_blocks       = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "instance_all_outbound" {

  security_group_id = aws_security_group.bastion_sg.id

  type              = "egress"

  from_port         = "0"

  to_port           = "65535"

  protocol          = "all"

  cidr_blocks       = ["0.0.0.0/0"]

}
