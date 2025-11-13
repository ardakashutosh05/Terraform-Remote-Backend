terraform {
  backend "s3" {
    bucket         = "terraform-backend-demo-bucket-ashutosh-new"
    key            = "terraform/state/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "terraform-lock-table-demo-1"
    encrypt        = true
  }
}
