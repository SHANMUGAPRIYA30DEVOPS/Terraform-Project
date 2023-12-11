provider "aws" {
  region = "us-east-1"
}
provider "vault" {
  address = "http://52.90.242.199:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      
      role_id = "65985328-63be-1f84-b812-670fa6dd23b7"
      secret_id = "59b4e83e-473d-eb86-88a4-8ed1a543f927"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "example" {
 ami = "ami-0fc5d935ebf8bc3bc"
instance_type =  "t2.micro"
tags = {
  secret = data.vault_kv_secret_v2.example.data["username"]
}

}
