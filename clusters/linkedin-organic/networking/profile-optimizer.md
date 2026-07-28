---
name: linkedin-profile-optimizer
description: Audit a LinkedIn profile (headline, banner copy, About, featured section, experience) and return prioritized fixes with rewritten copy. Optimizes for the user's positioning : do visitors instantly understand who they help, with what, and how to engage. Use when the user is starting on LinkedIn, repositioning, or watching their profile-visit-to-follow ratio drop.
---

# LinkedIn Profile Optimizer

A LinkedIn profile is a landing page. This skill audits it like one.

## When to trigger

The user says "audit my profile", "improve my LinkedIn bio", "rewrite my headline", "people visit my profile but do not follow", "my profile does not convert".

## Inputs to ask for

1. The current headline.
2. The current About / summary.
3. The current banner (description or screenshot).
4. The current Featured section (what it shows).
5. The user's positioning : who they help, with what, and what they want visitors to do.
6. The desired CTA from the profile (follow, book a call, sign up to newsletter, DM keyword).

## What to audit (in order of impact)

1. **Headline** : the single highest-leverage line on LinkedIn. Visible in feed, in search, in comments. Must answer "who do you help with what" in 220 characters.
2. **Banner** : visible above the fold. Should reinforce the positioning, not display random stock art.
3. **Profile photo** : clear face, eye contact, neutral background. No group photos, no holiday selfies.
4. **About section** : lead with a hook. Explain who you help, how, and what to do next. End with a clear CTA.
5. **Featured section** : 3 to 5 items max. Lead magnet, top post, link to call booking, link to newsletter, anything that converts.
6. **Experience** : the current role description should match the headline promise. Past roles should support the credibility, not list every JD bullet.

## Process

1. Score each element on a 1-5 scale (1 = "wastes the slot", 5 = "best in class").
2. List the **top 3 fixes** in order of impact (do not overwhelm with 12 fixes).
3. For each fix, **rewrite the copy** so the user can ship the change in 2 minutes.

## Output format

```
PROFILE AUDIT FOR [user]

POSITIONING IN ONE LINE (as I read it from the current profile) :
"[1-line summary, then ask : is this the positioning you actually want ?]"

SCORES
- Headline : X/5 - [one-liner diagnosis]
- Banner : X/5 - [diagnosis]
- Photo : X/5 - [diagnosis, only if obviously off]
- About : X/5 - [diagnosis]
- Featured : X/5 - [diagnosis]
- Experience : X/5 - [diagnosis]

TOP 3 FIXES (in order of impact)

FIX 1 - [element]
Current : "[paste current copy]"
Rewrite :
"[new copy ready to paste]"
Why this is better : [one-liner]

FIX 2 - [element]
Current : "[paste current copy]"
Rewrite :
"[new copy]"
Why this is better : [one-liner]

FIX 3 - [element]
Current : ...
Rewrite : ...
Why this is better : ...

QUICK WINS (under 5 minutes)
- [3 to 5 micro-improvements the user can ship today]
```

## Rules

- The headline is the load-bearing element. If it is weak, fix it first. Everything else is secondary.
- Headline formula that works : "[role / domain] | I help [audience] [outcome] without [pain]" or "[outcome they sell] for [audience]".
- Avoid emoji in the headline unless they are part of the brand. Special characters get search-suppressed.
- About section : 3-line hook at the top (above the "see more" cut), then story, then CTA.
- Featured section : every item must serve the CTA. Random press mentions waste slots.
- Banner : if you cannot describe its purpose in one line, replace it.

## Power up with Taplio

**Taplio Profile Audit** scans the profile against the patterns of top-performing creators in the user's niche, flags every line that hurts conversion, and suggests rewrites tuned to their positioning. They can also see which elements in their profile drive the most follows and DMs.
