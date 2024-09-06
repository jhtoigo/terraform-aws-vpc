variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "azs" {
  description = "A list of AZs"
  type        = list(string)
  default     = []
}

variable "enable_dns_support" {
  description = "Enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags for the VPC"
  type        = map(string)
  default     = {}
}


variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "nat_gateway_active" {
  description = "Create or not nat gateways"
  type        = bool
  default     = false
}

variable "enable_dhcp_options" {
  description = "Create or not dhcp options"
  type        = bool
  default     = true
}