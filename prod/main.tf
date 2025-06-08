resource "aws_ecs_cluster" "appointment_service" {
  name = "appointment-service-cluster"
}

resource "aws_ecs_task_definition" "appointment_service" {
  family                   = "appointment-service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "appointment-service"
      image     = "<your_docker_image_uri>"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "appointment_service" {
  name            = "appointment-service"
  cluster         = aws_ecs_cluster.appointment_service.id
  task_definition = aws_ecs_task_definition.appointment_service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["<your_subnet_id>"]
    security_groups  = ["<your_security_group_id>"]
    assign_public_ip = true
  }
}

resource "aws_cloudwatch_log_group" "appointment_service" {
  name = "/ecs/appointment-service"
}

resource "aws_ecs_service" "appointment_service" {
  name            = "appointment-service"
  cluster         = aws_ecs_cluster.appointment_service.id
  task_definition = aws_ecs_task_definition.appointment_service.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = ["<your_subnet_id>"]
    security_groups  = ["<your_security_group_id>"]
    assign_public_ip = true
  }

  depends_on = [aws_cloudwatch_log_group.appointment_service]
}