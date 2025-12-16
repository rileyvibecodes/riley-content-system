#!/bin/bash

# Riley Content System - n8n Setup Script
# ========================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=============================================="
echo "  Riley Content System - n8n Setup"
echo "=============================================="
echo ""

# Check for Docker
if ! command -v docker &> /dev/null; then
    echo "ERROR: Docker is not installed."
    echo "Please install Docker Desktop from https://docker.com"
    exit 1
fi

# Check if Docker is running
if ! docker info &> /dev/null; then
    echo "ERROR: Docker is not running."
    echo "Please start Docker Desktop and try again."
    exit 1
fi

echo "[1/5] Checking environment configuration..."

# Check for .env file
if [ ! -f "$PROJECT_DIR/n8n/.env" ]; then
    echo "Creating n8n/.env from template..."
    cp "$PROJECT_DIR/.env.example" "$PROJECT_DIR/n8n/.env"
    echo ""
    echo "IMPORTANT: Edit n8n/.env and add your Anthropic API key:"
    echo "  ANTHROPIC_API_KEY=sk-ant-api03-your-key-here"
    echo ""
fi

# Check for Anthropic API key
if grep -q "your-key-here" "$PROJECT_DIR/n8n/.env" 2>/dev/null; then
    echo ""
    echo "WARNING: Anthropic API key not configured!"
    echo "Please edit n8n/.env and add your API key."
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo "[2/5] Creating required directories..."
mkdir -p "$PROJECT_DIR/n8n/workflows"
mkdir -p "$PROJECT_DIR/output"/{field-guides,tweets,threads,linkedin,calendars}
mkdir -p "$PROJECT_DIR/knowledge-base"

echo "[3/5] Starting n8n with Docker Compose..."
cd "$PROJECT_DIR"
docker compose up -d

echo "[4/5] Waiting for n8n to start..."
sleep 5

# Wait for n8n to be healthy
MAX_RETRIES=30
RETRY_COUNT=0
while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
    if curl -s http://localhost:5678/healthz > /dev/null 2>&1; then
        break
    fi
    echo "  Waiting for n8n to be ready... ($RETRY_COUNT/$MAX_RETRIES)"
    sleep 2
    RETRY_COUNT=$((RETRY_COUNT + 1))
done

if [ $RETRY_COUNT -eq $MAX_RETRIES ]; then
    echo "WARNING: n8n may not be fully ready yet. Check docker logs."
fi

echo "[5/5] Setup complete!"
echo ""
echo "=============================================="
echo "  n8n is running!"
echo "=============================================="
echo ""
echo "  Access n8n at: http://localhost:5678"
echo ""
echo "  Next steps:"
echo "  1. Open http://localhost:5678 in your browser"
echo "  2. Create an account (first time only)"
echo "  3. Go to Settings > Credentials"
echo "  4. Add 'Anthropic' credential with your API key"
echo "  5. Import workflow: n8n/workflows/main-content-workflow.json"
echo ""
echo "  To generate content:"
echo "    ./scripts/generate-content.sh"
echo ""
echo "  To stop n8n:"
echo "    docker compose down"
echo ""
echo "  To view logs:"
echo "    docker compose logs -f"
echo ""
