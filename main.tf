resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = {
    "Name" = var.project_name
  }

  lifecycle {
    precondition {
      condition     = length(var.azs) >= local.max_subnet_count
      error_message = "The azs list must have at least as many entries as the largest subnet list."
    }

    precondition {
      condition     = !var.nat_gateway_active || length(var.public_subnets) > 0
      error_message = "nat_gateway_active requires at least one public subnet."
    }

    precondition {
      condition     = !var.nat_gateway_active || length(var.private_subnets) <= length(var.public_subnets)
      error_message = "nat_gateway_active requires at least as many public subnets as private subnets."
    }
  }
}

resource "aws_vpc_dhcp_options" "this" {
  count               = var.enable_dhcp_options ? 1 : 0
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "Name" = format("%s-dhcp-options", var.project_name)
  }
}

resource "aws_vpc_dhcp_options_association" "this" {
  count           = var.enable_dhcp_options ? 1 : 0
  dhcp_options_id = aws_vpc_dhcp_options.this[0].id
  vpc_id          = aws_vpc.this.id
}
