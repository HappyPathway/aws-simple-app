variable "organization" {
  type        = "string"
  description = "Terraform Enterprise Organization"
}

variable "workspace" {
  type        = "string"
  description = "Terraform Enterprise Workspace"
}

variable "env" {
  default     = "dev"
  type        = "string"
  description = "App Environment"
}

variable "service_healthcheck" {
  type        = "string"
  description = "Service Healthcheck URL"
}

variable "service_name" {
  type        = "string"
  description = "Service Name"
}

variable "service_port" {
  type        = "string"
  description = "Service Port"
}

variable "service_version" {
  type        = "string"
  description = "Service Version"
}

variable "instance_type" {
  type    = "string"
  default = "m4.large"
}
