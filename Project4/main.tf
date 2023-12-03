provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "priya" {
    ami = "ami-0cbd40f694b804622"
  instance_type = "t2.micro"

}

resource "aws_s3_bucket" "priya_storages3" {
    bucket = "priya-bucket3"
}

resource "aws_dynamodb_table" "priya_dynamo" {

    name = "priya_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
    name = "LockID"
    type = "S"
  }
  
}
