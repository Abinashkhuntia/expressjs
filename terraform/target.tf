resource "aws_alb_target_group" "demo-service" {
  name     = "demo-service"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  target_type = "ip"
}

