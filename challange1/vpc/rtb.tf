resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public_Route_Table"
  }
}

resource "aws_route_table" "pvt_rtb" {
  count  = 2
  vpc_id = aws_vpc.test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.*.id[count.index]
  }
  tags = {
    Name = "Private_Route_Table[count.index]"
  }
}
