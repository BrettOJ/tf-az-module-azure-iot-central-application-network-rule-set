variable "resource_group_name" {
  description = "The name of the resource group in which the resources will be created"
  type        = string
}

variable "location" {
  description = "The location/region where the resources will be created"
  type        = string
}

variable "sub_domain" {
  description = "A sub_domain name. Subdomain for the IoT Central URL. Each application must have a unique subdomain."
  type        = string
}

variable "display_name" {
  description = "A display_name name. Custom display name for the IoT Central application. Default is resource name."
  type        = string
  default     = ""
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed for the IoT Central Application. Defaults to true."
  type        = bool
  default     = true
}

variable "sku" {
  description = "A sku name. Possible values is ST0, ST1, ST2, Default value is ST1"
  type        = string
  default     = "ST1"
}

variable "template" {
  description = "A template name. IoT Central application template name. Defaults to iotc-pnp-preview@1.0.0. Changing this forces a new resource to be created."
  type        = string
  default     = "iotc-pnp-preview@1.0.0"
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(any)
  default     = null
}

variable "identity" {
  description = "An identity block as defined below."
  type = object({
    type = string
  })
  default = {
    type = "SystemAssigned"
  }
}

