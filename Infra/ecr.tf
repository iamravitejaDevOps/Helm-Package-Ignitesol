resource "aws_ecr_repository" "app_repo" {
  name = "ignite-sol"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true

  tags = {
    Name = "ignite-sol-ecr"
  }
}