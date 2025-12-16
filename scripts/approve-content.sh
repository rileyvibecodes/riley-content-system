#!/bin/bash

# Riley Content System - Approve Content Script
# Triggers the approval workflow to schedule content

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Default values
WEEK_DATE="${1:-$(date -d "next monday" +%Y-%m-%d 2>/dev/null || date -v+monday +%Y-%m-%d)}"
STATUS="${2:-approved}"
N8N_URL="${N8N_URL:-http://localhost:5678}"

echo "========================================"
echo "Riley Content System - Approve Content"
echo "========================================"
echo ""
echo "Week Date: $WEEK_DATE"
echo "Status: $STATUS"
echo "n8n URL: $N8N_URL"
echo ""

# Check if week folder exists
WEEK_DIR="$PROJECT_ROOT/outputs/weekly/$WEEK_DATE"
if [ ! -d "$WEEK_DIR" ]; then
    echo "ERROR: No content found for week $WEEK_DATE"
    echo "Expected directory: $WEEK_DIR"
    exit 1
fi

# Check for required files
if [ ! -f "$WEEK_DIR/calendar.md" ]; then
    echo "ERROR: calendar.md not found in $WEEK_DIR"
    exit 1
fi

if [ ! -f "$WEEK_DIR/review-document.md" ]; then
    echo "ERROR: review-document.md not found in $WEEK_DIR"
    exit 1
fi

echo "✅ Content files found"
echo ""

# Show content summary
echo "Content Summary:"
echo "  - Field Guide: $(wc -w < "$WEEK_DIR/field-guide.md" 2>/dev/null || echo "N/A") words"
echo "  - Calendar: $(wc -l < "$WEEK_DIR/calendar.md") lines"
echo "  - Review Doc: $(wc -l < "$WEEK_DIR/review-document.md") lines"
echo ""

if [ "$STATUS" = "approved" ]; then
    echo "Sending approval to n8n..."
    
    # Send approval webhook
    RESPONSE=$(curl -s -X POST "$N8N_URL/webhook/content-approval" \
        -H "Content-Type: application/json" \
        -d "{
            \"week_date\": \"$WEEK_DATE\",
            \"status\": \"approved\"
        }")
    
    echo ""
    echo "Response: $RESPONSE"
    echo ""
    echo "✅ Content approved and sent for scheduling!"
else
    echo "Sending edit request to n8n..."
    
    # Prompt for edits
    echo "Enter edit requests (one per line, empty line to finish):"
    EDITS=()
    while IFS= read -r line; do
        [ -z "$line" ] && break
        EDITS+=("$line")
    done
    
    # Convert to JSON array
    EDITS_JSON=$(printf '%s\n' "${EDITS[@]}" | jq -R . | jq -s .)
    
    RESPONSE=$(curl -s -X POST "$N8N_URL/webhook/content-approval" \
        -H "Content-Type: application/json" \
        -d "{
            \"week_date\": \"$WEEK_DATE\",
            \"status\": \"needs_edits\",
            \"edits\": $EDITS_JSON
        }")
    
    echo ""
    echo "Response: $RESPONSE"
    echo ""
    echo "📝 Edit request sent!"
fi

echo ""
echo "Done!"

