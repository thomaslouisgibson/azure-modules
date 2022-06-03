variable "name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Location of the Resource Group"
  type        = string
}

variable "resource_group_id" {
  description = "Location of the Resource Group"
  default = "None"
  type        = string
}

variable "subscription_name" {
  description = "Name of the Subscription"
  type        = string
}

variable "parent_id" {
  description = "ID of the parent management group"
  type        = string
}

variable "subscription_id" {
  description = "ID of the subscription"
  type        = string
}
