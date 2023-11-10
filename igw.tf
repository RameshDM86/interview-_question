resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ramesh_vpc.id
  tags = {
    Name = "${var.name_prefix}-igw"
  }
}
