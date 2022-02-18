output "network_cidr_blocks" {
  value       = tomap(local.addrs_by_name)
  description = "A map from network names to allocated address prefixes in CIDR notation."
}

output "networks" {
  value       = tolist(local.network_objs)
  description = "A list of objects corresponding to each of the objects in the input variable 'networks', each extended with a new attribute 'cidr_block' giving the network's allocated address prefix."
}

output "base_cidr_block" {
  value       = var.base_cidr_block
  description = "Echoes back the base_cidr_block input variable value, for convenience if passing the result of this module elsewhere as an object."
}

output "grouped_by_seperator" {
  value = try({ for _, type in local.name_prefixes: type => { for name, cidr in local.addrs_by_name: split(var.seperator, name)[1] => cidr if split(var.seperator, name)[0] == type}}, null)
}
