#!/bin/bash

# Riley Content System - Stop n8n Script

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
N8N_DIR="$PROJECT_ROOT/n8n"

cd "$N8N_DIR"

echo "Stopping n8n..."
docker-compose down

echo "n8n stopped."

