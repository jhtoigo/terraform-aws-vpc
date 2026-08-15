variable "project_name" {
  description = "Project Name"
  type        = string

  validation {
    condition     = length(trimspace(var.project_name)) > 0
    error_message = "project_name cannot be empty."
  }
}

variable "cidr_block" {
  type        = string
  description = "VPC CIDR Block"

  validation {
    condition     = can(cidrnetmask(var.cidr_block))
    error_message = "cidr_block must be a valid CIDR block."
  }
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

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.public_subnets : can(cidrnetmask(cidr))])
    error_message = "All public_subnets entries must be valid CIDR blocks."
  }
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.private_subnets : can(cidrnetmask(cidr))])
    error_message = "All private_subnets entries must be valid CIDR blocks."
  }
}

variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.database_subnets : can(cidrnetmask(cidr))])
    error_message = "All database_subnets entries must be valid CIDR blocks."
  }
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

variable "region" {
  description = "AWS Region"
  type        = string

  validation {
    condition     = length(trimspace(var.region)) > 0
    error_message = "region cannot be empty."
  }
}
