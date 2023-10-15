resource "aws_elb_attachment" "test" {
  count	   = var.instance_count
  elb      = aws_elb.elb.id
  instance = aws_instance.test.*.id[count.index]
}
