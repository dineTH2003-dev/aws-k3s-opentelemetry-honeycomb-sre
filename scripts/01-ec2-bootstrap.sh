#!/usr/bin/env bash
set -euo pipefail

echo "🔧 EC2 bootstrap started..."

# Update system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install base utilities
sudo apt-get install -y \
  curl \
  wget \
  git \
  ca-certificates \
  gnupg \
  lsb-release \
  apt-transport-https \
  unzip

# Disable swap (required for Kubernetes)
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab

echo "✅ EC2 bootstrap completed"
