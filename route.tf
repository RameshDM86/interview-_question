# Creating Route Table
resource "aws_route_table" "route" {
  vpc_id = "${aws_vpc.ramesh_vpc.id}"
route {
      cidr_block = "0.0.0.0/24"
      gateway_id = "${aws_internet_gateway.igw.id}"
  }
tags = {
      Name = "Route to internet"
  }
}
# Associating Route Table
resource "aws_route_table_association" "rt1" {
  subnet_id = "${aws_subnet.public_subnet-a.id}"
  route_table_id = "${aws_route_table.route.id}"
}
# Associating Route Table
resource "aws_route_table_association" "rt2" {
  subnet_id = "${aws_subnet.public_subnet-b.id}"
  route_table_id = "${aws_route_table.route.id}"
}