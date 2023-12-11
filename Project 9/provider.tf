#access the aws credentials from vault

provider "vault" {
  address = "http://3.81.13.196:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      
      role_id = "cc989c78-292c-a72e-5e88-4c94774fe87d"
      secret_id = "47afc92b-03ed-7b20-a3d4-7fc1da6da6fa"
    }
  }
}

data "vault_kv_secret_v2" "aws_cred" {
  mount = "kv1"
  name = "project"
}

data "vault_kv_secret_v2" "instance_info" {
  mount = "kv2"
  name = "vmdetails"
}

provider "aws" {
region = data.vault_kv_secret_v2.aws_cred.data["region"]
access_key = data.vault_kv_secret_v2.aws_cred.data["aws_access_key_id"]
secret_key = data.vault_kv_secret_v2.aws_cred.data["aws_secret_access_key"]
  
}
