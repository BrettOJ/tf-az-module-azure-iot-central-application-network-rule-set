variable "iotcentral_application_id" {
  description = "The ID of the IoT Central Application."
  type        = string
  
}

variable "ip_rules" {
  description = "A list of IP rules for the IoT Central Application Network Rule Set."
  type        = list(object({
    iprule = object({
        name = string
        ip_mask = string
    })
  }))
  default     = null
}