# SECURITY CONFIGURATION
variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "sg_name" {
  description = "Security group name"
  type        = string
}

variable "sg_description" {
  description = "Security group description"
  type        = string
}

variable "ssh_description" {
  type = string
}

variable "ssh_port" {
  type = number
}

variable "ssh_protocol" {
  type = string
}

variable "ssh_cidr_blocks" {
  type = list(string)
}

variable "http_description" {
  type = string
}

variable "http_port" {
  type = number
}

variable "http_protocol" {
  type = string
}

variable "http_cidr_blocks" {
  type = list(string)
}

variable "egress_from_port" {
  type = number
}

variable "egress_to_port" {
  type = number
}

variable "egress_protocol" {
  type = string
}

variable "egress_cidr_blocks" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}
