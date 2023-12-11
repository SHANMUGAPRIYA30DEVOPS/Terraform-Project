resource "aws_instance" "example" {
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"
  tags = {
    uname = data.vault_kv_secret_v2.instance_info.data["username"]
    env = data.vault_kv_secret_v2.instance_info.data["environment"]
    version = data.vault_kv_secret_v2.instance_info.data["version"]
  }
}
