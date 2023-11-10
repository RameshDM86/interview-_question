# Creating External LoadBalancer
resource "aws_lb" "rameshext-alb" {
  name               = "ramesh-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_https_ssh_traffic.id]
  subnets            = [aws_subnet.public_subnet-a.id, aws_subnet.public_subnet-b.id]
}
resource "aws_lb_target_group" "target-elb" {
  name     = "ALB-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.ramesh_vpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn = aws_lb_target_group.rameshext-alb.arn
  target_id        = aws_instance.instance0.id
  port             = 80
depends_on = [
  aws_instance.instance0,
]
}
resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn = aws_lb_target_group.rameshext-alb.arn
  target_id        = aws_instance.instance1.id
  port             = 80
depends_on = [
  aws_instance.instance1,
]
}
resource "aws_lb_listener" "ext-elb" {
  load_balancer_arn = aws_lb.rameshext-alb.arn
  port              = "80"
  protocol          = "HTTP"
default_action {
  type             = "forward"
  target_group_arn = aws_lb_target_group.rameshext-alb.arn
}
}