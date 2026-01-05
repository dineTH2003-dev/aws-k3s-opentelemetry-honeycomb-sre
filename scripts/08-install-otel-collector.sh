#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="otel-demo"

echo "📡 Installing OpenTelemetry Collector..."

helm repo add otel https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update

helm upgrade --install otel-collector otel/opentelemetry-collector \
  -n "$NAMESPACE" \
  -f values/otel-collector-honeycomb.yaml

kubectl rollout status deploy/otel-collector -n "$NAMESPACE"

echo "✅ OpenTelemetry Collector installed"
