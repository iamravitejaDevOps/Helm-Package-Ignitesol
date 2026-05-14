terraform {
  backend "s3" {
    bucket         = "ignite-sol-terraform-state-1778727007"
    key            = "ignite_sol/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true

  }
}