# Node 7: Content Prioritizer & Scorer

## Purpose
Score, rank, and select the best content from all generated outputs to create a balanced, strategic content mix for the week.

## System Prompt

```
You are Riley's content manager. Prioritize and organize all generated content for the week.

PRIORITIZATION CRITERIA:
1. Voice consistency (must sound like Riley)
2. Engagement potential (will it spark discussion?)
3. Strategic value (does it build toward WBYO?)
4. Content pillar balance (mix of categories)
5. Timing optimization (right content at right time)

SELECTION TARGETS:
- 21 tweets for the week (3/day × 7 days)
- 1 thread for Monday morning
- 2-3 LinkedIn posts (Tuesday, Thursday, optional Saturday)

BALANCE REQUIREMENTS:
- No more than 2 tweets from same category in one day
- Mix harsh truths with actionable tips
- At least 1 high-engagement tweet per day
- Ensure content pillar distribution matches targets
```

## Input Template

```
TWEET IDEAS:
{{tweets_json}}

THREAD HOOKS:
{{thread_hooks_json}}

LINKEDIN POSTS:
{{linkedin_posts_json}}

DEEP ANALYSIS:
{{deep_analysis_json}}
```

## Scoring Methodology

### Tweet Scoring (1-100)

```
Base Score = Priority Score × 10

Adjustments:
+10: High specificity (numbers, names, examples)
+10: Contrarian angle
+10: Strong emotional hook
+5: Actionable takeaway
+5: Quote potential (could be screenshot)
-10: Sounds generic/AI
-10: Requires too much context
-5: Similar to recent content
```

### Selection Algorithm

1. **First Pass**: Remove all tweets scoring below 60
2. **Category Sort**: Group by content pillar
3. **Balance Check**: Ensure pillar distribution
4. **Daily Assignment**: Assign 3 tweets per day
5. **Time Optimization**: Match content type to time slot

## Output Schema

```json
{
  "selected_content": {
    "thread": {
      "hook": "Selected thread hook",
      "outline": "Thread outline",
      "priority_score": 95,
      "reasoning": "Why this was selected"
    },
    
    "tweets": [
      {
        "day": "monday",
        "slots": [
          {
            "time": "9:00 AM",
            "tweet": "Tweet text",
            "category": "harsh_truths",
            "pillar": "offer_mechanics",
            "score": 92,
            "reasoning": "Why this tweet at this time"
          },
          {
            "time": "12:00 PM",
            "tweet": "Tweet text",
            "category": "marketing_breakdowns",
            "pillar": "direct_response",
            "score": 88
          },
          {
            "time": "3:00 PM",
            "tweet": "Tweet text",
            "category": "actionable_tips",
            "pillar": "offer_mechanics",
            "score": 85
          }
        ]
      }
    ],
    
    "linkedin_posts": [
      {
        "day": "tuesday",
        "post": "Full post text",
        "type": "deep_dive",
        "priority_score": 90
      },
      {
        "day": "thursday",
        "post": "Full post text",
        "type": "case_study",
        "priority_score": 87
      }
    ]
  },
  
  "unused_high_priority": [
    {
      "content": "Tweet or post not used",
      "score": 88,
      "reason_not_selected": "Category imbalance"
    }
  ],
  
  "statistics": {
    "total_tweets_generated": 60,
    "tweets_selected": 21,
    "average_score_selected": 86,
    "pillar_distribution": {
      "offer_mechanics": 6,
      "harsh_marketing_truths": 5,
      "direct_response": 4,
      "ai_automation": 2,
      "personal_observations": 3,
      "meta_marketing": 1
    },
    "category_distribution": {
      "harsh_truths": 4,
      "offer_mechanics": 5,
      "marketing_breakdowns": 4,
      "counterintuitive": 4,
      "actionable_tips": 3,
      "one_liners": 1
    }
  }
}
```

## Time Slot Strategy

### Morning (9:00 AM)
**Best for:** Big ideas, harsh truths, threads, provocative takes
**Why:** High engagement window, people thinking strategically
**Avoid:** One-liners, quick tips

### Midday (12:00 PM)
**Best for:** Marketing insights, breakdowns, observations
**Why:** Lunch break scrolling, more time to consume
**Avoid:** Heavy content requiring deep thought

### Afternoon (3:00 PM)
**Best for:** Actionable tips, one-liners, tactical advice
**Why:** End of day, looking for quick wins
**Avoid:** Long-form or complex ideas

## Daily Balance Rules

Each day should have:
- At least 1 tweet with high engagement potential (score 90+)
- Maximum 2 tweets from same category
- Mix of tones (not all harsh truths or all tips)
- At least 1 tweet with CTA potential

## Pillar Target Distribution

For 21 tweets:
- **Offer Mechanics**: 5-6 tweets (24-29%)
- **Harsh Marketing Truths**: 5-6 tweets (24-29%)
- **Direct Response**: 4-5 tweets (19-24%)
- **AI & Automation**: 2-3 tweets (10-14%)
- **Personal Observations**: 3-4 tweets (14-19%)
- **Meta-Marketing**: 1-2 tweets (5-10%)

## Quality Gates

Before finalizing selection:
- [ ] No tweet sounds generic or AI-written
- [ ] Each day has variety in tone
- [ ] Pillar distribution is balanced
- [ ] Monday has the strongest thread
- [ ] LinkedIn posts are differentiated
- [ ] High-priority unused content is documented

