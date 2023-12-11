check vault is installed
$ vault

Evertime when we shut and restart the server, refresh the vault UI, below needs to be followed

open 2 CLI for vault server (ec2instance)

1 CLI : vault server -dev -dev-listen-address="0.0.0.0:8200"


<img width="475" alt="image" src="https://github.com/SHANMUGAPRIYA30DEVOPS/Terraform-Project/assets/104688378/aac4c594-4cc7-4b34-82be-efcf8673fe71">



2 CLI : export the vault address from the output of above
$ export VAULT_ADDR='http://0.0.0.0:8200'

2 CLI : 
$vault policy write terraform - <<EOF
path "*" {
  capabilities = ["list", "read"]
}

path "secrets/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "kv/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}


path "secret/data/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "auth/token/create" {
capabilities = ["create", "read", "update", "list"]
}
EOF

Login to vault UI -> username :token
password: root token (OUTPUT OF 1 CLI)
In vault UI, select access->authentication method-> enable new method->approle -> next -> path (approle) -> enable method

2 CLI : vault write auth/approle/role/terraform \
    secret_id_ttl=10m \
    token_num_uses=10 \
    token_ttl=20m \
    token_max_ttl=30m \
    secret_id_num_uses=40 \
    token_policies=terraform


2 CLI : vault read auth/approle/role/terraform/role-id

2 CLI : vault write -f auth/approle/role/terraform/secret-id (GENERATE EVERY 10 MINS ONCE AND USE IN .tf FILE)
