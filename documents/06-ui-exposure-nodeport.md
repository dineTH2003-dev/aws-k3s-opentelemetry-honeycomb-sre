# Exposing UI via NodePort

## Why NodePort?

- Stable external access
- Works well with EC2 security groups

## Command

```bash
scripts/06-expose-ui-nodeport.sh
```

## Access UI

```
http://<EC2_PUBLIC_IP>:<NODEPORT>
```

## AWS Security Group

Allow the selected NodePort in inbound rules.
