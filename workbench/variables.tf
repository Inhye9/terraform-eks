variable "workbench_name" {
  description = "The name of workbench ec2"
  type        = string 
  default     = "tf-workbench"
  
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "tf-workbench-sg"
}

variable "vpc_id" {
  type        = string
  description = "vpc_id"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "public subnet id"
}


variable "my_ip_cidr"{
  type        = string
}

