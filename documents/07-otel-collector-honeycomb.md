# OpenTelemetry Collector with Honeycomb

## Design Decisions

- Single collector
- No Prometheus/OpenSearch exporters
- Centralized auth

## Honeycomb API Key

Stored as Kubernetes Secret:

```bash
scripts/07-create-honeycomb-secret.sh
```

## Export Method

- OTLP over HTTPS
- Port 443
