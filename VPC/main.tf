resource "aws_vpc" "main" {
  cidr_block = var.cidr
  instance_tenancy = "default"
  tags = {
    Name = var.project_name
  }
}
