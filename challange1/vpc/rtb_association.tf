resource "aws_route_table_association" "public_rtb_association" {
  count          = 2
  subnet_id      = aws_subnet.demo_subnet.*.id[count.index]
  route_table_id = aws_route_table.public_rtb.id
}

resource "aws_route_table_association" "pvt_rtb_association" {
  count          = 4
  subnet_id      = aws_subnet.demo_subnet.*.id[count.index+2]
  route_table_id = element(aws_route_table.pvt_rtb.*.id, count.index)
}
