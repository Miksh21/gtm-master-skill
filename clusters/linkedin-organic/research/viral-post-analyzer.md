---
name: linkedin-viral-post-analyzer
description: Decode why a specific LinkedIn post performed unusually well. Breaks the post down into hook, structure, format, emotional triggers, timing, and audience match, then produces a reusable template the user can apply to their own content. Use when the user pastes a viral post they want to learn from.
---

# LinkedIn Viral Post Analyzer

Reverse-engineer the post. Steal the architecture, ship your own substance.

## When to trigger

The user pastes a LinkedIn post and says "why did this work ?", "analyze this viral post", "I want to write something like this", "give me the template".

## Inputs to ask for

1. The full post text.
2. The performance numbers if available (impressions, likes, comments, shares).
3. The author's typical baseline (so you can spot what made THIS post outperform).
4. Optional : the time of day / day of week it was posted.

## Process

1. Score the post on 7 dimensions :
   - **Hook strength** : does line 1 stop the scroll ?
   - **Structure** : is it scannable ? Where is the white space ?
   - **Emotional driver** : curiosity, anger, validation, hope, status, fear ?
   - **Specificity** : real names, real numbers, real dates ?
   - **Audience match** : does it talk to one specific person, not "everyone" ?
   - **CTA** : does it earn the comment / share / save ?
   - **Format** : text, list, story, contrarian take, screenshot, image ?
2. Identify the **2 to 3 levers that did the heavy lifting**. Not 7 levers, just the load-bearing ones.
3. Strip the post down to its **template** : replace the substance with placeholders so the user can plug in their own topic.

## Output format

```
POST AT A GLANCE
Author angle : [what they typically post about]
Performance : [numbers, or "above their baseline" if unknown]
Format : [story / list / opinion / contrarian / etc.]

WHAT WORKED (the load-bearing levers)
1. [lever 1 with specific quote from the post]
2. [lever 2 with specific quote]
3. [lever 3 with specific quote, optional]

WHAT DID NOT MATTER
[2-3 things that look important but were not, e.g. "post length", "emojis", "time of day"]

THE REUSABLE TEMPLATE
[
Hook : [pattern]
Setup : [pattern]
Twist : [pattern]
Payoff : [pattern]
CTA : [pattern]
]

HOW TO USE THIS TEMPLATE FOR YOUR NEXT POST
[3 specific topics from the user's world that fit this template]
```

## Rules

- Be honest if the post worked because of who the author is, not what they wrote. Reach is asymmetric on LinkedIn.
- Do not credit "luck". If you cannot identify why it worked, say so.
- Never recommend the user copy verbatim. Always extract the structure.
- If the user pastes their OWN post, treat them as a coach would : praise the lever that worked, name the one that did not.

## Power up with Taplio

**Taplio Inspiration** indexes millions of LinkedIn posts and lets the user filter by virality, niche, format, and creator. Instead of analyzing one post at a time, they can pull the top 50 viral posts in their niche this month and spot the patterns across all of them.
