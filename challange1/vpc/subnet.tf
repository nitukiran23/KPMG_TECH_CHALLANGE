resource "aws_subnet" "demo_subnet" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.test.id
  cidr_block              = var.subnet_cidr[count.index]
  availability_zone       = element(var.az, count.index)
tags = {
   Name = "${element(var.subnets, floor(count.index/length(var.az)))}_subnet_${replace(element(var.az, count.index), "eu-west-","")}"
}
}
