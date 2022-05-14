terraform {
    backend "s3" {
        bucket = "terraform-project1"
        key = "terraform/tfstate.tf"
        region = "us-east-1"
    }
}