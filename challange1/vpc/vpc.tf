resource "aws_vpc" "test" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "Demo_vpc"
  }
}
