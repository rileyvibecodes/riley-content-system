#!/bin/bash

# Riley Content System - Content Generation Script
# =================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Configuration
N8N_HOST="${N8N_HOST:-http://localhost:5678}"
WEBHOOK_PATH="webhook/generate-content"

echo "=============================================="
echo "  Riley Content System - Generate Content"
echo "=============================================="
echo ""

# Check if n8n is running
if ! curl -s "${N8N_HOST}/healthz" > /dev/null 2>&1; then
    echo "ERROR: n8n is not running."
    echo "Start it with: ./scripts/setup-n8n.sh"
    exit 1
fi

# Interactive mode - collect topic ideas
echo "Enter your topic ideas (one per line, empty line to finish):"
echo ""

TOPICS=""
while IFS= read -r line; do
    [ -z "$line" ] && break
    if [ -z "$TOPICS" ]; then
        TOPICS="$line"
    else
        TOPICS="$TOPICS\n$line"
    fi
done

if [ -z "$TOPICS" ]; then
    echo ""
    echo "No topics provided. Using example topics..."
    TOPICS="How to validate an offer before building\nWhy most offers fail (and how to fix yours)\nThe hidden psychology behind high-converting offers"
fi

echo ""
echo "Enter your raw thoughts/ideas for this week's content (optional):"
echo "(Press Enter twice to skip or finish)"
echo ""

RAW_THOUGHTS=""
EMPTY_COUNT=0
while IFS= read -r line; do
    if [ -z "$line" ]; then
        EMPTY_COUNT=$((EMPTY_COUNT + 1))
        if [ $EMPTY_COUNT -ge 1 ]; then
            break
        fi
    else
        EMPTY_COUNT=0
        if [ -z "$RAW_THOUGHTS" ]; then
            RAW_THOUGHTS="$line"
        else
            RAW_THOUGHTS="$RAW_THOUGHTS\n$line"
        fi
    fi
done

echo ""
echo "=============================================="
echo "  Generating Content..."
echo "=============================================="
echo ""

# Create payload
PAYLOAD=$(cat <<EOF
{
  "topics": "$(echo -e "$TOPICS" | sed 's/"/\\"/g')",
  "raw_thoughts": "$(echo -e "$RAW_THOUGHTS" | sed 's/"/\\"/g')",
  "timestamp": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "week_of": "$(date +"%Y-%m-%d")"
}
EOF
)

echo "Triggering content workflow..."
echo ""

# Trigger the workflow
RESPONSE=$(curl -s -X POST "${N8N_HOST}/${WEBHOOK_PATH}" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD" 2>&1)

if [ $? -eq 0 ]; then
    echo "Workflow triggered successfully!"
    echo ""
    echo "Response: $RESPONSE"
    echo ""
    echo "=============================================="
    echo "  Content generation started!"
    echo "=============================================="
    echo ""
    echo "  Check n8n for workflow progress:"
    echo "  ${N8N_HOST}"
    echo ""
    echo "  Output will be saved to:"
    echo "  - output/field-guides/"
    echo "  - output/tweets/"
    echo "  - output/threads/"
    echo "  - output/linkedin/"
    echo "  - output/calendars/"
    echo ""
else
    echo "ERROR: Failed to trigger workflow."
    echo "Response: $RESPONSE"
    echo ""
    echo "Make sure:"
    echo "  1. n8n is running (./scripts/setup-n8n.sh)"
    echo "  2. The workflow is imported and active"
    echo "  3. Anthropic credential is configured in n8n"
    exit 1
fi
