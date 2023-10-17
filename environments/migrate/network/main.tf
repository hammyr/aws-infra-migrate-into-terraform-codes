# Network Module
module "network" {
  source = "./../../../modules/network/vpc_module"

  # vpc variables
  vpc_cidr_block       = var.vpc_cidr_block
  #vpc_cidr_block  = "10.0.0.0/16"
  enable_dns_hostnames = var.enable_dns_hostnames
  vpc_tags             = var.vpc_tags

  # public subnets
  public_subnet_1_cidr_block        = var.public_subnet_1_cidr_block
  public_subnet_1_availability_zone = var.public_subnet_1_availability_zone
  map_public_ip_on_launch           = var.map_public_ip_on_launch
  public_subnet_1_tags              = var.public_subnet_1_tags
  public_subnet_2_cidr_block        = var.public_subnet_2_cidr_block
  public_subnet_2_availability_zone = var.public_subnet_2_availability_zone
  public_subnet_2_tags              = var.public_subnet_2_tags

  # private subnet
  private_subnet_1_cidr_block        = var.private_subnet_1_cidr_block
  private_subnet_1_availability_zone = var.private_subnet_1_availability_zone
  private_subnet_1_tags              = var.private_subnet_1_tags
  private_subnet_2_cidr_block        = var.private_subnet_2_cidr_block
  private_subnet_2_availability_zone = var.private_subnet_2_availability_zone
  private_subnet_2_tags              = var.private_subnet_2_tags

  # db subnet
  db_subnet_1_cidr_block        = var.db_subnet_1_cidr_block
  db_subnet_1_availability_zone = var.db_subnet_1_availability_zone
  db_subnet_1_tags              = var.db_subnet_1_tags
  db_subnet_2_cidr_block        = var.db_subnet_2_cidr_block
  db_subnet_2_availability_zone = var.db_subnet_2_availability_zone
  db_subnet_2_tags              = var.db_subnet_2_tags

  # Internet & Nat Gateway
  igw_tags    = var.igw_tags
  nat_gw_tags = var.nat_gw_tags

  # route tables
  public_rt_1_tags  = var.public_rt_1_tags
  private_rt_1_tags = var.private_rt_1_tags
  db_rt_1_tags      = var.db_rt_1_tags

}




/*
# bastion_sg Module
module "all_sg" {
  source = "./../../../modules/network/security_group_module"

  # security_group variables
  vpc_id = module.network.vpc_id #here 'vpc_id' is name of output block from child module.
  /*Noted: here 'vpc_id' is name of output block in child module.
    module ek object hai so module ka koi 'attribute' ni hota hai jaise baki 
    resource block like 'aws_instance', 'aws_vpc', etc  ka hota hai aur terraform
    documentation me bhi define rhta hai, so overall child module k output block
    ka jo name hai vhi apka 'attribute' hoga.
    */

/*
  security_group_name        = var.bastion_sg_name
  security_group_description = var.bastion_sg_description
  security_group_tags        = var.bastion_sg_tags

  ingress_from_port   = var.bastion_sg_ingress_from_port
  ingress_to_port     = var.bastion_sg_ingress_to_port
  ingress_protocol    = var.bastion_sg_ingress_protocol
  ingress_cidr_blocks = var.bastion_sg_ingress_cidr_blocks
  #ingress_source_security_group_id       = var.bastion_sg_ingress_source_security_group_id
  ingress_rule_description = var.bastion_sg_ingress_rule_description
  #ingress_security_group_prefix_list_ids = var.bastion_sg_ingress_security_group_prefix_list_ids


  # alb_sg variable
  dev_alb_sg_name = var.dev_alb_sg_name

  # app_sg variable
  dev_app_sg_name = var.dev_app_sg_name

  # db_sg variable
  dev_db_sg_name = var.dev_db_sg_name
}*/

