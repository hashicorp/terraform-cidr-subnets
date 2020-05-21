# Terraform CIDR Subnets Module test cases

This directory is a Terraform configuration that you can apply to verify the
behavior of this module.

It uses
[a community provider called `testing`](https://github.com/apparentlymart/terraform-provider-testing)
which will be installed automatically from the Terraform Registry. Community
provider installation requires Terraform 0.13 or later, so this test
configuration requires Terraform v0.13 or greater even though the module it
is testing only requires Terraform v0.12.

With the configuration successfully initialized, run `terraform apply` to see
if it produces any errors. If the apply completes successfully then the tests
have passed.
