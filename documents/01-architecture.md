# Observability Architecture

```
+----------------------------+
|        End User            |
|  (Browser / Client)        |
+-------------+--------------+
              |
              | HTTP (NodePort)
              v
+-------------+--------------+
|  frontend-proxy Service    |
|  (Kubernetes NodePort)     |
+-------------+--------------+
              |
              v
+-----------------------------------------------+
|        OpenTelemetry Demo Microservices        |
|                                               |
| frontend → checkout → payment → database      |
| ad, cart, recommendation, shipping, etc.      |
|                                               |
| Each service emits:                            |
|  - Traces                                     |
|  - Metrics                                    |
|  - Logs                                       |
+----------------------+------------------------+
                       |
                       | OTLP (gRPC / HTTP)
                       v
+--------------------------------------------------+
|        OpenTelemetry Collector (Single)           |
|                                                  |
| Receivers:                                       |
|  - otlp (4317 / 4318)                             |
|                                                  |
| Processors:                                      |
|  - batch                                         |
|  - memory_limiter                                |
|  - k8sattributes                                 |
|  - resource                                      |
|                                                  |
| Exporters:                                       |
|  - otlphttp → Honeycomb                          |
|                                                  |
| Security:                                        |
|  - API key only stored here                      |
+----------------------+---------------------------+
                       |
                       | HTTPS (443)
                       v
+--------------------------------------------------+
|                Honeycomb                          |
|                                                  |
|  - Traces (service map, latency, errors)         |
|  - Metrics (RED metrics, span metrics)            |
|  - Logs (structured, trace-correlated)           |
+--------------------------------------------------+

```

## Core Design Principles

This architecture follows production SRE best practices:

- **Single collector** – avoids data duplication and complexity
- **Secure export** – HTTPS-only, encrypted credentials
- **Centralized control** – single point for auth and pipelines
- **No demo-only backends** – Prometheus/OpenSearch disabled
- **Vendor-neutral** – OpenTelemetry standard instrumentation
