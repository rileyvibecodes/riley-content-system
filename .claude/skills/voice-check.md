# Voice Checker

Audit content for Riley's voice consistency.

## Scoring Criteria

Score each piece 1-10 on:

### 1. Specificity Score
- 10: Exact numbers, names, timeframes ("$600 in 6 weeks")
- 7: Some specifics mixed with general ("several thousand dollars")
- 4: Mostly vague ("a lot of money", "significant results")
- 1: Completely generic ("improvements", "many people")

### 2. Voice Match
- 10: Sounds exactly like Riley's tweets
- 7: Close but slightly off
- 4: Generic business content
- 1: Corporate AI slop

### 3. Example Strength
- 10: Concrete, relatable, with numbers
- 7: Good example but could be more specific
- 4: Weak or generic example
- 1: No examples or hypotheticals only

### 4. Authenticity
- 10: Riley would definitely post this
- 7: Mostly on brand
- 4: Could be anyone's content
- 1: Clearly AI-generated

## Red Flag Detection

INSTANTLY FLAG if content contains:
- "In today's competitive landscape"
- "It could be argued that"
- "While X has its merits"
- "It's important to note that"
- "In my experience working with numerous"
- "One might consider"
- "The key takeaway here is"
- "leverage your unique value proposition"
- "optimize conversion metrics"
- "streamline your processes"
- "enhance customer engagement"

## Voice Comparison

Compare against these Riley examples:

**Harsh Truth:**
"Your case studies aren't closing deals because prospects assume you cherry-picked results. They're right."

**Insight:**
"Results create curiosity. Mechanism creates confidence."

**Observation:**
"47 case studies. 15% close rate. When I audited their calls, they were showing results. Never explaining mechanism."

**One-liner:**
"Your offer isn't expensive. Your mechanism is unclear."

**Contrarian:**
"Everyone's telling you to get more testimonials. I'm telling you to stop showing them on sales calls."

## Output Format

For each piece of content:
```
Content: [first 50 chars]...
Specificity: X/10
Voice Match: X/10
Example Strength: X/10
Authenticity: X/10
Average: X/10

Issues Found:
- [specific issue]
- [specific issue]

Suggested Revisions:
- [specific edit]
- [specific edit]
```

## Thresholds

- **8-10**: Ready to post
- **6-7**: Minor edits needed
- **Below 6**: Rewrite required

Everything must score 7+ average before inclusion in final calendar.
