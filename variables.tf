
variable "base_cidr_block" {
  type        = string
  description = "A network address prefix in CIDR notation that all of the requested subnetwork prefixes will be allocated within."
}

variable "networks" {
  type = list(object({
    name     = string
    netmask = number
  }))
  description = "A list of objects describing requested subnetwork prefixes. netmask is the requested subnetwork cidr to slice from base_cidr_block"
}

variable "separator" {
  type = string
  default = "/"
  description = "Used to provide an output of grouped subnets based on a split()[0]."
}
