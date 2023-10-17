# security_group variables
variable "vpc_id" {
  description = "vpc_id"
  type = string
}

variable "security_group_name" {
  description = "security_group_name"
  type = string
}

variable "security_group_description" {
  description = "security_group_description"
  type = string
}

variable "security_group_tags" {
  description = "security_group_tags"
  type = map(string)
}

variable "ingress_from_port" {
  description = "ingress_from_port"
  type = number
}

variable "ingress_to_port" {
  description = "ingress_to_port"
  type = number
}

variable "ingress_protocol" {
  description = "ingress_protocol"
  type = string
}

variable "ingress_cidr_blocks" {
  description = "ingress_cidr_blocks"
  type = list(string)
}

variable "ingress_source_security_group_id" {
  description = "ingress_source_security_group_id"
  type = list(string)
  default = null
}

variable "ingress_rule_description" {
  description = "ingress_rule_description"
  type = string
}

variable "ingress_security_group_prefix_list_ids" {
  description = "ingress_security_group_prefix_list_ids"
  type = list(string)
  default = null
}


# alb_sg variable
variable "dev_alb_sg_name" {
  description = "dev_alb_sg_name"
  type = string
}

# app_sg variable
variable "dev_app_sg_name" {
  description = "dev_app_sg_name"
  type = string
}

# db_sg variable
variable "dev_db_sg_name" {
  description = "dev_db_sg_name"
  type = string
}

