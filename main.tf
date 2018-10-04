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
  source              = "github.com/HappyPathway/terraform-aws-private-service"
  version             = "1.1.10"
  env                 = "${var.env}"
  key_name            = "${data.terraform_remote_state.network.key_name}"
  private_subnet_id   = "${element(data.terraform_remote_state.network.private_subnets, 0)}"
  service_healthcheck = "${var.service_healthcheck}"
  service_name        = "${var.service_name}"
  service_version     = "${var.service_version}"
  service_port        = "${var.service_port}"
  instance_type       = "${var.instance_type}"
  vpc_id              = "${data.terraform_remote_state.network.vpc_id}"
}
