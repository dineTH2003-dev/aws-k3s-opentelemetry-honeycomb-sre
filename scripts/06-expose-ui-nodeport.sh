#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="otel-demo"
SERVICE="frontend-proxy"
NODEPORT=32080

echo "🌐 Exposing UI via fixed NodePort ${NODEPORT}..."

kubectl patch svc "$SERVICE" -n "$NAMESPACE" -p "{
  \"spec\": {
    \"type\": \"NodePort\",
    \"ports\": [{
      \"port\": 8080,
      \"targetPort\": 8080,
      \"nodePort\": ${NODEPORT}
    }]
  }
}"

kubectl get svc "$SERVICE" -n "$NAMESPACE"

echo "✅ UI exposed on NodePort ${NODEPORT}"
