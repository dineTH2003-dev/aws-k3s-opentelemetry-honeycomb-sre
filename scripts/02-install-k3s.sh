#!/usr/bin/env bash
set -euo pipefail

echo "☸️ Installing k3s..."

curl -sfL https://get.k3s.io | sh -

# Configure kubeconfig access
mkdir -p "$HOME/.kube"
sudo cp /etc/rancher/k3s/k3s.yaml "$HOME/.kube/config"
sudo chown "$(id -u):$(id -g)" "$HOME/.kube/config"

# Verify
kubectl get nodes

echo "✅ k3s installed successfully"
