resource "aws_vpc" "this" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags = merge(
    { "Name" = var.project_name },
    var.tags
  )
}

resource "aws_vpc_dhcp_options" "this" {
  count               = var.enable_dhcp_options ? 1 : 0
  domain_name_servers = ["AmazonProvidedDNS"]
  tags                = var.tags
}

resource "aws_vpc_dhcp_options_association" "this" {
  count           = var.enable_dhcp_options ? 1 : 0
  dhcp_options_id = aws_vpc_dhcp_options.this[0].id
  vpc_id          = aws_vpc.this.id
}