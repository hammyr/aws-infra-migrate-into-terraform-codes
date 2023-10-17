# securty group
resource "aws_security_group" "security_group" {
  #vpc_id = aws_vpc.vpc.id
  vpc_id = var.vpc_id
  name = var.security_group_name
  description = var.security_group_description
  tags = var.security_group_tags

  ingress {
    from_port = var.ingress_from_port
    to_port = var.ingress_to_port
    protocol = var.ingress_protocol
    #cidr_blocks = [var.ingress_cidr_blocks]
    cidr_blocks = var.ingress_cidr_blocks
    security_groups = var.ingress_source_security_group_id    #source security_group_id
    description = var.ingress_rule_description
    prefix_list_ids = var.ingress_security_group_prefix_list_ids  #something which is used to route trafic I think, leave as of now.
  }
  
  egress {              #here itself we define egress 'Allow-All'.
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All"
  }
  /*
  egress {
    from_port = var.egress_from_port
    to_port = var.egress_to_port
    protocol = var.egress_protocol
    cidr_blocks = var.egress_cidr_blocks
    description = var.egress_rule_description
  }
  */
}


/*Noted: yha mere se security_group ka child module real time jaise ni ban paya so
  hmne alg se resoure blocks define kiya hai.
*/

# alb_sg
resource "aws_security_group" "alb_sg" {
  vpc_id      = var.vpc_id
  name        = var.dev_alb_sg_name
  description = "Allow port 80 from anywhere"
  tags = {
    Name        = "dev_alb_sg"
    environment = "dev"
    created-by  = "terraform"
  }
  ingress {
    description = "Allow port 80 from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# app_sg
resource "aws_security_group" "app_sg" {
  vpc_id      = var.vpc_id
  name        = var.dev_app_sg_name
  description = "Allow port 22 from bastion_sg and 80 from alb_sg"
  tags = {
    Name        = "dev_app_sg"
    environment = "dev"
    created-by  = "terraform"
  }
  ingress {
    description     = "allow-trrafic-from-bastion-sg-only"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.security_group.id] #here 'security_group_ids' is name of output block in child module.
  }
  ingress {
    description     = "allow-trrafic-from-alb_sg-only"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  egress {
    description = "Allow All"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# db_sg
resource "aws_security_group" "db_sg" {
  vpc_id      = var.vpc_id
  name        = var.dev_db_sg_name
  description = "Allow port 3306 from app_sg only"
  tags = {
    Name        = "dev_db_sg"
    environment = "dev"
    created-by  = "terraform"
  }
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
    description     = "allow-trrafic-from-app_sg-only"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All"
  }
}

