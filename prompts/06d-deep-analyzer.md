# Node 6D: Deep Post Analyzer

## Purpose
Analyze the Field Guide to identify the strongest content angles, spin-off opportunities, and strategic insights for content planning.

## System Prompt

```
You are analyzing Riley's breakdown to identify the strongest content angles and strategic opportunities.

ANALYSIS GOALS:
1. Find the single most powerful insight
2. Identify controversial takes that will generate discussion
3. Extract the most actionable element
4. Spot the best story/example for repurposing
5. Discover spin-off opportunities for future content

STRATEGIC LENS:
- What will generate the most engagement?
- What will attract the right audience?
- What naturally leads to WBYO?
- What could become a signature piece of content?
```

## Input Template

```
FIELD GUIDE:
{{field_guide_content}}

PARSED CONTENT:
{{parsed_json}}
```

## Output Schema

```json
{
  "analysis": {
    "strongest_insight": {
      "insight": "The most powerful idea in the piece",
      "why_powerful": "Why this resonates",
      "expansion_potential": "How it could be expanded",
      "use_as": "thread_hook | linkedin_feature | standalone_content",
      "signature_potential": true
    },
    
    "most_controversial": {
      "take": "The controversial statement",
      "who_disagrees": "Who will push back",
      "engagement_potential": 9,
      "how_to_frame": "Best framing for discussion",
      "risk_level": "low | medium | high"
    },
    
    "most_actionable": {
      "action": "What readers can do immediately",
      "outcome": "Expected result",
      "specificity_level": 9,
      "format_best_for": "tweet | thread | linkedin | all"
    },
    
    "best_example": {
      "example": "The most memorable example/story",
      "why_it_lands": "Why it's effective",
      "extraction_angle": "How to repurpose it",
      "standalone_value": true
    },
    
    "spin_off_opportunities": [
      {
        "topic": "Topic that deserves its own Field Guide",
        "why": "Why it's worth exploring",
        "angle": "The unique angle to take",
        "urgency": "high | medium | low",
        "audience_demand": 8
      }
    ]
  },
  
  "strategic_recommendations": {
    "monday_thread_topic": "Best thread hook for Monday",
    "linkedin_priority": "Which LinkedIn post should go first",
    "engagement_strategy": "How to maximize discussion",
    "next_week_suggestion": "Recommended topic for next week"
  },
  
  "content_gaps": {
    "missing_angles": ["Angles not covered that could be"],
    "audience_segments_not_addressed": ["Who wasn't spoken to"],
    "objections_not_handled": ["Skepticism not addressed"]
  },
  
  "performance_predictions": {
    "highest_engagement_tweet": "Which tweet will perform best",
    "most_shareable_content": "What will get shared most",
    "conversion_driver": "What will drive most WBYO signups"
  }
}
```

## Analysis Framework

### 1. Strongest Insight Analysis

Evaluate insights on:
- **Novelty**: Is this a new way of thinking?
- **Specificity**: Is it concrete or abstract?
- **Applicability**: Can readers use it immediately?
- **Quotability**: Is it memorable?
- **Shareability**: Will people share this?

### 2. Controversy Assessment

Consider:
- **Who disagrees**: Identify the opposing view
- **Discussion value**: Will it create meaningful conversation?
- **Brand alignment**: Does controversy fit Riley's brand?
- **Risk vs reward**: Is engagement worth potential backlash?

### 3. Actionability Scoring

Score based on:
- **Clarity**: Is the action clear?
- **Immediacy**: Can they do it today?
- **Impact**: Will it create noticeable results?
- **Difficulty**: Is it achievable?

### 4. Spin-Off Evaluation

Evaluate potential topics on:
- **Depth available**: Is there enough to say?
- **Audience interest**: Do people care?
- **Expertise match**: Can Riley speak to this?
- **Business alignment**: Does it lead to WBYO?

## Example Output

```json
{
  "analysis": {
    "strongest_insight": {
      "insight": "Results create curiosity. Mechanism creates confidence.",
      "why_powerful": "Flips conventional wisdom about social proof. Creates a clear framework for sales conversations. Immediately actionable.",
      "expansion_potential": "Could become a signature framework - 'The Mechanism-First Method' or 'The Confidence Framework'",
      "use_as": "thread_hook",
      "signature_potential": true
    },
    
    "most_controversial": {
      "take": "Case studies are killing your close rate",
      "who_disagrees": "Every agency coach who teaches 'get more testimonials'. Sales trainers who focus on social proof.",
      "engagement_potential": 9,
      "how_to_frame": "Not 'case studies are bad' but 'case studies alone aren't enough - here's what's missing'",
      "risk_level": "medium"
    },
    
    "spin_off_opportunities": [
      {
        "topic": "The Mechanism-First Sales Call",
        "why": "The insight about mechanism vs results could be a complete methodology",
        "angle": "A step-by-step framework for structuring sales calls around mechanism",
        "urgency": "high",
        "audience_demand": 9
      },
      {
        "topic": "What Actually Builds Trust in 2024",
        "why": "If not case studies, what? This is the natural next question",
        "angle": "The hierarchy of trust-building in high-ticket sales",
        "urgency": "medium",
        "audience_demand": 8
      }
    ]
  },
  
  "strategic_recommendations": {
    "monday_thread_topic": "Case studies are killing your close rate (contrarian hook)",
    "linkedin_priority": "Deep dive on mechanism vs results - most professional angle",
    "engagement_strategy": "Ask 'What's your close rate?' to get people reflecting before the lesson",
    "next_week_suggestion": "The Mechanism-First Sales Call - natural follow-up"
  }
}
```

## Quality Criteria

Good analysis should:
- Identify non-obvious insights
- Provide strategic recommendations
- Create clear next steps
- Connect to business goals
- Predict content performance

