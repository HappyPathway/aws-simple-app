output "private_dns" {
  value = "${module.simple-app.private_dns}"
}

output "elb_security_group" {
  value = "${module.simple-app.elb_security_group}"
}
