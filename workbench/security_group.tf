resource "aws_security_group" "instance" {
  name 			  = var.security_group_name
  vpc_id		  = var.vpc_id 
  #subnet_id              = var.public_subnet_ids[0]

  ingress {
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip_cidr}/24"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    "Name" = "${var.security_group_name}" 
  }
}


