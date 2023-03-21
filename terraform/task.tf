
resource "aws_ecs_task_definition" "myapp-task-definition" {
  family                = "demo-app"
  execution_role_arn    = "arn:aws:iam::756515085936:role/ecsTaskExecutionRole"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"
  container_definitions =  jsonencode([
  {
    "essential": true,
    "name": "demo-app",
    "image": "756515085936.dkr.ecr.ap-south-1.amazonaws.com/production",
    "portMappings": [
        {
            "containerPort": 3000,
            "hostPort": 3000
        }
    ]
  }
])

}


resource "aws_ecs_service" "Hospice-frontend" {
  name            = "demo-app"
  cluster         = aws_ecs_cluster.demo-cluster.id
  launch_type                        = "FARGATE"
  task_definition = aws_ecs_task_definition.myapp-task-definition.arn
  desired_count   = 1
  # iam_role        = aws_iam_role.ecs-service-role.arn
  depends_on      = [aws_iam_policy_attachment.ecs-service-attach1]
  network_configuration {
  #  security_groups  = var.ecs_service_security_groups
   subnets          =  [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
   assign_public_ip = false
 }

  load_balancer {
    target_group_arn = aws_alb_target_group.demo-service.arn
    container_name = "demo-app"
    container_port = 3000
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}
