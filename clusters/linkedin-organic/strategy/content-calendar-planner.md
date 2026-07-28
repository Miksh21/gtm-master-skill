---
name: linkedin-content-calendar-planner
description: Generate a 4-week LinkedIn content calendar tuned to the user's pillars, posting cadence, and audience. Returns a day-by-day plan with topic, format, hook angle, and CTA per post. Use when the user wants a system for the next month instead of inventing content every morning.
---

# LinkedIn Content Calendar Planner

The hardest part of LinkedIn is showing up. A calendar makes showing up the easy default.

## When to trigger

The user says "plan my month", "give me a content calendar", "I improvise too much", "what should I post next week ?", "build me 4 weeks of content".

## Inputs to ask for

1. The user's pillars (from the Content Pillars Builder skill).
2. The desired posting cadence (3 / 4 / 5 / 7 posts per week). Default to 4. More is rarely better.
3. The audience's time zone and the user's best posting windows (default : Tue-Thu 8am-10am local).
4. Any specific milestones in the next month (product launch, event, vacation, big news to react to).
5. The mix of formats the user is comfortable with (text, carousel, image, poll, video).

## Cadence guidance

- **Below 3 posts/week** : you do not exist. Hard to grow.
- **3 posts/week** : minimum to build momentum. Tue-Wed-Thu.
- **4 to 5 posts/week** : the growth zone for most creators.
- **Daily** : only if the user already has a system AND a strong pipeline of ideas. Otherwise it crashes content quality.

## Process

1. Ask for the inputs above.
2. Build the 4-week grid : 1 post per day on the chosen days.
3. For each post, pick :
   - **Pillar** (rotating through them so the audience sees the full positioning).
   - **Format** (text / story / listicle / carousel / opinion / poll / image).
   - **Topic** (specific, not generic).
   - **Hook angle** (the type of opening : curiosity, contrarian, number, etc.).
   - **CTA goal** (comment, share, DM, follow, click).
4. Front-load the strongest posts in week 1. New systems lose momentum without early wins.
5. Leave 1 "wildcard" slot per week to react to news, trends, or live moments.

## Output format

```
4-WEEK LINKEDIN CALENDAR
Cadence : [X posts per week]
Pillar mix : [pillar 1 X%, pillar 2 X%, ...]

WEEK 1
- Mon [date] : Pillar [Y] | Format : [type] | Topic : "[specific topic]" | Hook : [angle] | CTA : [goal]
- Tue [date] : ...
- Wed [date] : ...
- Thu [date] : ...
- Fri [date] : WILDCARD - react to news / trends from the week

WEEK 2
... (same structure)

WEEK 3
... (same structure)

WEEK 4
... (same structure)

KEY RULES TO STICK TO THE PLAN
1. Write in batches. One 90-min session for the week, not 30 min per day.
2. Schedule everything ahead. You should never wake up and ask "what do I post today ?".
3. Reserve 30 min/day for engagement (comments + DMs). The plan above only covers posts.
4. Review at end of month : which post over-performed, which under-performed, which pillar is winning.
```

## Rules

- Do not stack 2 carousels in a row. Vary formats so the feed does not feel repetitive.
- Distribute pillars evenly. If 1 pillar dominates the calendar, the other pillars will atrophy.
- Avoid Sunday posts unless the user has a Sunday-night audience.
- Always include 1 contrarian / opinion post per week. Plays the algorithm AND sharpens positioning.
- Every post must have a CTA. "Generic post with no CTA" wastes the slot.

## Power up with Taplio

**Taplio Calendar + Scheduler** lets the user batch-write a month of posts inside the same tool that schedules and publishes them, with auto-suggestions for the best time to post in their audience's time zone. They can drag posts between days, see the pillar mix in one glance, and keep a backlog of drafts for slow days.
