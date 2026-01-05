# Honeycomb MCP (Model Context Protocol)

This is extremely advanced – very few students do this.

## What is MCP?

Allows querying observability data using natural language inside IDEs.

## Setup in VS Code

1. Open VS Code
2. Install:
   - GitHub Copilot Chat
3. Configure MCP:

**settings.json:**

```json
{
  "mcp.servers": {
    "honeycomb": {
      "type": "http",
      "url": "https://mcp.honeycomb.io/mcp"
    }
  }
}
```

## Example Queries

- "Show slowest services in last 15 minutes"
- "Why is checkout latency increasing?"
- "List traces with errors"

## Why This Matters

- Faster root cause analysis
- AI-assisted SRE workflows
- Modern production observability
