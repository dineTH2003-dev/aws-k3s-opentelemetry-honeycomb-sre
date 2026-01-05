# Troubleshooting

## Problem: EC2 instance not powerful enough
Cause: Initial EC2 instance had insufficient CPU, memory, and disk for OpenTelemetry Demo (Kafka, databases, collector, UI).
Fix: Recreated the environment using a larger instance (t3.large, 4 vCPU, 8 GB RAM, 30 GB storage).

## Problem: No data in Honeycomb
Cause: Demo exporters (Prometheus, OpenSearch, Jaeger exporters) were still enabled, so data was not sent externally.
Fix: Removed demo-only exporters and configured a single OpenTelemetry Collector to export via OTLP/HTTP to Honeycomb.

## Problem: Multiple OpenTelemetry Collectors
Cause: Demo chart deployed its own collector while an additional collector was installed manually.
Fix: Removed extra collectors and kept one central collector for the entire cluster.

## Problem: Helm schema validation errors
Cause: Invalid or unsupported keys in values.yaml due to strict Helm chart schema.
Fix: Used collector-specific Helm chart and applied only supported configuration fields.

## Problem: NodePort changes on restart
Cause: Kubernetes NodePort was dynamically assigned.
Fix: Manually set a fixed NodePort and updated AWS Security Group to allow inbound traffic on that port.

## Problem: UI not accessible from browser
Cause: Frontend service was exposed as ClusterIP.
Fix: Changed service type to NodePort and configured AWS Security Group rules.
