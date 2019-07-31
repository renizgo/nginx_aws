#!/bin/bash
# Verifying instalation of Docker
echo "verifying Docker installation"
sudo docker --version 1> /dev/null 2> /dev/stdout
echo "----------"
if [ $? -ne 0 ]; then
  echo "Docker OK"
  echo "Docker is installed"
else
  echo "Installing Docker"
  sudo yum update -y
  sudo amazon-linux-extras install docker -y
  sudo service docker start
  sudo systemctl enable docker
  sudo usermod -a -G docker ec2-user
  echo "----------"
  sudo docker --version
  echo "----------"
  echo "Above appears docker version?"
  sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  sudo docker-compose --version
  echo "----------"
fi

