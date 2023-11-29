variable "container_name" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "ExampleNginxContainer"
}

variable "external_port" {
  description = "Value of the external port of the Docker container"
  type        = number
  default     = 80
}

variable "internal_port" {
  description = "Value of the internal port of the Docker container"
  type        = number
  default     = 1234
}
