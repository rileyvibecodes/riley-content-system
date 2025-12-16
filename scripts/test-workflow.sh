#!/bin/bash

# Riley Content System - Workflow Test Script
# This script tests the n8n workflow with a sample topic

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "========================================"
echo "Riley Content System - Workflow Test"
echo "========================================"
echo ""

# Check if n8n is running
if ! docker ps | grep -q "riley-content-n8n"; then
    echo "ERROR: n8n is not running."
    echo "Start it with: ./scripts/setup-n8n.sh"
    exit 1
fi

# Check if jq is installed for JSON parsing
if ! command -v jq &> /dev/null; then
    echo "WARNING: jq is not installed. Install it for better output formatting."
    echo "On Mac: brew install jq"
fi

echo "Testing workflow with sample topic..."
echo ""

# Create test input
TEST_INPUT=$(cat << 'EOF'
{
  "topic_ideas": [
    "Why case studies don't close deals anymore",
    "The Install-First model for agencies",
    "How to price without competing on cost"
  ],
  "selected_topic": "Why case studies don't close deals anymore",
  "format": "Methodology Deep Dive",
  "hook_angle": "Case studies create skepticism, not trust. Here's what actually closes deals.",
  "week_start_date": "2024-01-15"
}
EOF
)

echo "Test Input:"
echo "$TEST_INPUT" | jq . 2>/dev/null || echo "$TEST_INPUT"
echo ""

# Create test output directory
TEST_DATE="2024-01-15"
TEST_OUTPUT_DIR="$PROJECT_ROOT/outputs/weekly/$TEST_DATE"
mkdir -p "$TEST_OUTPUT_DIR"

echo "Output will be saved to: $TEST_OUTPUT_DIR"
echo ""

# Instructions for manual test
echo "========================================"
echo "Manual Test Instructions"
echo "========================================"
echo ""
echo "1. Open n8n at http://localhost:5678"
echo "2. Import the workflow from: n8n/workflows/main-content-workflow.json"
echo "3. Update the 'Input Configuration' node with the test input above"
echo "4. Click 'Execute Workflow'"
echo "5. Monitor each node for successful execution"
echo ""
echo "Expected output files in $TEST_OUTPUT_DIR:"
echo "  - field-guide.md"
echo "  - calendar.md"
echo "  - review-document.md"
echo ""

# Quick API test
echo "========================================"
echo "Quick API Connectivity Test"
echo "========================================"
echo ""

# Test Anthropic API (if key is set)
if [ -n "$ANTHROPIC_API_KEY" ]; then
    echo "Testing Anthropic API..."
    RESPONSE=$(curl -s -X POST https://api.anthropic.com/v1/messages \
        -H "x-api-key: $ANTHROPIC_API_KEY" \
        -H "anthropic-version: 2023-06-01" \
        -H "content-type: application/json" \
        -d '{"model": "claude-sonnet-4-20250514", "max_tokens": 10, "messages": [{"role": "user", "content": "Say OK"}]}' \
        2>/dev/null)
    
    if echo "$RESPONSE" | grep -q "error"; then
        echo "  ❌ Anthropic API: Error - $RESPONSE"
    else
        echo "  ✅ Anthropic API: Connected"
    fi
else
    echo "  ⚠️  Anthropic API: ANTHROPIC_API_KEY not set in environment"
fi

echo ""
echo "========================================"
echo "Test Setup Complete"
echo "========================================"

