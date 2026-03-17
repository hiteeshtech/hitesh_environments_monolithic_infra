variable "public_ip" {
  type = map(object({
    name              = string
    rg_name           = string
    location          = string
    allocation_method = string
    tags              = optional(map(string))
  }))
}
