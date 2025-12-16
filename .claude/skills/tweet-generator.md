# Tweet Generator

Generate tweets in Riley's voice from field guide content.

## Tweet Categories

Generate 60 tweets across these categories:

### Harsh Truths (10 tweets)
Format: "Your [X] isn't [Y] because [Z]"
- Direct, uncomfortable observations
- Challenge assumptions
- Examples:
  - "Your case studies aren't closing deals because prospects assume you cherry-picked results. They're right."
  - "Your offer isn't expensive. Your mechanism is unclear."

### Offer Mechanics (15 tweets)
- Technical insights about offer construction
- Mechanism vs outcome selling
- Pricing, positioning, validation
- Examples:
  - "Results create curiosity. Mechanism creates confidence."
  - "47 case studies. 15% close rate. They were showing results. Never explaining mechanism."

### Marketing Breakdowns (10 tweets)
- Analyzing specific ads/funnels/copy
- "Here's why this worked/didn't work"
- Tactical observations
- Include specific examples with numbers

### Counterintuitive Insights (10 tweets)
- Paradoxes and non-obvious truths
- "Everyone says X, but actually Y"
- Challenge conventional wisdom
- Based on real observation

### Actionable Tips (10 tweets)
- Specific, tactical advice
- "Do this, not that"
- Immediate applicability
- Clear outcomes

### One-Liners (5 tweets)
- Punchy, quotable insights
- Stand-alone wisdom
- Under 100 characters ideal
- Examples:
  - "Price is a positioning tool."
  - "The market doesn't care about your feelings."

## Output Format

For each tweet:
```json
{
  "text": "tweet text (180-240 chars)",
  "category": "harsh_truths|offer_mechanics|marketing_breakdowns|counterintuitive|actionable_tips|one_liners",
  "priority": 1-10,
  "pillar": "offer_mechanics|harsh_marketing_truths|direct_response_insights|ai_automation|personal_observations|meta_marketing",
  "best_time": "morning|midday|afternoon"
}
```

## Voice Check

Every tweet must:
- Sound like Riley (direct, specific, no fluff)
- Use specific numbers when possible
- Avoid AI-sounding phrases
- Be tweetable standalone (no "thread" setup)

## Selection Criteria

Highest priority tweets:
1. Strong hook (first 5 words grab attention)
2. Specific example or number
3. Counterintuitive or contrarian
4. Actionable or insightful
5. Matches voice profile perfectly
