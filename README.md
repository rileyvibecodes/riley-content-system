# Riley's Content System

Claude Code-native content generation system. Just say "go" and start creating.

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

1. Open this folder in Claude Code
2. Say "go" or "let's write content"
3. Follow the conversation

That's it. No setup, no commands to remember, no webhooks to trigger.

## How It Works

The system uses Claude Code skills to guide the content creation workflow:

1. **Topic Discovery** - Discuss what you want to write about
2. **Research** - Extract angles, examples, and counterintuitive takes
3. **Field Guide** - Write or polish your main breakdown
4. **Content Extraction** - Parse the field guide into structured content
5. **Content Generation** - Generate tweets, threads, LinkedIn posts
6. **Calendar** - Build your weekly schedule
7. **Review** - Create approval document

## Directory Structure

```
riley-content-system/
├── CLAUDE.md               # Project brain (voice, workflow, instructions)
├── .claude/
│   └── skills/             # Content creation skills
│       ├── content-session.md   # Main orchestrator
│       ├── field-guide.md       # Field guide writing
│       ├── tweet-generator.md   # Tweet generation
│       ├── thread-generator.md  # Thread creation
│       ├── linkedin-posts.md    # LinkedIn content
│       ├── content-calendar.md  # Weekly scheduling
│       └── voice-check.md       # Voice consistency
├── prompts/                # Detailed phase prompts (reference)
├── config/
│   ├── voice-profile.json       # Voice characteristics
│   ├── content-pillars.json     # Content pillar definitions
│   ├── scheduling-rules.json    # Posting schedule
│   └── learning-config.json     # Self-learning config
├── knowledge-base/
│   ├── business-brain-dump.txt  # Ideas and philosophy
│   ├── master-positioning.md    # Brand positioning
│   ├── swipe-file/              # Best tweets for voice matching
│   └── previous-field-guides/   # Examples
└── outputs/
    └── weekly/                  # Generated content by week
```

## Content Pillars

Weekly distribution:

- **Offer Mechanics (25%)** - Technical insights about offers
- **Harsh Marketing Truths (25%)** - Direct, uncomfortable observations
- **Direct Response Insights (20%)** - Tactical DR content
- **Personal Observations (15%)** - Personal takes and lessons
- **AI & Automation (10%)** - AI and systems content
- **Meta-Marketing (5%)** - Industry commentary

## Voice Profile

Riley's voice is:
- Direct, no-BS, mechanistic
- Specific over general ("$600" not "a lot of money")
- Uses concrete examples with numbers
- Conversational but authoritative
- Self-aware, occasionally self-deprecating
- Contrarian when warranted

See `config/voice-profile.json` for full details.

## Common Workflows

### Full Week Content Session
Just say: "Go" or "Let's create content for the week"

### Write a Field Guide
Say: "Help me write a field guide about [topic]"

### Generate Tweets Only
Say: "Generate tweets from this field guide" and paste/share the guide

### Voice Check
Say: "Check this content for voice" and share what you want reviewed

### Build Calendar
Say: "Build the content calendar for this week"

## Outputs

Generated content is saved to `/outputs/weekly/YYYY-MM-DD/`:
- `field-guide.md` - Main breakdown
- `tweets.json` - All tweet ideas with scores
- `thread.md` - Monday thread
- `linkedin-posts.md` - LinkedIn content
- `calendar.md` - Weekly schedule
- `review.md` - Approval document

## Customization

### Update Voice
Edit `config/voice-profile.json` to adjust:
- Tone markers
- Sentence patterns
- Vocabulary preferences
- Red flags to avoid

### Change Content Mix
Edit `config/content-pillars.json` to adjust:
- Pillar percentages
- Topic examples
- Tweet formats

### Add Knowledge
Add files to `knowledge-base/` for reference during content creation.

## Voice Checklist

Before publishing, content must:
- [ ] Use specific numbers, not vague quantities
- [ ] Include real examples with details
- [ ] Sound conversational, not corporate
- [ ] Avoid AI-speak ("Let's dive in", "game-changer")
- [ ] Have a clear, punchy opening
- [ ] End with insight, not summary

---

Built for Riley's WBYO Content System. Powered by Claude Code.
