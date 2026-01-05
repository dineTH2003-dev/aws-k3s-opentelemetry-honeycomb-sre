#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="otel-demo"

if [[ -z "${HONEYCOMB_API_KEY:-}" ]]; then
  echo "❌ Please export HONEYCOMB_API_KEY first"
  exit 1
fi

echo "🔐 Creating Honeycomb API key secret..."

kubectl create secret generic honeycomb-api-key \
  -n "$NAMESPACE" \
  --from-literal=HONEYCOMB_API_KEY="$HONEYCOMB_API_KEY" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "✅ Honeycomb secret created"
