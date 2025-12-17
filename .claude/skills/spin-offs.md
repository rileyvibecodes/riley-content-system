# Spin-Off Generator

When content performs well, double down. This skill helps identify winners and create variations.

## When to Use

Automatically trigger when Riley mentions:
- "This tweet did well"
- "This post performed"
- "Got a lot of engagement on..."
- "This one blew up"
- Or shares performance metrics

## The Spin-Off Strategy

Dan Koe's approach: Identify winners → Create 3-5 variations → Repeat until exhausted.

### Step 1: Identify the Winner

When Riley shares a high-performing piece:

```json
{
  "original_content": "the winning post",
  "platform": "twitter|linkedin|thread",
  "performance": {
    "likes": 0,
    "retweets": 0,
    "comments": 0,
    "followers_gained": 0,
    "impressions": 0
  },
  "why_it_worked": "analysis of success factors"
}
```

Log to `/learning/winners.json` for future reference.

### Step 2: Analyze Why It Worked

Break down the winning content:

1. **Hook Analysis** - What made people stop scrolling?
2. **Structure** - How was it organized?
3. **Core Insight** - What was the actual idea?
4. **Emotional Trigger** - What feeling did it create?
5. **Specificity** - What concrete details made it land?
6. **Controversy/Contrast** - Did it challenge assumptions?

### Step 3: Generate Spin-Offs

Create 5 variations using these approaches:

#### 1. Format Variation
Same idea, different structure:
- Single tweet → Thread
- Thread → Single punchy tweet
- Statement → Question
- Advice → Story
- List → Narrative

#### 2. Angle Variation
Same topic, different perspective:
- Positive framing → Negative framing
- "Do this" → "Stop doing this"
- General → Specific niche
- Tactical → Philosophical
- Personal → Universal

#### 3. Depth Variation
- Surface insight → Deep dive
- One example → Multiple examples
- Theory → Case study
- Principle → Step-by-step

#### 4. Audience Variation
Same insight for different segments:
- Beginners vs Advanced
- Different industries/niches
- Different pain points

#### 5. Time Variation
- Past: "I used to think..."
- Present: "Right now..."
- Future: "In 6 months..."

### Step 4: Score and Prioritize

Rate each spin-off:
- **Differentiation** (1-10): How different from original?
- **Standalone Value** (1-10): Works without knowing original?
- **Voice Match** (1-10): Sounds like Riley?
- **Engagement Potential** (1-10): Likely to perform?

Prioritize spin-offs scoring 7+ average.

### Step 5: Schedule Strategically

Don't post all spin-offs at once:
- Space 3-7 days apart
- Test different times
- Track which variation performs best
- Create spin-offs of the spin-off if it wins

## Output Format

```markdown
## Spin-Off Analysis: [Original Post Title]

### Original Content
[The winning post]

### Why It Worked
- Hook: [analysis]
- Structure: [analysis]
- Core Insight: [analysis]
- Emotional Trigger: [analysis]

### Spin-Off #1: [Format Variation]
**Type:** [format change]
**Content:** [full text]
**Differentiation:** X/10
**Best Time:** [morning/midday/afternoon]

### Spin-Off #2: [Angle Variation]
**Type:** [angle change]
**Content:** [full text]
**Differentiation:** X/10
**Best Time:** [morning/midday/afternoon]

[Continue for all 5 spin-offs]

### Posting Schedule
1. [Date/Time] - Spin-off #X
2. [Date/Time] - Spin-off #X
3. [Date/Time] - Spin-off #X
```

## Winner Archive

Maintain `/learning/winners.json`:

```json
{
  "winners": [
    {
      "id": "win-001",
      "date": "2024-01-15",
      "platform": "twitter",
      "original": "content text",
      "performance": {},
      "analysis": {},
      "spin_offs_created": 5,
      "spin_offs_that_performed": 2,
      "best_spin_off": "spin-off #3"
    }
  ]
}
```

## Learning Loop

After spin-offs are posted:
1. Track which variations performed
2. Identify patterns (which variation types work best?)
3. Update `/learning/patterns.json` with spin-off insights
4. Feed back into future spin-off generation

Example pattern learned:
```json
{
  "rule": "Angle variations outperform format variations for harsh truth content",
  "confidence": "medium",
  "source": "3 spin-off cycles analyzed"
}
```
