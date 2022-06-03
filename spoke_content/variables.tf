variable "location" {
  description = "Spoke Location"
  type        = string
}

variable "environment" {
  description = "Spoke Environment"
  type        = string
}

variable "client_tla" {
  description = "Spoke client"
  type        = string
}

variable "core_resource_group_name" {
  description = "Name of the Core Resource Group"
  type        = string
}

variable "core_resource_group_location" {
  description = "Location of the Core Resource Group"
  type        = string
}

variable "hub_resource_group_name" {
  description = "Location of the Core Resource Group"
  type        = string
}

variable "hub_virtual_network_name" {
  description = "Location of the Core Resource Group"
  type        = string
}

variable "hub_virtual_network_id" {
  description = "Location of the Core Resource Group"
  type        = string
}

variable "address_space" {
  description = "Location of the Core Resource Group"
  type        = list
}

variable "dns_servers" {
  description = "Location of the Core Resource Group"
  type        = list
}

variable "address_prefix_subnet" {
  description = "Location of the Core Resource Group"
  type        = string
}
