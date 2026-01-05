#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="otel-demo"

echo "🚀 Deploying OpenTelemetry Demo..."

kubectl create namespace "$NAMESPACE" || true

helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update

helm install otel-demo open-telemetry/opentelemetry-demo \
  -n "$NAMESPACE"

kubectl rollout status deploy/frontend -n "$NAMESPACE"

echo "✅ OpenTelemetry Demo deployed"
