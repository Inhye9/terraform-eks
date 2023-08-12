resource "aws_instance" "workbench" {
  ami                    = "ami-0a98b53e9d1e1fae2" #Amazon Linux 2 AMI (HVM) 
  instance_type          = "t2.nano"
  vpc_security_group_ids = [aws_security_group.instance.id]

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
    Name = "${var.cluster_name}-workbench"
  }
}
