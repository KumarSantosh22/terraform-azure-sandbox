variable "client_secret" {
  type = string,
  sensitive = true
}

variable "environment" {
  type    = string
  default = "feature"
}

variable "location" {
  type    = string
  default = "Central India"
}

variable "tf_source" {
  type    = string
  default = "Terraform"
}
