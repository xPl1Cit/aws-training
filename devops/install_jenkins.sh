#!/bin/bash

set -e

echo "Updating system..."
sudo dnf update -y

echo "Installing Java 17..."
sudo dnf install -y java-17-amazon-corretto

echo "Installing Docker..."
sudo dnf install -y docker

echo "Starting and enabling Docker..."
sudo systemctl enable --now docker

echo "Adding users to the docker group..."
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins 2>/dev/null || echo "Jenkins user not yet created — will add later."

echo "Adding Jenkins repo and key..."
sudo curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "Installing Jenkins..."
sudo dnf install -y jenkins

echo "Adding jenkins to docker group now..."
sudo usermod -aG docker jenkins

echo "Enabling and starting Jenkins..."
sudo systemctl enable --now jenkins

echo "Jenkins is installed and running!"
echo "Initial Jenkins Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "NOTE: You should reboot the instance for group changes to take full effect!"
