#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="otel-demo"

echo "🔍 Verifying telemetry flow..."

echo "➡️ Collector pods:"
kubectl get pods -n "$NAMESPACE" | grep collector

echo
echo "➡️ Recent collector logs:"
kubectl logs -n "$NAMESPACE" deploy/otel-collector --tail=20

echo
echo "➡️ Checking services:"
kubectl get svc -n "$NAMESPACE"

echo
echo "✅ Verification complete"
echo "Now check Honeycomb UI for traces, metrics, and logs."
