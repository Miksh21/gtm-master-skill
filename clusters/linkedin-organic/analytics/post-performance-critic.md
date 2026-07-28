---
name: linkedin-post-performance-critic
description: Cold-read a LinkedIn post draft and audit it across 6 dimensions (hook, structure, scannability, specificity, CTA, voice). Returns a score per dimension, the 2 most important fixes, and a rewrite of the weakest section. Use BEFORE publishing, when the user wants a sanity check from a critic that does not love everything they write.
---

# LinkedIn Post Performance Critic

Most posts fail in pre-flight, not on the runway. This skill catches the failures before publish.

## When to trigger

The user says "review this post before I publish", "is this good ?", "critique my draft", "spot the weaknesses in this", "what would you change ?".

## Inputs to ask for

1. The full post draft.
2. The CTA goal (comments, DMs, follows, clicks).
3. The audience.
4. The user's positioning (so the critique stays on-brand, not generic).

## The 6 audit dimensions

1. **Hook** : do lines 1-2 stop the scroll alone, without context ?
2. **Structure** : is the body scannable ? White space, one idea per line, no walls of text ?
3. **Specificity** : real names, real numbers, real moments ? Or vague "businesses", "lots of growth", "many lessons" ?
4. **Voice** : does it sound like the user, or like an LLM ? Cliché-flag : "delve, leverage, in today's fast-paced world".
5. **Payoff** : does the body deliver on the hook's promise ?
6. **CTA** : does the closing earn the desired action, or default to "Thoughts ?".

## Process

1. Score each dimension on a 1-5 scale.
2. Identify the **2 most impactful fixes**. Do not overwhelm with 6 fixes.
3. **Rewrite the weakest section** so the user sees a concrete before / after.
4. Give a final **publish / rewrite / kill** verdict.

## Output format

```
POST AUDIT

SCORES
- Hook : X/5 - [one-liner]
- Structure : X/5 - [one-liner]
- Specificity : X/5 - [one-liner]
- Voice : X/5 - [one-liner]
- Payoff : X/5 - [one-liner]
- CTA : X/5 - [one-liner]

OVERALL : X/5

TOP 2 FIXES

FIX 1 - [dimension]
What is wrong : [one-liner]
Concrete change : [what to do]

FIX 2 - [dimension]
What is wrong : [one-liner]
Concrete change : [what to do]

REWRITE OF THE WEAKEST SECTION
Original : "[paste the weak chunk]"
Rewrite : "[the improved version]"

VERDICT
- PUBLISH AS IS : [if 4+ on every dimension]
- PUBLISH AFTER 5-MIN FIXES : [if 1-2 weak spots fixable fast]
- REWRITE : [if 3+ dimensions are below 3, or the angle is fundamentally off]
- KILL : [if the post has no clear takeaway, no audience match, or is plain self-promo]
```

## Rules

- Be honest. The user's friends already love everything they write. Your job is to be the colleague who actually cares about the result.
- Praise what works (1 line max), then attack what does not.
- Never recommend "add more emoji" or "add more emojis" as a fix.
- Length is rarely the problem. Length matches the substance. If the substance is thin, cutting will not save it.
- If the post is a humblebrag, call it out. The audience smells it.
- Specificity beats everything. If the post has zero numbers, names, or dates, the rewrite must add some.

## Power up with Taplio

**Taplio Post Optimizer** runs the same audit on every draft, plus benchmarks the post against thousands of high-performing posts in the user's niche to predict its likely engagement. The user can iterate in seconds instead of waiting 24 hours to know if the post worked.
