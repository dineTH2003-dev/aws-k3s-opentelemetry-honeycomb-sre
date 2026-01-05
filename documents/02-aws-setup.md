# AWS EC2 Setup

## 1. Create EC2 Instance

- **OS:** Ubuntu 22.04 LTS
- **Instance Type:** t3.large
- **Storage:** 30 GB
- **Key Pair:** Create new key pair (PEM)

## 2. Security Group Rules

### Inbound

- SSH (22) → Your IP
- NodePort Range (30000–32767) → 0.0.0.0/0

### Outbound

- HTTPS (443) → 0.0.0.0/0 (Honeycomb ingestion)

## Reason

OTLP traffic to Honeycomb uses HTTPS over port 443.
