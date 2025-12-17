# Performance Feedback

Track what performs, feed insights back into the system.

## When to Use

Automatically trigger when Riley:
- Shares analytics or metrics
- Mentions performance ("this did well", "this flopped")
- Reviews past content
- Asks "what's working?"
- Provides engagement data

## The Feedback Loop

```
Create Content → Post → Track Performance → Analyze → Learn → Create Better Content
```

## Logging Performance

When Riley shares performance data, log to `/learning/performance.json`:

```json
{
  "entries": [
    {
      "id": "perf-001",
      "date": "2024-01-15",
      "content_id": "tweet-2024-01-15-003",
      "platform": "twitter",
      "content_type": "tweet",
      "content_text": "Your case studies aren't closing deals...",
      "pillar": "harsh_marketing_truths",
      "category": "harsh_truth",
      "metrics": {
        "impressions": 45000,
        "likes": 523,
        "retweets": 87,
        "comments": 34,
        "bookmarks": 156,
        "followers_gained": 23,
        "engagement_rate": 1.78
      },
      "performance_tier": "high",
      "posted_time": "9:00 AM",
      "posted_day": "Tuesday"
    }
  ]
}
```

## Performance Tiers

Classify content by performance:

| Tier | Engagement Rate | Action |
|------|-----------------|--------|
| **Viral** | 5%+ | Immediate spin-offs, deep analysis |
| **High** | 2-5% | Create spin-offs, note patterns |
| **Average** | 0.5-2% | No action needed |
| **Low** | <0.5% | Analyze what went wrong |
| **Flop** | <0.1% | Learn what to avoid |

## Pattern Analysis

After 10+ entries, analyze for patterns:

### What's Working

```markdown
## High Performers Analysis

### By Content Pillar
- Offer Mechanics: X% avg engagement
- Harsh Marketing Truths: X% avg engagement
- Direct Response: X% avg engagement
- [etc.]

### By Category
- Harsh truths: X% avg
- One-liners: X% avg
- Actionable tips: X% avg
- [etc.]

### By Posting Time
- 9am: X% avg
- 12pm: X% avg
- 3pm: X% avg

### By Day
- Monday: X% avg
- Tuesday: X% avg
- [etc.]

### Top Performing Elements
1. [Pattern]: Found in X of top 10 posts
2. [Pattern]: Found in X of top 10 posts
3. [Pattern]: Found in X of top 10 posts
```

### What's Not Working

```markdown
## Low Performers Analysis

### Common Elements in Flops
1. [Pattern]: Found in X of bottom 10 posts
2. [Pattern]: Found in X of bottom 10 posts

### Topics That Underperform
- [Topic]: Avg X% engagement
- [Topic]: Avg X% engagement

### Times/Days to Avoid
- [Time/Day]: Consistently low
```

## Feeding Back to Learning System

Update `/learning/patterns.json` with performance insights:

```json
{
  "rule": "Harsh truth tweets outperform actionable tips by 2x",
  "source": "performance_analysis",
  "confidence": "high",
  "data_points": 47,
  "date_learned": "2024-01-20"
}
```

Update `/learning/voice-evolution.json` with what resonates:

```json
{
  "week": "2024-W03",
  "top_performing_phrases": [
    "Your [X] isn't [Y] because [Z]",
    "Most people don't realize..."
  ],
  "underperforming_phrases": [
    "Here's a quick tip:",
    "Did you know..."
  ]
}
```

## Content Strategy Adjustments

Based on performance data, recommend adjustments:

### Pillar Distribution
```markdown
Current distribution:
- Offer Mechanics: 25%
- Harsh Truths: 25%
- DR Insights: 20%
- Personal: 15%
- AI: 10%
- Meta: 5%

Recommended (based on performance):
- Offer Mechanics: 30% (+5%) - highest engagement
- Harsh Truths: 30% (+5%) - second highest
- DR Insights: 15% (-5%) - average performance
- Personal: 15% (same)
- AI: 5% (-5%) - lower engagement
- Meta: 5% (same)
```

### Timing Optimization
```markdown
Current schedule:
- 9am, 12pm, 3pm daily

Recommended:
- Best performing: Tuesday 9am, Thursday 12pm
- Worst performing: Saturday 3pm, Sunday 2pm
- Consider: Double-posting on Tuesday
```

### Content Type Focus
```markdown
Double down on:
- Harsh truth format (2.3% avg)
- Counterintuitive insights (1.9% avg)

Reduce:
- Generic tips (0.6% avg)
- List posts (0.4% avg)
```

## Weekly Performance Review

Generate weekly report saved to `/outputs/performance-reports/YYYY-WXX.md`:

```markdown
# Week [X] Performance Report

## Overview
- Total posts: X
- Avg engagement: X%
- Followers gained: X
- Top performer: [post]
- Worst performer: [post]

## By Platform
### Twitter
- Posts: X
- Avg engagement: X%
- Best day: [day]
- Best time: [time]

### LinkedIn
- Posts: X
- Avg engagement: X%
- Best performer: [post]

## Patterns Identified
1. [Pattern from this week]
2. [Pattern from this week]

## Recommendations for Next Week
1. [Recommendation]
2. [Recommendation]
3. [Recommendation]

## Content to Spin Off
- [High performer 1] - Create 3 variations
- [High performer 2] - Create 3 variations
```

## Integration Points

### With Spin-Off Skill
- When content hits "High" tier → Trigger spin-off generation
- Track spin-off performance vs original

### With Learning System
- Update patterns.json with performance insights
- Update voice-evolution.json with what resonates
- Influence content-index.json (mark high performers)

### With Content Calendar
- Recommend timing based on historical performance
- Suggest pillar distribution adjustments
- Flag underperforming slots

### With Tweet Generator
- Weight categories by performance
- Prioritize formats that work
- Avoid patterns that flop

## Asking for Performance Data

When content is created but no performance data exists, periodically ask:

"How did last week's content perform? Any standout winners or flops I should learn from?"

Track which content still needs performance data in `/learning/pending-performance.json`.
