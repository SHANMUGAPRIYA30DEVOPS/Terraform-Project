output "module-ec2-output" {
  value = module.ec2_instance.public-ip-address-to-display
}

# module.modulename.outputname
