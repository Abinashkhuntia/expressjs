
resource "aws_alb" "myapp-elb" {
  name = "demo-elb"
  load_balancer_type = "application"
  subnets         = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  # security_groups = [aws_security_group.myapp-elb-securitygroup.id]

  tags = {
    Name = "myapp-elb"
  }
}

resource "aws_lb_listener" "chat-service" {
  load_balancer_arn = aws_alb.myapp-elb.arn
  port              = "3000"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.demo-service.arn
  }
}

