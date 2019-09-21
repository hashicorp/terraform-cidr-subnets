module "simple" {
  source = "../"

  base_cidr_block = "10.0.0.0/8"
  networks = [
    {
      name     = "foo"
      new_bits = 8
    },
    {
      name     = "bar"
      new_bits = 8
    },
    {
      name     = "baz"
      new_bits = 4
    },
    {
      name     = "beep"
      new_bits = 8
    },
    {
      name     = "boop"
      new_bits = 8
    },
  ]
}

data "testing_assertions" "simple" {
  subject = "Simple call"

  equal "network_cidr_blocks" {
    statement = "has the expected network_cidr_blocks"

    got = module.simple.network_cidr_blocks
    want = tomap({
      foo  = "10.0.0.0/16"
      bar  = "10.1.0.0/16"
      baz  = "10.16.0.0/12"
      beep = "10.32.0.0/16"
      boop = "10.33.0.0/16"
    })
  }

  equal "networks" {
    statement = "has the expected networks"

    got = module.simple.networks
    want = tolist([
      {
        cidr_block = "10.0.0.0/16"
        name       = "foo"
        new_bits   = 8
      },
      {
        cidr_block = "10.1.0.0/16"
        name       = "bar"
        new_bits   = 8
      },
      {
        cidr_block = "10.16.0.0/12"
        name       = "baz"
        new_bits   = 4
      },
      {
        cidr_block = "10.32.0.0/16"
        name       = "beep"
        new_bits   = 8
      },
      {
        cidr_block = "10.33.0.0/16"
        name       = "boop"
        new_bits   = 8
      },
    ])
  }
}

output "simple" {
  value = module.simple
}
