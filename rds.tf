# Creating RDS Instance
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-0.id, aws_subnet.database-subnet-1.id]
tags = {
  Name = "DB subnet group"
}
}
resource "aws_db_instance" "default" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  multi_az               = true
  #name                    = "msxeceldb"
  username               = "username" # can be retrivied from Git secrets
  password               = "password" # can be retrivied from Git secrets
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database-sg.id]
}