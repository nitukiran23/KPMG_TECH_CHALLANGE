output "instance_ids" {

  value = "${aws_instance.test.*.id}"

}

output "security_gp_id" {

  value = "${aws_security_group.bastion_sg.id}"

}
