terraform {
  backend "s3" {
    bucket         = "terraform-backend-demo-bucket-ashutosh"
    key            = "terraform/state/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock-table-demo"
    encrypt        = true
  }
}
