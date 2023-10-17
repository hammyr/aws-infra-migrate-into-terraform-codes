# Generic variables
region = "ap-southeast-1"



# VPC variables
vpc_cidr_block       = "10.0.0.0/16"
enable_dns_hostnames = true
vpc_tags             = { "Name" = "dev-wp_vpc", "environment" = "dev", "created-by" = "terraform" }




# public_subnets variables
public_subnet_1_cidr_block        = "10.0.1.0/24"
public_subnet_1_availability_zone = "ap-southeast-1a"
map_public_ip_on_launch           = true
public_subnet_1_tags              = { "Name" = "dev-public-subnet-1", "environment" = "dev", "created-by" = "terraform" }
public_subnet_2_cidr_block        = "10.0.2.0/24"
public_subnet_2_availability_zone = "ap-southeast-1b"
public_subnet_2_tags              = { "Name" = "dev-public-subnet-2", "environment" = "dev", "created-by" = "terraform" }


# priavte_subnets variables
private_subnet_1_cidr_block        = "10.0.3.0/24"
private_subnet_1_availability_zone = "ap-southeast-1a"
private_subnet_1_tags              = { "Name" = "dev-private-subnet-1", "environment" = "dev", "created-by" = "terraform" }
private_subnet_2_cidr_block        = "10.0.4.0/24"
private_subnet_2_availability_zone = "ap-southeast-1b"
private_subnet_2_tags              = { "Name" = "dev-private-subnet-2", "environment" = "dev", "created-by" = "terraform" }

# db_subnets variables
db_subnet_1_cidr_block        = "10.0.5.0/24"
db_subnet_1_availability_zone = "ap-southeast-1a"
db_subnet_1_tags              = { "Name" = "dev-db-subnet-1", "environment" = "dev", "created-by" = "terraform" }
db_subnet_2_cidr_block        = "10.0.6.0/24"
db_subnet_2_availability_zone = "ap-southeast-1b"
db_subnet_2_tags              = { "Name" = "dev-db-subnet-2", "environment" = "dev", "created-by" = "terraform" }

# igw variable
igw_tags = { "Name" = "dev-igw", "environment" = "dev", "created-by" = "terraform" }

# nat_gw variable
nat_gw_tags = { "Name" = "dev-nat-gw", "environment" = "dev", "created-by" = "terraform" }

# route tables variables
public_rt_1_tags  = { "Name" = "dev-public_rt_1", "environment" = "dev", "created-by" = "terraform" }
private_rt_1_tags = { "Name" = "dev-private_rt_1", "environment" = "dev", "created-by" = "terraform" }
db_rt_1_tags      = { "Name" = "dev-db_rt_1", "environment" = "dev", "created-by" = "terraform" }


/*
# bastion_sg variables
bastion_sg_name        = "dev_bastion-sg"
bastion_sg_description = "Allow port 22 from anywhere"
bastion_sg_tags = {
  Name        = "dev-sg-for-bastion-server"
  environment = "dev"
  created-by  = "terraform"
}

bastion_sg_ingress_from_port   = 22
bastion_sg_ingress_to_port     = 22
bastion_sg_ingress_protocol    = "tcp"
bastion_sg_ingress_cidr_blocks = ["0.0.0.0/0"]
#bastion_sg_ingress_source_security_group_id = [""]
bastion_sg_ingress_rule_description = "Allow port 22 from anywhere"


# alb_sg variable
dev_alb_sg_name = "dev_alb_sg"

# app_sg variable
dev_app_sg_name = "dev_app_sg"

# db_sg variable
dev_db_sg_name = "dev_db_sg"
*/

