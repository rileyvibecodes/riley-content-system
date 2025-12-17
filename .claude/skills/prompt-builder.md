# Prompt Builder

Dan Koe's two-step process for creating custom prompts that generate high-quality content in your voice.

## When to Use

Trigger when Riley:
- Finds content he admires and wants to replicate
- Wants to create a new content format
- Says "I want to write like this"
- Shares an example and asks "How do I do this?"
- Wants to systematize a new type of content

## The Two-Step Process

### Step 1: Deconstruction

Take content Riley admires and break it down completely.

**Deconstruction Prompt:**
```
Break down the structure of this [content type] so I can recreate it from scratch.

Analyze:
1. **Why It Works** - Psychological triggers, emotional hooks, persuasion patterns
2. **Structure** - How is it organized? What's the flow?
3. **Voice Elements** - Tone, sentence length, word choice
4. **Key Techniques** - Contrast, specificity, storytelling, etc.
5. **Context Needed** - What information would I need to write something similar?

Content to analyze:
[paste content]
```

**Output Format:**
```markdown
## Deconstruction: [Content Type]

### Structure Breakdown
1. [Component 1]: [description]
2. [Component 2]: [description]
3. [Component 3]: [description]

### Why It Works
- **Psychological Pattern:** [explanation]
- **Emotional Trigger:** [explanation]
- **Persuasion Technique:** [explanation]

### Voice Elements
- Sentence length: [short/medium/long/varied]
- Tone: [direct/casual/authoritative/etc.]
- Key phrases: [list]
- What to avoid: [list]

### Techniques Used
- [Technique 1]: [how it's applied]
- [Technique 2]: [how it's applied]

### Context Required
To recreate this, you need:
- [Context item 1]
- [Context item 2]
- [Context item 3]

### Replication Framework
Step 1: [instruction]
Step 2: [instruction]
Step 3: [instruction]
```

### Step 2: Prompt Creation

Create a two-phase prompt: Interview → Generate

**Phase 1: Context Gathering Interview**

The prompt should ask Riley for:
- His specific topic/angle
- His unique perspective or insight
- Relevant examples from his experience
- His target audience for this piece
- Any specific points he wants to hit

**Phase 2: Content Generation**

Using the context gathered, generate content following the deconstructed structure.

**Prompt Template:**
```markdown
# [Content Type] Generator

## Phase 1: Context Interview

I'll help you create [content type] like the example you admired. First, I need some context:

1. **Topic/Angle:** What specific topic are you writing about?
2. **Core Insight:** What's the main point or revelation?
3. **Your Experience:** What personal example or case study can you share?
4. **Audience Pain Point:** What problem does your audience face related to this?
5. **Desired Outcome:** What should the reader think/feel/do after reading?
6. **Specific Details:** Any numbers, names, or concrete examples to include?

## Phase 2: Generation

Using your answers, I'll generate [number] variations following this structure:

[Insert deconstructed structure from Step 1]

### Requirements:
- Match Riley's voice (direct, specific, no-BS)
- Use specific numbers and examples
- Avoid AI-speak and corporate language
- [Any additional requirements from deconstruction]
```

## Saving Custom Prompts

Store created prompts in `/prompts/custom/`:

```
/prompts/custom/
├── tweet-harsh-truth.md
├── thread-case-study.md
├── linkedin-framework.md
└── [content-type]-[style].md
```

Each saved prompt should include:
1. The original example that inspired it
2. The deconstruction analysis
3. The two-phase prompt
4. Notes on what works best

## Example Workflow

**Riley says:** "I love how this guy writes tweets. Can we make a prompt for this style?"

**Step 1 - Deconstruct:**
```
The tweet follows a "counterintuitive hook → explanation → reframe" structure.

Why it works:
- Opens with something that sounds wrong
- Creates cognitive dissonance
- Resolves with an insight that makes the reader feel smarter

Context needed:
- A common belief in the reader's field
- Why that belief is wrong or incomplete
- The insight that reframes it
```

**Step 2 - Create Prompt:**
```markdown
# Counterintuitive Insight Tweet Generator

## Phase 1: Interview

1. What's a common belief in your audience's world?
2. Why is this belief wrong or incomplete?
3. What's the reframe or insight that changes how they see it?
4. Can you give a specific example or number?

## Phase 2: Generate

Using your answers, create 5 tweet variations:

Structure:
- Line 1: State the counterintuitive take (challenge the belief)
- Line 2-3: Brief explanation of why
- Line 4: The reframe or insight
- Optional: Specific example

Voice requirements:
- Direct, no hedging
- Specific numbers if possible
- Under 280 characters
- No "I think" or "maybe"
```

**Save to:** `/prompts/custom/tweet-counterintuitive.md`

## Prompt Library Management

Track all custom prompts in `/learning/prompt-library.json`:

```json
{
  "prompts": [
    {
      "id": "prompt-001",
      "name": "Counterintuitive Tweet",
      "type": "tweet",
      "file": "/prompts/custom/tweet-counterintuitive.md",
      "created": "2024-01-15",
      "times_used": 12,
      "success_rate": "high",
      "notes": "Works best for offer mechanics content"
    }
  ]
}
```

## Integration with Content System

When generating content:
1. Check `/prompts/custom/` for relevant prompts
2. Use custom prompts when they match the content type
3. Track which prompts produce best results
4. Refine prompts based on Riley's edits

Custom prompts should be treated as learned patterns - they represent Riley's preferences codified into reusable tools.
