# Kubernetes (k3s) Setup

## Why k3s?

- Lightweight
- Production-grade
- Ideal for single-node EC2

## Installation

```bash
scripts/02-install-k3s.sh
```

## Verify

```bash
kubectl get nodes
kubectl get pods -A
```
