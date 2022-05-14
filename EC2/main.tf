resource "aws_instance" "foo" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = "true"
  availability_zone = var.az
  subnet_id = var.subnet_id

  tags = {
    Name = var.project_name
  }
}