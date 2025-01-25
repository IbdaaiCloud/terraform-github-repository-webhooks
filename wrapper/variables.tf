variable "defaults" {
  description = <<EOF
  Map of default values which will be used for each item.
EOF
  type        = any
  default     = {}
}

variable "items" {
  description = <<EOF
  Maps of items to create a wrapper from. Values are passed through to the module.
EOF
  type        = any
  default     = {}
}
