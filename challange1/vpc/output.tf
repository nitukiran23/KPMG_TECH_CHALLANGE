output "public_subnets" {

  value = ["${aws_subnet.demo_subnet.*.id[0]}", "${aws_subnet.demo_subnet.*.id[1]}"] 

}

output "private_subnets" {

  value = ["${aws_subnet.demo_subnet.*.id[2]}", "${aws_subnet.demo_subnet.*.id[3]}", "${aws_subnet.demo_subnet.*.id[4]}", "${aws_subnet.demo_subnet.*.id[5]}"]

}

output "vpc_id" {

  value = aws_vpc.test.id

}

