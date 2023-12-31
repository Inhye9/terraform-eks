resource "aws_instance" "workbench" {
  #ami                    = "ami-0a98b53e9d1e1fae2" #Amazon Linux 2 AMI (HVM) 
  ami  			 = "ami-027ce4ce0590e3c98"
  instance_type          = "t2.nano"

  #vpc_id 		 = var.vpc_id
  subnet_id		 = var.public_subnet_ids[0]
  #subnet_id		 = slice(flatten(var.public_subnet_ids),0,2)

  vpc_security_group_ids = [aws_security_group.instance.id]
  key_name		 = aws_key_pair.tf-key-pair.key_name 

  associate_public_ip_address = true


  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y 
  sudo yum install unzip
  
  #eks 
  curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
  sudo mv /tmp/eksctl /usr/local/bin

  #kubectl 1.24.11
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
  sudo chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin

  #aws cli 
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  
  EOF

  tags = {
    Name = "${var.workbench_name}"

  }
}
