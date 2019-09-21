
variable "base_cidr_block" {
  type        = string
  description = "A network address prefix in CIDR notation that all of the requested subnetwork prefixes will be allocated within."
}

variable "networks" {
  type = list(object({
    name     = string
    new_bits = number
  }))
  description = "A list of objects describing requested subnetwork prefixes. new_bits is the number of additional network prefix bits to add, in addition to the existing prefix on base_cidr_block."
}
