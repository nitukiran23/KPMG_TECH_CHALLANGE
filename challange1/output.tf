output "elb_dns_name" {

  value = "${aws_elb.elb.*.dns_name}"

}


output "elb_id" {

  value = "${aws_elb.elb.id}"

}


output "elb_sg" {

  value = "${aws_security_group.sg.id}"

}

