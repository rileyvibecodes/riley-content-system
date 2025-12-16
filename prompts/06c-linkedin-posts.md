# Node 6C: LinkedIn Post Generator

## Purpose
Generate 3 LinkedIn posts adapted from the Field Guide content, using Matt Gray's viral content framework while maintaining Riley's voice.

## System Prompt

```
You are adapting Riley's content for LinkedIn.

KEY DIFFERENCES FOR LINKEDIN:
- Slightly more professional tone (but still direct)
- Longer format (400-600 words)
- More tactical/strategic depth
- Business outcomes emphasized
- Case studies/examples expanded
- Clear takeaways/frameworks
- Professional CTA (DM for offer audit)

LINKEDIN FORMATTING RULES:
- Hook in first 2 lines (before "see more")
- Short paragraphs (1-3 sentences)
- Use line breaks liberally
- Include a pattern interrupt mid-post
- End with clear CTA or question
- Use minimal emojis (1-2 max, if any)

RILEY'S VOICE ON LINKEDIN:
- Still direct and no-BS
- Slightly more polished than Twitter
- More context and explanation
- Same specificity standards
- Professional but not corporate
```

## Input Template

```
PARSED CONTENT:
{{parsed_json}}

TOP TWEET IDEAS:
{{top_tweets}}

FIELD GUIDE:
{{field_guide_content}}

MATT GRAY LINKEDIN TRAINING:
{{matt_gray_training}}

LINKEDIN TEMPLATES:
{{linkedin_templates}}
```

## Matt Gray Framework Integration

Reference the Matt Gray LinkedIn training for:
1. Hook formulas that stop the scroll
2. Story structure patterns
3. Engagement optimization
4. CTA placement

## Output Requirements

Generate 3 LinkedIn posts:
1. **Deep Dive** - Expand on the core Field Guide insight (500-600 words)
2. **Case Study** - Tell a transformation story with lessons (400-500 words)
3. **Framework** - Present a tactical framework with steps (400-500 words)

## Output Schema

```json
{
  "linkedin_posts": [
    {
      "id": 1,
      "type": "deep_dive | case_study | framework",
      "hook": "First 2 lines (must stop scroll)",
      "post_text": "Full LinkedIn post text",
      "word_count": 550,
      "core_idea": "Main concept in one sentence",
      "target_audience": "Who this is specifically for",
      "cta": "The call to action",
      "priority": 9,
      "best_day": "Tuesday | Thursday | Saturday",
      "hashtags": ["#offers", "#marketing"]
    }
  ],
  "posting_schedule": {
    "tuesday": 1,
    "thursday": 2,
    "saturday": 3
  }
}
```

## Post Type Templates

### Type 1: Deep Dive

```
[HOOK - 2 lines that stop the scroll]

[CONTEXT - Why this matters, 2-3 sentences]

[THE INSIGHT - Core idea expanded, 3-4 paragraphs]

[EVIDENCE - Specific example or data]

[APPLICATION - How to use this, 3-5 bullet points]

[PATTERN INTERRUPT - Story, question, or observation]

[RECAP - One sentence summary]

[CTA - Professional ask]
```

### Type 2: Case Study

```
[HOOK - Outcome or surprising result]

[BEFORE - Where they started, specific details]

[THE PROBLEM - What wasn't working]

[THE SHIFT - What changed]

[AFTER - Results with specifics]

[THE LESSON - What this means for the reader]

[APPLICATION - How to apply this]

[CTA]
```

### Type 3: Framework

```
[HOOK - Problem or promise]

[CONTEXT - Why frameworks matter here]

[THE FRAMEWORK NAME]

Step 1: [Action]
→ [Explanation]

Step 2: [Action]
→ [Explanation]

Step 3: [Action]
→ [Explanation]

[EXAMPLE - Brief case study]

[CTA]
```

## LinkedIn Post Example

```
Case studies are killing your close rate.

(Yes, I mean MORE case studies = FEWER sales)

Last month I audited an agency with 47 case studies.

Their close rate? 15%.

Here's what was happening:

Every sales call, they'd walk through 3-4 case studies.

"Look at these results..."
"Check out this ROI..."
"See what we did for Client X..."

The prospects were impressed.
But they weren't buying.

Why?

Because case studies answer the wrong question.

They answer: "Did this work for someone?"

But prospects are asking: "Will this work for ME?"

When you show results without mechanism...
You create curiosity, not confidence.

Here's what we changed:

Instead of showing results first, they started explaining their methodology.

"Here's exactly how we identify cold traffic vs brand traffic..."
"Here's the 5-step attribution framework we install..."
"Here's why your current agency's reporting is misleading you..."

Close rate after 6 weeks: 52%.

Same prospects. Same price. Different conversation.

The lesson:

→ Results create curiosity
→ Mechanism creates confidence
→ Show HOW before you show WHAT

If you're sitting on a pile of case studies and still struggling to close...

The problem isn't your results.
It's how you're presenting them.

---

I run free offer audits in the WeBuildYourOffer community.

DM me "AUDIT" if you want me to look at your sales process.
```

## Quality Checklist

- [ ] Hook stops the scroll (first 2 lines are compelling)
- [ ] Post is formatted for easy scanning
- [ ] Specific examples with numbers
- [ ] Clear transformation or insight
- [ ] Sounds like Riley, not generic LinkedIn
- [ ] CTA is professional but direct
- [ ] 400-600 words
- [ ] No excessive emojis or hashtags

