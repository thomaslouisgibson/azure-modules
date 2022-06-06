resource "azurerm_subscription" "spoke" {
  alias             = var.subscription_name
  subscription_name = var.subscription_name
  subscription_id   = var.subscription_id
} 

data "azurerm_management_group" "parent" {
  name = var.parent_id
}

data "azurerm_subscription" "spoke" {
  subscription_id = var.subscription_id
}

#resource "azurerm_management_group_subscription_association" "association" {
#  management_group_id = data.azurerm_management_group.parent.id
#  subscription_id     = data.azurerm_subscription.spoke.id
#}
