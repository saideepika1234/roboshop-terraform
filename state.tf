terraform {
    backend "s3" {
        bucket = "terraform-a21"
        key = "roboshop/dev/terraform.tfstate"
        region = "us-east-1"
    }
}