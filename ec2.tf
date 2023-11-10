# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "instance0" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
 # count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.allow_http_https_ssh_traffic.id}"]
  subnet_id                   = "${aws_subnet.public_subnet-a.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "My Public Instance 0"
}
}
# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "instance1" {
  ami                         = "ami-087c17d1fe0178315"
  instance_type               = "t2.micro"
  #count                       = 1
  key_name                    = "tests"
  vpc_security_group_ids      = ["${aws_security_group.allow_http_https_ssh_traffic.id}"]
  subnet_id                   = "${aws_subnet.public_subnet-b.id}"
  associate_public_ip_address = true
  user_data                   = "${file("data.sh")}"
tags = {
  Name = "My Public Instance 1"
}
}