# Task: Write a LinkedIn Outreach Sequence

Recipe for connection-request note + 2 follow-up messages tied to a signal and persona. LinkedIn rules are different from email — shorter, no pitch in connection note, softer CTAs.

## When to use this

User asks to write a LinkedIn sequence, connection request, LinkedIn DM, InMail, or LinkedIn follow-up.

## Inputs required

- ICP and persona (role, company type)
- Signal the outreach is built around
- Hypothesis and angle
- Number of steps (default: connection request + 2 follow-ups)

## LinkedIn-specific rules (different from email)

### Connection request note (300-char hard limit)
- Must fit in **300 characters including spaces**
- **NO pitch** in the connection request — the goal is to get accepted, not to sell
- One sentence on why you're connecting + one light hook
- NO "I came across your profile" (overused, instant-template signal)
- Reference their company or a specific signal if possible
- NO URLs (LinkedIn flags as spam)

### Follow-up message 1 (after connection accepted)
- Lead with the signal — what you noticed, not who you are
- One sentence on what it implies for them
- Soft CTA: a question, not a demo ask
- **Under 150 words**

### Follow-up message 2 (3-5 days after message 1, no reply)
- Don't just "follow up" — add a new angle or piece of info
- Can reference something they posted, shared, or commented on
- One-line ask at the end
- **Under 100 words**

## Process

1. Confirm ICP, signal, angle, persona are clear
2. Draft connection request note. Check: < 300 chars, no pitch, no URLs.
3. Draft follow-up 1: signal-led, specific, one question CTA
4. Draft follow-up 2: new angle or social proof, one-line close
5. Check all three against LinkedIn rules above

## Output format

```
LinkedIn sequence: [hypothesis name]
Persona: [role] @ [company type]
Signal: [what triggered this]

CONNECTION REQUEST NOTE ([n] chars / 300 max)
---
[message]
---

FOLLOW-UP 1 — After connection accepted
---
[message]
---
Word count: [n] / 150 max

FOLLOW-UP 2 — Day 3-5 if no reply
---
[message]
---
Word count: [n] / 100 max
```

## Pass criteria

- Connection request: < 300 chars, no pitch, no URL
- Follow-up 1: < 150 words, signal-led, CTA is a question
- Follow-up 2: < 100 words, new angle (not "just following up"), one-line CTA
- Tone is warmer + softer than equivalent email (LinkedIn is the relationship channel)

## Common failures

- **Pitching in connection request** — kills acceptance rate. The note is to get accepted, not to sell.
- **"I came across your profile"** — flagged as template by LinkedIn users immediately
- **Pasting LinkedIn's default note** ("I'd like to add you to my network") → 0% acceptance lift
- **Same tone as email** — LinkedIn is softer. "Worth a 15-min chat?" → "would this be relevant to you?"
- **Including URLs** — LinkedIn down-ranks messages with links

## What to do after

- Run `clusters/campaign-ops/tasks/audit-linkedin-profile.md` BEFORE running this sequence at scale — weak profile = weak acceptance rate, even with great copy
- Coordinate with email via `clusters/sequences/tasks/design-multi-channel.md`
- If acceptance rate < 30% after 100 connection requests, the note OR the targeting is wrong — diagnose:
  - Open the note, paste it into the audit, look for a specific reason for low acceptance
  - Check if the persona is right (junior reports often get high acceptance, decision-makers lower — adjust by persona)

## Deeper knowledge

- Multi-channel coordination (email + LinkedIn timing) → `tasks/design-multi-channel.md`
- Sender's profile readiness → `clusters/campaign-ops/tasks/audit-linkedin-profile.md`
- ATL (executive) vs BTL (IC) tone differences for LinkedIn → `clusters/cold-email/knowledge/atl-btl-messaging.md`
