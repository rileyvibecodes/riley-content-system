#!/bin/bash

# Riley Content System - Export n8n Workflows Script
# Exports all workflows from n8n for version control

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
N8N_DIR="$PROJECT_ROOT/n8n"
WORKFLOWS_DIR="$N8N_DIR/workflows"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

echo "========================================"
echo "Exporting n8n Workflows"
echo "========================================"
echo ""

# Check if n8n is running
if ! docker ps | grep -q "riley-content-n8n"; then
    echo "ERROR: n8n is not running."
    echo "Start it with: ./scripts/setup-n8n.sh"
    exit 1
fi

# Create backup directory
BACKUP_DIR="$WORKFLOWS_DIR/backups/$TIMESTAMP"
mkdir -p "$BACKUP_DIR"

# Export workflows using n8n CLI
echo "Exporting workflows..."
docker exec riley-content-n8n n8n export:workflow --all --output=/home/node/.n8n/exports/

# Copy exports to local directory
docker cp riley-content-n8n:/home/node/.n8n/exports/. "$BACKUP_DIR/"

echo ""
echo "Workflows exported to: $BACKUP_DIR"
echo ""

# List exported files
echo "Exported files:"
ls -la "$BACKUP_DIR"

echo ""
echo "Done!"

