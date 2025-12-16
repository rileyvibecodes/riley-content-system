# Node 2: Research & Ideas

## Purpose
Gather insights, angles, examples, and counterintuitive perspectives for the selected topic before writing the Field Guide.

## System Prompt

```
You are Riley's research assistant. Help gather insights and angles for this breakdown.

RILEY'S VOICE:
- Direct, no-BS, mechanistic
- Appreciates good marketing but calls out BS
- Uses specific examples and breakdowns
- Mix of harsh truths and tactical insights
- Specificity over generality ("$600" not "a lot of money")
- Uses real brand names, real numbers, real scenarios

RESEARCH APPROACH:
- Find the counterintuitive angle first
- Identify what "everyone else" says, then challenge it
- Look for specific, concrete examples
- Think about objections before they're raised
- Connect insights to offer mechanics
```

## Input Template

```
TOPIC: {{selected_topic}}
FORMAT: {{format_type}}
HOOK ANGLE: {{hook_angle}}

KNOWLEDGE BASE CONTEXT:
{{relevant_knowledge_base_excerpts}}
```

## Output Structure

### 1. KEY CONCEPTS (5-10 core ideas)
Ideas that form the foundation of this topic. Each should be tweetable.

### 2. COUNTERINTUITIVE ANGLES (3-5 perspectives)
What does "everyone" believe that's actually wrong? Challenge conventional wisdom.

### 3. COMMON MISTAKES (What most people get wrong)
Specific, actionable mistakes that the audience is making right now.

### 4. SPECIFIC EXAMPLES (3-5 real-world examples)
- Include specific numbers, brands, or scenarios
- Riley loves specificity: "$600" not "a lot of money"
- Reference real offers, real ads, real case studies
- Include the "before and after" when possible

### 5. CORE PROBLEMS (3-5 pain points)
The emotional and logical problems this topic addresses. What keeps them up at night?

### 6. TRANSFORMATION ARC
How does someone go from broken to fixed? What's the journey?

### 7. OBJECTIONS TO ADDRESS
What skepticism might readers have? Pre-handle it.

### 8. ACTIONABLE TAKEAWAYS (5-7 specific things)
What can readers do immediately after reading? Be specific.

## Output Format

```json
{
  "key_concepts": [
    {
      "concept": "The concept in one sentence",
      "explanation": "Brief explanation",
      "tweetability": 8
    }
  ],
  "counterintuitive_angles": [
    {
      "conventional_wisdom": "What everyone believes",
      "reality": "What's actually true",
      "proof_point": "Evidence or example"
    }
  ],
  "common_mistakes": [
    {
      "mistake": "What they do wrong",
      "why_it_fails": "Why it doesn't work",
      "fix": "What to do instead"
    }
  ],
  "specific_examples": [
    {
      "example": "The example",
      "specifics": "Numbers, names, details",
      "lesson": "What it proves"
    }
  ],
  "core_problems": [
    {
      "problem": "The pain point",
      "who_feels_it": "Specific audience segment",
      "emotional_impact": "How it makes them feel"
    }
  ],
  "transformation_arc": {
    "before_state": "Where they are now",
    "after_state": "Where they want to be",
    "mechanism": "How the transformation happens",
    "timeline": "How long it takes"
  },
  "objections": [
    {
      "objection": "What they might think",
      "response": "How to handle it"
    }
  ],
  "actionable_takeaways": [
    {
      "action": "Specific action to take",
      "outcome": "Expected result",
      "difficulty": "easy | medium | hard"
    }
  ]
}
```

## Example Output Snippet

```json
{
  "counterintuitive_angles": [
    {
      "conventional_wisdom": "You need more case studies to close high-ticket deals",
      "reality": "Case studies create skepticism because prospects assume cherry-picked results. What closes deals is mechanism clarity.",
      "proof_point": "Agency owners with 50+ case studies still have 20% close rates. Operators with 3 case studies but crystal-clear mechanisms close at 60%."
    },
    {
      "conventional_wisdom": "Social proof is the most important trust builder",
      "reality": "Social proof only works AFTER mechanism understanding. Showing results without explaining HOW creates doubt.",
      "proof_point": "Hormozi's $100M Leads has minimal case studies. It's all mechanism explanation. Yet it converts at scale."
    }
  ]
}
```

