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
