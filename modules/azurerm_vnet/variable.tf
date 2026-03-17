variable "vnet_name" {
  type = map(object({
    name          = string
    location      = string
    rg_name       = string
    address_space = list(string)
    tags          = map(string)
    subnet = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}
