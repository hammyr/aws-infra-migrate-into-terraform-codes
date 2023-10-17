# vpc
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = var.vpc_tags
}

# public subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_1_cidr_block
  availability_zone = var.public_subnet_1_availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = var.public_subnet_1_tags
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_2_cidr_block
  availability_zone = var.public_subnet_2_availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags = var.public_subnet_2_tags
}


# private subnet
resource "aws_subnet" "private_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_1_cidr_block
  availability_zone = var.private_subnet_1_availability_zone
  tags = var.private_subnet_1_tags
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_2_cidr_block
  availability_zone = var.private_subnet_2_availability_zone
  tags = var.private_subnet_2_tags
}

# db subnet
resource "aws_subnet" "db_subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.db_subnet_1_cidr_block
  availability_zone = var.db_subnet_1_availability_zone
  tags = var.db_subnet_1_tags
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.db_subnet_2_cidr_block
  availability_zone = var.db_subnet_2_availability_zone
  tags = var.db_subnet_2_tags
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = var.igw_tags
}

# Elastic ip
resource "aws_eip" "eip" {
  #vpc = true       #Deprecated, Use domain instead.
  #domain = vpc     #not workingo so comment it then it works.
}

# Nat Gateway
resource "aws_nat_gateway" "nat_gw" {
  subnet_id = aws_subnet.public_subnet_1.id
  allocation_id = aws_eip.eip.id
  tags = var.nat_gw_tags
  depends_on = [ aws_internet_gateway.igw ]
}


######################################################
# public route table
# public subnets association into public route table
# Add Internet Gateway into public route table
######################################################
# public route table
resource "aws_route_table" "public_rt_1" {
  vpc_id = aws_vpc.vpc.id
  tags = var.public_rt_1_tags
}

# Associate public subnets with public route table
resource "aws_route_table_association" "public_subnet_1_association" {
  route_table_id = aws_route_table.public_rt_1.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  route_table_id = aws_route_table.public_rt_1.id
  subnet_id = aws_subnet.public_subnet_2.id
}

# Add Internet Gateway into public route table
resource "aws_route" "igw_add_public_rt_1" {
  route_table_id = aws_route_table.public_rt_1.id
  gateway_id = aws_internet_gateway.igw.id
  destination_cidr_block = "0.0.0.0/0"
}


######################################################
# private route table
# private subnets association into private route table
# Add Nat Gateway into private route table
######################################################
# private route table
resource "aws_route_table" "private_rt_1" {
  vpc_id = aws_vpc.vpc.id
  tags = var.private_rt_1_tags
}

# Associate private subnets with private route table
resource "aws_route_table_association" "private_subnet_1_association" {
  route_table_id = aws_route_table.private_rt_1.id
  subnet_id = aws_subnet.private_subnet_1.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  route_table_id = aws_route_table.private_rt_1.id
  subnet_id = aws_subnet.private_subnet_2.id
}

# Add Nat Gateway into private route table
resource "aws_route" "nat_add_private_subnet_1" {
  route_table_id = aws_route_table.private_rt_1.id
  nat_gateway_id = aws_nat_gateway.nat_gw.id
  destination_cidr_block = "0.0.0.0/0"
}


######################################################
# database route table
# database subnets association into database route table
######################################################
# database route table
resource "aws_route_table" "db_rt_1" {
  vpc_id = aws_vpc.vpc.id
  tags = var.db_rt_1_tags
}

# Associate db subnets with db route table
resource "aws_route_table_association" "db_subnet_1_association" {
  route_table_id = aws_route_table.db_rt_1.id
  subnet_id = aws_subnet.db_subnet_1.id
}

resource "aws_route_table_association" "db_subnet_2_association" {
  route_table_id = aws_route_table.db_rt_1.id
  subnet_id = aws_subnet.db_subnet_2.id
}

