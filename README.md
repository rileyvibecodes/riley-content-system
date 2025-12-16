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

1. **Load Learning Data** - Check patterns, voice evolution, recent content
2. **Topic Discovery** - Discuss what you want to write about
3. **Research** - Extract angles, examples, and counterintuitive takes
4. **Field Guide** - Write or polish your main breakdown
5. **Content Extraction** - Parse the field guide into structured content
6. **Content Generation** - Generate tweets, threads, LinkedIn posts
7. **Calendar** - Build your weekly schedule
8. **Review** - Create approval document
9. **Learn** - Log edits and extract patterns

## Self-Learning System

The system learns from every edit you make:

- **Edit Tracking** - Every change you make is logged with before/after
- **Pattern Extraction** - Rules are extracted from your corrections
- **Voice Evolution** - Your voice patterns are tracked over time
- **Repetition Prevention** - Recent content is indexed to avoid overlap

### Direct Learning Commands

You can teach the system directly:
- "Learn this: [rule]" - Adds a high-confidence pattern
- "Never do: [thing]" - Adds to avoided phrases
- "Always do: [thing]" - Adds to preferred patterns
- "Remember: [insight]" - Logs for voice evolution

Learning data is stored in `/learning/` and persists across sessions.

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
│       ├── voice-check.md       # Voice consistency
│       └── learning.md          # Self-learning system
├── learning/               # Self-learning data (persists across sessions)
│   ├── patterns.json            # Learned rules from edits
│   ├── voice-evolution.json     # Voice patterns over time
│   ├── content-index.json       # All content (prevents repetition)
│   ├── edit-log.json            # Full edit history
│   ├── session-logs/            # Per-session logs
│   └── edit-history/            # Detailed edit history
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
