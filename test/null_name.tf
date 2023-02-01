# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "null_name" {
  source = "../"

  base_cidr_block = "10.0.0.0/8"
  networks = [
    {
      name     = null
      new_bits = 8
    },
    {
      name     = "bar"
      new_bits = 8
    },
    {
      name     = null
      new_bits = 8
    },
  ]
}

data "testing_assertions" "null_name" {
  subject = "Call with null names"

  equal "network_cidr_blocks" {
    statement = "has the expected network_cidr_blocks"

    got = module.null_name.network_cidr_blocks
    want = tomap({
      # the first network is skipped because its name is null, but it
      # still occupies address space.
      # The last network is also skipped, but it does not affect any
      # other addresses because there are no further networks after it.
      bar = "10.1.0.0/16"
    })
  }

  equal "networks" {
    statement = "has the expected networks"

    got = module.null_name.networks
    want = tolist([
      {
        cidr_block = tostring(null)
        name       = tostring(null)
        new_bits   = 8
      },
      {
        cidr_block = "10.1.0.0/16"
        name       = "bar"
        new_bits   = 8
      },
      {
        cidr_block = tostring(null)
        name       = tostring(null)
        new_bits   = 8
      },
    ])
  }
}

output "null_name" {
  value = module.null_name
}
