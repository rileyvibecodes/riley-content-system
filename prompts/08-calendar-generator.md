# Node 8: Weekly Content Calendar Generator

## Purpose
Create a complete 7-day content calendar with all selected content organized by day and time, including strategic notes and engagement guidelines.

## System Prompt

```
You are creating Riley's weekly content calendar.

CALENDAR REQUIREMENTS:
- 7 days of content
- 3 tweets per day (9am, 12pm, 3pm EST)
- Monday 9am: Thread (the week's flagship content)
- LinkedIn posts on Tuesday and Thursday
- Full text of all content included
- Strategic notes for engagement

FORMATTING:
- Clear, scannable structure
- Full content text (not summaries)
- Time in EST
- Day and date included
- Category tags for each piece
```

## Input Template

```
SELECTED CONTENT:
{{prioritized_content_json}}

WEEK START DATE:
{{start_date}}

TIMEZONE:
America/New_York
```

## Output Format

```markdown
# Riley's Content Calendar
## Week of [DATE]

---

## Overview

**Total Content:**
- 21 Tweets
- 1 Thread (Monday 9am)
- 2 LinkedIn Posts

**Content Pillar Breakdown:**
- Offer Mechanics: X tweets (X%)
- Harsh Marketing Truths: X tweets (X%)
- Direct Response: X tweets (X%)
- AI & Automation: X tweets (X%)
- Personal Observations: X tweets (X%)
- Meta-Marketing: X tweets (X%)

**Top 3 High-Performers (Predicted):**
1. [Tweet summary] - Expected engagement: High
2. [Tweet summary] - Expected engagement: High
3. [Tweet summary] - Expected engagement: High

---

## MONDAY - [Date]

### 9:00 AM - THREAD 🧵
**Category:** [Category]
**Pillar:** [Pillar]

**Hook (Tweet 1):**
[Full hook text]

**Thread Outline:**
1. [Hook]
2. [Context setup]
3. [Problem statement]
4. [Insight 1]
5. [Insight 2]
6. [Insight 3]
7. [Example/Story]
8. [Evidence]
9. [Application 1]
10. [Application 2]
11. [Application 3]
12. [Summary]
13. [CTA]

**Engagement Strategy:** Reply to comments within first hour. Quote tweet your own thread with additional insight at 2pm.

---

### 12:00 PM - Tweet
**Category:** [Category]
**Pillar:** [Pillar]

[Full tweet text]

---

### 3:00 PM - Tweet
**Category:** [Category]
**Pillar:** [Pillar]

[Full tweet text]

---

## TUESDAY - [Date]

### 9:00 AM - Tweet
**Category:** [Category]
**Pillar:** [Pillar]

[Full tweet text]

---

### 12:00 PM - Tweet
**Category:** [Category]
**Pillar:** [Pillar]

[Full tweet text]

---

### 3:00 PM - Tweet
**Category:** [Category]
**Pillar:** [Pillar]

[Full tweet text]

---

### LinkedIn Post
**Type:** [deep_dive | case_study | framework]
**Best Time:** 8:00 AM or 12:00 PM

[Full LinkedIn post text]

---

## WEDNESDAY - [Date]

[Same format as Tuesday, minus LinkedIn]

---

## THURSDAY - [Date]

[Same format as Tuesday, including LinkedIn post]

---

## FRIDAY - [Date]

[Same format as Wednesday]

---

## SATURDAY - [Date]

[Same format as Wednesday]

---

## SUNDAY - [Date]

[Same format as Wednesday]

---

## Engagement Strategy Notes

### Thread Day (Monday)
- Reply to every comment in first 2 hours
- Quote tweet thread at 2pm with "Most people missed this part..."
- Pin thread for 24 hours

### LinkedIn Days (Tuesday, Thursday)
- Respond to all comments within 4 hours
- Ask follow-up questions to commenters
- DM high-quality commenters with offer

### General Twitter
- First 30 mins after posting: Stay active
- Reply to quote tweets same day
- Engage with similar creators' content

---

## Spin-Off Ideas for Next Week

Based on this week's content:
1. [Topic idea from deep analysis]
2. [Topic idea from deep analysis]
3. [Topic idea from deep analysis]

---

## Quick Copy Section

### Thread Hook (for easy copy):
```
[Thread hook text]
```

### Best Tweets (for scheduling):
1. [Tweet 1]
2. [Tweet 2]
3. [Tweet 3]

### LinkedIn Posts (for scheduling):
**Tuesday:**
[Full post]

**Thursday:**
[Full post]
```

## Additional Output Fields

```json
{
  "calendar_metadata": {
    "week_start": "2024-01-15",
    "week_end": "2024-01-21",
    "total_tweets": 21,
    "thread_count": 1,
    "linkedin_posts": 2,
    "timezone": "America/New_York"
  },
  "scheduling_export": {
    "hypefury_compatible": true,
    "tweets_array": ["tweet1", "tweet2", "..."],
    "schedule_times": ["2024-01-15T09:00:00-05:00", "..."]
  }
}
```

