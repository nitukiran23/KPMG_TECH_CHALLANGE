resource "aws_nat_gateway" "nat" {
  count         = 2
  allocation_id = aws_eip.nat.*.id[count.index]
  subnet_id     = aws_subnet.demo_subnet.*.id[count.index]
}
