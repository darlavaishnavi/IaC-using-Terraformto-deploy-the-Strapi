resource "aws_ecs_cluster" "strapi" {
  name = "strapi-cluster"
}

resource "aws_ecs_task_definition" "strapi" {
  family                   = "strapi-task"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name  = "strapi"
    image = "ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/strapi-app:latest"
    essential = true
    portMappings = [{
      containerPort = 1337
    }]
    environment = [
      { name = "DATABASE_HOST", value = aws_db_instance.strapi_db.address },
      { name = "DATABASE_NAME", value = "strapi" },
      { name = "DATABASE_USERNAME", value = var.db_username },
      { name = "DATABASE_PASSWORD", value = "ChangeMe123!" }
    ]
  }])
}

