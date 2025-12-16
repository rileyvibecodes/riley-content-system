# Node 5: Field Guide Parser

## Purpose
Extract structured data from the completed Field Guide for content repurposing across Twitter, LinkedIn, and other channels.

## System Prompt

```
You are a content analysis expert. Extract structured data from Riley's weekly breakdown.

EXTRACTION GOALS:
1. Identify tweetable quotes and insights
2. Find transformation arcs for storytelling
3. Extract problems/pain points for empathy hooks
4. Pull out actionable takeaways
5. Capture counterintuitive angles for contrarian content
6. Identify spin-off opportunities for future content

QUALITY CRITERIA:
- Prioritize specificity over generality
- Score each item for "tweetability" (standalone value)
- Identify which content pillar each item fits
- Note the context so content can be expanded if needed
```

## Input Template

```
FIELD GUIDE:
{{field_guide_content}}
```

## Output Schema

```json
{
  "metadata": {
    "title": "Field Guide title",
    "topic": "Core topic",
    "word_count": 1350,
    "date_created": "2024-01-15"
  },
  
  "core_thesis": {
    "statement": "1-2 sentence main argument",
    "contrarian_angle": "What conventional wisdom it challenges"
  },
  
  "paradoxes_and_truths": [
    {
      "quote": "Exact quote from the guide",
      "context": "What surrounds this quote",
      "tweetability_score": 9,
      "content_pillar": "harsh_truths | offer_mechanics | marketing_insights",
      "standalone": true
    }
  ],
  
  "transformation_arcs": [
    {
      "before_state": "Where they start",
      "after_state": "Where they end up",
      "mechanism": "How the change happens",
      "example": "Specific example used",
      "timeline": "How long it takes"
    }
  ],
  
  "core_problems": [
    {
      "problem": "The pain point",
      "who_feels_it": "Specific audience segment",
      "why_it_matters": "Emotional/logical impact",
      "hook_potential": 8
    }
  ],
  
  "key_examples": [
    {
      "example": "The case study or example",
      "specifics": "Numbers, names, details",
      "lesson": "What it proves",
      "reusable": true
    }
  ],
  
  "objections_handled": [
    {
      "objection": "What skeptics might think",
      "response": "How it's addressed",
      "tweet_angle": "How to turn this into content"
    }
  ],
  
  "actionable_takeaways": [
    {
      "action": "Specific thing to do",
      "outcome": "Expected result",
      "difficulty_level": "easy | medium | hard",
      "tweet_format": "thread | single | tip"
    }
  ],
  
  "aspirational_statements": [
    {
      "statement": "The aspirational quote",
      "underlying_desire": "What audience wants",
      "use_case": "hook | closer | inspiration"
    }
  ],
  
  "one_liners": [
    {
      "text": "The quotable line",
      "context": "When/how it was used",
      "category": "harsh_truth | insight | wisdom | contrarian",
      "priority": 9
    }
  ],
  
  "spin_off_opportunities": [
    {
      "topic": "Topic that could be its own Field Guide",
      "why": "Why it deserves deeper exploration",
      "urgency": "high | medium | low"
    }
  ],
  
  "content_summary": {
    "total_tweetable_items": 45,
    "high_priority_items": 12,
    "thread_opportunities": 3,
    "linkedin_expansion_topics": 2
  }
}
```

## Extraction Guidelines

### Paradoxes & Counterintuitive Truths
Look for statements that challenge common beliefs:
- "Everyone thinks X, but actually Y"
- "The opposite of what you'd expect"
- "This sounds wrong, but..."

**Tweetability Score Criteria:**
- 10: Standalone, controversial, specific, quotable
- 7-9: Needs minimal context, strong insight
- 4-6: Good insight but needs setup
- 1-3: Only works within the full article

### Transformation Arcs
Find before/after stories:
- Client case studies
- Personal experiences
- Industry shifts
- Mindset changes

### One-Liners
Criteria for high-priority one-liners:
- Can stand alone without context
- Provocative or surprising
- Specific, not generic
- Sounds like Riley (direct, punchy)

### Content Pillar Classification
- **harsh_truths**: Uncomfortable realities, calling out BS
- **offer_mechanics**: Technical breakdown of offers, pricing, positioning
- **marketing_insights**: Tactical marketing observations
- **direct_response**: DR-specific insights, funnels, copy
- **ai_automation**: AI tools, automation, systems
- **personal_observations**: Riley's personal takes, experiences
- **meta_marketing**: Commentary on the marketing industry itself

## Example Extraction

**From Field Guide:**
```
"Results create curiosity. Mechanism creates confidence."
```

**Extraction:**
```json
{
  "text": "Results create curiosity. Mechanism creates confidence.",
  "context": "Explaining why case studies alone don't close deals",
  "category": "insight",
  "tweetability_score": 10,
  "content_pillar": "offer_mechanics",
  "priority": 10,
  "use_cases": ["standalone_tweet", "thread_hook", "linkedin_hook"]
}
```

