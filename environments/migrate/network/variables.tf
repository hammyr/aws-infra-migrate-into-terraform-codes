# Generic variables
variable "region" {
  description = "Region code"
  type        = string
}


# vpc variables
variable "vpc_cidr_block" {}
variable "enable_dns_hostnames" {}
variable "vpc_tags" {}



# public_subnets variables
variable "public_subnet_1_cidr_block" {}
variable "public_subnet_1_availability_zone" {}
variable "map_public_ip_on_launch" {}
variable "public_subnet_1_tags" {}
variable "public_subnet_2_cidr_block" {}
variable "public_subnet_2_availability_zone" {}
variable "public_subnet_2_tags" {}

# priavte_subnets variables
variable "private_subnet_1_cidr_block" {}
variable "private_subnet_1_availability_zone" {}
variable "private_subnet_1_tags" {}
variable "private_subnet_2_cidr_block" {}
variable "private_subnet_2_availability_zone" {}
variable "private_subnet_2_tags" {}

# db_subnets variables
variable "db_subnet_1_cidr_block" {}
variable "db_subnet_1_availability_zone" {}
variable "db_subnet_1_tags" {}
variable "db_subnet_2_cidr_block" {}
variable "db_subnet_2_availability_zone" {}
variable "db_subnet_2_tags" {}

# igw variable
variable "igw_tags" {}

# nat_gw variable
variable "nat_gw_tags" {}

# route tables variables
variable "public_rt_1_tags" {}
variable "private_rt_1_tags" {}
variable "db_rt_1_tags" {}


/*
# bastion_sg variables
variable "bastion_sg_name" {}
variable "bastion_sg_description" {}
variable "bastion_sg_tags" {}
variable "bastion_sg_ingress_from_port" {}
variable "bastion_sg_ingress_to_port" {}
variable "bastion_sg_ingress_protocol" {}
variable "bastion_sg_ingress_cidr_blocks" {}
#variable "bastion_sg_ingress_source_security_group_id" {}
variable "bastion_sg_ingress_rule_description" {}
#variable "bastion_sg_ingress_security_group_prefix_list_ids" {}


# alb_sg variable
variable "dev_alb_sg_name" {}

# app_sg variable
variable "dev_app_sg_name" {}

# db_sg variable
variable "dev_db_sg_name" {}
*/

