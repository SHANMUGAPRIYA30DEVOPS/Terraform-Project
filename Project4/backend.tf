terraform {
  backend "s3" {
    bucket         = "priya-bucket3" # change this
    key            = "priya/terraform.tfstate"
    region         = "us-west-1"
    encrypt        = true
    dynamodb_table = "priya_lock"
  }
}
