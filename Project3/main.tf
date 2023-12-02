
module "ec2_instance" {
  source = "github.com/SHANMUGAPRIYA30DEVOPS/Terraform-Project/Project2"
  ami_value = "ami-0fc5d935ebf8bc3bc"
  instance_type_value = "t2.small"
}
