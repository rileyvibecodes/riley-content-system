# Riley's Content System

Automated weekly content generation system using n8n + Claude. Generates a full week of content from a single topic input.

## What It Produces

From one topic idea, the system generates:

| Content Type | Quantity | Platform |
|-------------|----------|----------|
| Field Guide | 1 (1,200-1,500 words) | Community/Newsletter |
| Individual Tweets | 21 (3/day) | Twitter/X |
| Thread | 1 (10-15 tweets) | Twitter/X (Monday 9am) |
| LinkedIn Posts | 2-3 | LinkedIn |
| Content Calendar | 1 | Internal |
| Review Document | 1 | Internal |

## Quick Start

### 1. Add your Anthropic API key

```bash
# Edit the .env file
nano n8n/.env

# Add your key:
ANTHROPIC_API_KEY=sk-ant-api03-your-actual-key-here
```

### 2. Start n8n

```bash
./scripts/setup-n8n.sh
```

### 3. Import the workflow

1. Open http://localhost:5678
2. Create an account (first time only)
3. Go to **Settings > Credentials**
4. Add an **Anthropic** credential with your API key
5. Go to **Workflows > Import**
6. Import `n8n/workflows/main-content-workflow.json`
7. **Activate** the workflow (toggle in top-right)

### 4. Generate your first week of content

```bash
./scripts/generate-content.sh
```

Or trigger via API:

```bash
curl -X POST http://localhost:5678/webhook/generate-content \
  -H "Content-Type: application/json" \
  -d '{
    "topics": "How to validate an offer before building",
    "raw_thoughts": "Most people build first, validate later. Thats backwards."
  }'
```

## Directory Structure

```
riley-content-system/
├── docker-compose.yml      # n8n Docker configuration
├── scripts/
│   ├── setup-n8n.sh        # Start n8n
│   └── generate-content.sh # Generate weekly content
├── n8n/
│   ├── .env                # API keys (create from .env.example)
│   └── workflows/
│       ├── main-content-workflow.json    # Main 9-node workflow
│       └── voice-checker-workflow.json   # Voice consistency checker
├── prompts/
│   └── voice-guide.md      # Voice characteristics reference
├── knowledge-base/
│   ├── README.md           # Knowledge base instructions
│   ├── Business.txt        # Your brain dump (replace with yours)
│   └── swipe-file/
│       └── best-tweets.md  # Best-performing tweets for voice matching
└── output/
    ├── field-guides/       # Generated field guides
    ├── tweets/             # Generated tweets
    ├── threads/            # Generated threads
    ├── linkedin/           # Generated LinkedIn posts
    └── calendars/          # Generated content calendars
```

## Workflow Phases

### Phase 1: Content Planning (Nodes 1-4)
1. **Topic Selection** - Score and select best topic
2. **Research & Ideas** - Generate counterintuitive angles, examples, objections
3. **Field Guide Outline** - Create structured outline
4. **Field Guide Writer** - Write 1,200-1,500 word breakdown

### Phase 2: Content Extraction (Node 5)
5. **Field Guide Parser** - Extract structured data (quotes, arcs, examples)

### Phase 3: Content Generation (Nodes 6A-6D) - Parallel
6A. **Tweet Generator** - 60 tweet ideas across 6 categories
6B. **Thread Hook Generator** - 7 thread hooks with outlines
6C. **LinkedIn Post Generator** - 3 professional posts
6D. **Deep Post Analyzer** - Identify strongest angles and spin-offs

### Phase 4: Prioritization (Node 7)
7. **Content Prioritizer** - Select top 21 tweets, 1 thread, 2-3 LinkedIn posts

### Phase 5: Calendar & Review (Nodes 8-9)
8. **Calendar Generator** - Build 7-day content calendar
9. **Review Document** - Complete approval document

### Bonus: Voice Checker
- Scores content on: Specificity, Voice Match, Example Strength, Authenticity
- Flags content scoring below 7/10 with specific revision suggestions

## Configuration

### Required
- **Anthropic API Key** - Get from https://console.anthropic.com/

### Optional (for auto-posting)
- Twitter API credentials
- LinkedIn access token
- Notion/Airtable API keys (for storage)

## Commands

```bash
# Start n8n
./scripts/setup-n8n.sh

# Stop n8n
docker compose down

# View logs
docker compose logs -f

# Generate content (interactive)
./scripts/generate-content.sh

# Check voice on content
curl -X POST http://localhost:5678/webhook/check-voice \
  -H "Content-Type: application/json" \
  -d '{"content": "Your tweet or content here"}'
```

## Customization

### Adding to Knowledge Base
1. Add files to `knowledge-base/`
2. Update the workflow prompts to reference new files

### Adjusting Voice
1. Edit `prompts/voice-guide.md`
2. Add more examples to `knowledge-base/swipe-file/best-tweets.md`
3. Update prompts in the n8n workflow

### Changing Content Mix
Edit Node 7 (Content Prioritizer) prompt to adjust:
- Content pillar distribution
- Tweet category mix
- Daily posting frequency

## Troubleshooting

### n8n won't start
```bash
# Check Docker is running
docker info

# Check for port conflicts
lsof -i :5678

# View container logs
docker compose logs n8n
```

### Workflow errors
1. Check n8n execution history for error details
2. Verify Anthropic credential is set correctly
3. Check API key has sufficient credits

### Content quality issues
1. Run the Voice Checker workflow on generated content
2. Update swipe file with more examples
3. Adjust temperature settings in workflow nodes

## Voice Checklist

Before publishing, ensure content:
- [ ] Uses specific numbers, not vague quantities
- [ ] Includes real examples with names/details
- [ ] Sounds conversational, not corporate
- [ ] Avoids AI-speak ("Let's dive in", "game-changer", etc.)
- [ ] Has a clear, punchy opening
- [ ] Ends with insight, not summary

---

Built for Riley's WBYO Content System.
