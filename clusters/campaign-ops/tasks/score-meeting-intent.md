# Task: Score a Reply for Meeting Intent

Read a reply, score its meeting intent, draft the right response, and define the next action.

## When to use this

User received a reply and asks: "what should I send back?", "is this real intent?", "score this reply", "should I push for a meeting?".

## Inputs required

- Original message you sent
- Reply received (paste exact text)
- ICP context

## The 4 intent tiers

### Tier 1 — Book it now (respond within 2 hours)
- Explicitly asks for a meeting / call / demo
- Asks a qualifying question implying intent ("what does pricing look like?", "how long is onboarding?")
- Asks for a case study or proof relevant to their situation
- Forwards to another buying-team member

### Tier 2 — Nurture with one reply (respond same day)
- Says "interesting" or "tell me more" without specifics
- Asks a general product question
- "Send me more info" without specifying what
- Engages with the signal reference ("yes, we just hired 3 SDRs actually")

### Tier 3 — Soft close (respond, leave door open)
- Politely declines but leaves future possibility ("not right now, maybe Q3")
- Says they're evaluating options
- Asks to follow up at a specific time

### Not an opportunity (no further outreach)
- Explicit no with no opening ("we're all set")
- Unsubscribe request
- Wrong person with no referral

## Process

1. Read the reply carefully
2. Assign tier based on language and intent signals
3. Draft the appropriate response
4. Define next action in CRM + campaign platform

## Output format

```
Reply analysis: [name] @ [company]
Date: [date]

ORIGINAL MESSAGE
[summary of what you sent]

THEIR REPLY
"[exact text]"

INTENT TIER: [1 / 2 / 3 / Not an opportunity]
Key signal: [the phrase or word that determined the tier]

RECOMMENDED RESPONSE
---
[drafted reply]
---

NEXT ACTION
CRM:        [create opportunity / add note / mark not interested]
Platform:   [pause sequence / remove from campaign]
Follow-up:  [if applicable, specific date]
```

## Pass criteria

- Tier 1 responses drafted within 2 hours of reply received
- Response style matches tier (Tier 1 = scheduling-direct; Tier 2 = qualifying question; Tier 3 = warm soft close)
- CRM action specified
- Sequence pause/remove explicit (otherwise they get follow-up emails after replying = unprofessional)

## Common failures

- **Tier 1 sitting > 2 hours** — interest decays fast. Speed is the differentiator.
- **Pitching at Tier 2** — "tell me more" needs ONE qualifying question back, not a pitch deck
- **More than one reply at Tier 3** — if first door-open response gets no engagement, close. Don't stack.
- **Keeping in sequence after reply** — pause/remove the contact from the campaign immediately
- **Mostly Tier 2 without Tier 1 conversion** — copy is too vague, signal isn't landing

## What to do after

- Tier 1 → AE handoff with the recommended reply ready to send
- Tier 2 → send qualifying question, monitor for upgrade to Tier 1
- Tier 3 → send soft-close response, set future follow-up date
- Log Tier 1 + Tier 2 in `tasks/weekly-report.md` and the hypothesis-log of `tasks/setup-second-brain.md`

## Deeper knowledge

- Objection handling for Tier 3 replies → `clusters/objections/tasks/handle-objection.md`
- Re-engagement for Tier 3 follow-ups when the agreed date arrives → `clusters/cold-email/tasks/write-followup.md` Type D
