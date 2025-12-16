# Self-Learning System

This system learns from every content session to continuously improve voice accuracy and content quality.

## Learning Data Files

All learning data lives in `/learning/`:

- `edit-log.json` - Every edit Riley makes (before/after pairs)
- `voice-evolution.json` - Voice patterns tracked over time
- `content-index.json` - All content created (prevents repetition)
- `patterns.json` - Learned rules from Riley's corrections
- `session-logs/` - Detailed logs from each session
- `edit-history/` - Full edit history by date

## At Session Start

ALWAYS read these files first:
1. `/learning/patterns.json` - Apply learned rules
2. `/learning/voice-evolution.json` - Use current voice patterns
3. `/learning/content-index.json` - Check recent topics to avoid repetition

## During Content Creation

### Track Every Edit

When Riley makes ANY change to generated content, log it:

```json
{
  "timestamp": "2024-01-15T14:30:00Z",
  "content_type": "tweet|field_guide|thread|linkedin",
  "edit_type": "voice|specificity|structure|tone|deletion|addition",
  "before": "original text",
  "after": "Riley's edited text",
  "context": "what prompted the edit",
  "pattern_extracted": "rule learned from this edit"
}
```

### Categorize Edits

**Voice Corrections** - When AI sounds too generic/corporate
- Before: "Many businesses struggle with this problem"
- After: "47 agencies I've audited had this exact issue"
- Pattern: Replace "many/most/some" with specific numbers

**Specificity Upgrades** - When Riley adds concrete details
- Before: "This increased their revenue significantly"
- After: "This took them from $12k to $47k MRR in 6 weeks"
- Pattern: Always include specific numbers and timeframes

**Structure Changes** - How Riley reorganizes content
- Log the structural pattern preferred

**Tone Adjustments** - Harder or softer than generated
- Track which direction Riley typically adjusts

**Deletions** - What Riley consistently removes
- "It's important to note that..." → deleted
- Pattern: Never use this phrase

**Additions** - What Riley consistently adds
- Adding "That's the game." as closer
- Pattern: Use this closing more often

## After Each Piece of Content

Update `/learning/content-index.json`:
```json
{
  "id": "tweet-2024-01-15-001",
  "type": "tweet",
  "topic": "offer mechanics",
  "pillar": "offer_mechanics",
  "text": "full text of the content",
  "date": "2024-01-15",
  "was_edited": true,
  "edit_count": 2
}
```

## At Session End

### 1. Save Session Log

Create `/learning/session-logs/YYYY-MM-DD-HH-MM.json`:
```json
{
  "date": "2024-01-15",
  "duration_estimate": "45 minutes",
  "topic": "offer validation",
  "content_created": {
    "field_guide": 1,
    "tweets": 21,
    "thread": 1,
    "linkedin": 2
  },
  "edits_made": 15,
  "patterns_learned": [
    "Always use 'mechanism' not 'process'",
    "End tweets with period, not exclamation"
  ],
  "voice_drift_notes": "Riley pushed for more specificity this session"
}
```

### 2. Extract New Patterns

Analyze all edits from the session:
- What words did Riley consistently change?
- What phrases did Riley delete?
- What structure changes were made?
- What was the direction of tone adjustments?

Add to `/learning/patterns.json`:
```json
{
  "rule": "Never use 'utilize' - always use 'use'",
  "source": "3 corrections in session 2024-01-15",
  "confidence": "high",
  "date_learned": "2024-01-15"
}
```

### 3. Update Voice Evolution

Weekly, update `/learning/voice-evolution.json`:
```json
{
  "week": "2024-W03",
  "edits_analyzed": 47,
  "patterns_reinforced": ["specificity", "no-exclamations"],
  "new_patterns": ["more contrarian hooks"],
  "voice_score_trend": "improving",
  "notes": "Riley's voice getting more direct"
}
```

## Applying Learned Patterns

When generating ANY content, first check:

1. **Avoided phrases** - Never use these
2. **Preferred phrases** - Use these instead
3. **Specificity rules** - Apply learned number patterns
4. **Structure rules** - Follow learned structures
5. **Tone baseline** - Start at learned tone level
6. **Recent topics** - Don't repeat within 4 weeks

## Pattern Confidence Levels

- **High** (3+ corrections): Apply automatically
- **Medium** (2 corrections): Apply but mention
- **Low** (1 correction): Note but don't force

## Repetition Prevention

Before generating content, check `/learning/content-index.json`:
- Don't repeat exact topics within 4 weeks
- Don't reuse exact phrases from recent content
- Vary content pillar distribution based on recent history
- Flag if a topic is too similar to recent content

## Learning Prompts

Ask Riley at session end:
1. "Any content that felt off-voice I should learn from?"
2. "Anything you'd want me to do differently next time?"
3. "Should I note any patterns from today's edits?"

## Manual Learning Input

Riley can say things like:
- "Learn this: never start tweets with 'I'"
- "Add to patterns: always use '$X' format for money"
- "Remember: my audience hates exclamation points"

Log these directly to patterns.json with confidence: "high".

## Monthly Voice Report

Generate `/learning/voice-reports/YYYY-MM.md`:
- Total content created
- Edit rate trends (lower = better)
- Top patterns learned
- Voice drift analysis
- Recommendations for improvement
