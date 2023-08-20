resource "aws_key_pair" "tf-key-pair" {
  key_name   = "tf-key-pair"
  
  public_key = file("/root/terraform/.ssh/tf-key-pair.pub")
  
  tags = {
  	description = "terraform key pair import"
  }
} 
