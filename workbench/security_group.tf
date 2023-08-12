resource "aws_security_group" "instance" {
  name = var.security_group_name

  ingress {
    from_port   = 22 
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = var.my-ip-address
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

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "${var.cluster_name}-workbench-sg"
}

output "public_ip" {
  value       = aws_instance.example.public_ip
  description = "The public IP of the Instance"
}
EOT
