data "terraform_remote_state" "network" {
  backend = "atlas"

  config {
    name = "${var.organization}/${var.workspace}"
  }
}

provider "aws" {
  region = "${data.terraform_remote_state.network.region}"
}

module "simple-app" {
  source              = "app.terraform.io/Darnold-Hashicorp/private-service/aws"
  version             = "1.0.8"
  env                 = "${var.env}"
  key_name            = "${data.terraform_remote_state.network.key_name}"
  private_subnet_id   = "${data.terraform_remote_state.network.private_subnet}"
  service_healthcheck = "add/1/1"
  service_name        = "simple-app"
  service_version     = "1.0.1"
  service_port        = 8000
  instance_type       = "m4.large"
  vpc_id              = "${data.terraform_remote_state.network.vpc_id}"
}
