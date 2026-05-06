# Task: Re-Engage Cold / Closed-Lost Leads

Recipe for restarting a conversation with a contact who went cold 3+ months ago, or a lead that closed-lost. Different from a follow-up — this is a fresh cold sequence with a reference to prior contact, not a continuation.

## When to use this

- Lead went silent 3+ months ago after at least one engaged interaction
- Closed-lost deal where the disqualifier may have changed (timing, budget, competitor)
- Old MQLs, expired trials, churned customers worth a second look
- Old list of "interested but not ready" contacts

If the contact engaged within the last 30-60 days, use `clusters/cold-email/tasks/write-followup.md` instead — that's a follow-up, not a re-engagement.

## Inputs required

- **Contact's prior context** (what was discussed, why it didn't close, how long ago)
- **What's changed since** — at least one of: new product feature / new case study / new pricing / new market signal / change at their company
- **Their current company / role status** (still at same company? same role?) — verify before sending
- **Original campaign signal** (so the new sequence can use a different angle)

If the contact has changed companies or roles, treat as a NEW cold sequence (use `clusters/cold-email/tasks/write-first-email.md`) — re-engagement assumes continuity.

## Principles (non-negotiable)

- **Lead with what's changed, not "circling back"** — "circling back" is the most overused re-engagement opener and signals nothing happened on your end
- **Reference the prior conversation specifically** — date, topic, or what they said. Vague references ("we spoke a while back") signal you don't actually remember.
- **Use a NEW angle** — if the original pitch failed, the same pitch will fail again. Rotate the value prop.
- **Treat them as warm-cold, not warm** — they need to be re-sold, not just re-asked
- **No-oriented question outperforms ask** — "Are you still on Salesforce?" beats "Want to chat?"
- **Maximum 2-touch sequence** — if no reply after 2 touches, close the thread. Don't restart again.

## Process

1. Verify the contact is still at the same company in the same role (check LinkedIn). If they've moved, switch to a new cold sequence using their new context.
2. Identify the disqualifier from the prior interaction:
   - **Timing** ("not now") → reference the timing they named, ask if it's changed
   - **Budget** → reference what's new in your offer (lower-tier plan, new ROI proof)
   - **Competitor / no priority** → reference market change or competitor news
   - **Wrong stakeholder** → reference org change or new champion
3. Identify what's NEW on your side worth referencing. Without something new, do not send.
4. Pick the angle:
   - **Type R1 — "What's changed on our side"**: new feature / new pricing / new case study relevant to their original objection
   - **Type R2 — "What's changed on your side"**: trigger event at their company (funding, hiring, product launch, exec change)
   - **Type R3 — "What's changed in the market"**: regulation, competitor news, industry shift that re-frames the problem
5. Draft a 2-touch sequence:
   - **Touch 1** — reference prior conversation specifically + one new piece of info + no-oriented question
   - **Touch 2** (5-7 days later) — different angle, shorter, soft close ("worth picking back up or should I close the loop?")
6. Self-check:
   - Did I name the prior conversation specifically? (date or topic, not "a while back")
   - Did I lead with what's changed?
   - Is the question no-oriented?
   - Is touch 2 a different angle from touch 1?

## Output format

```
RE-ENGAGEMENT — [contact name @ company]
Last contact: [date]
Prior disqualifier: [timing / budget / competitor / wrong stakeholder / other]
What's changed: [one line — new feature / their hiring / market shift / etc.]
Angle type: [R1 / R2 / R3]
Status verified: [LinkedIn checked — same role / changed → switch to new cold sequence]

TOUCH 1 — Email — Day 1
Subject: [Re: original thread subject if available, OR new < 6 word subject]
---
[message — references prior conversation, leads with what's new, no-oriented question]
---
Word count: [n]

TOUCH 2 — Email — Day 6
Subject: Re: [touch 1 subject]
---
[message — different angle, shorter, soft close]
---
Word count: [n]

Close rule: If no reply after Touch 2, mark as nurture or remove. Do not restart again.
```

## Pass criteria

- Prior conversation referenced specifically (date or topic)
- Something genuinely NEW is referenced — not a repackaging of the original pitch
- No "circling back" / "checking in" / "wanted to follow up" openers
- Touch 1 ends in a no-oriented question
- Touch 2 uses a different angle from touch 1
- Sequence is exactly 2 touches, not more

## Common failures

- **"Just circling back"** — kill the sequence, you have nothing new to say
- **Same pitch, different month** → if you can't find what's changed, this isn't a re-engagement; it's a re-pitch and it'll fail
- **Re-engaging contact who left the company** → wasted send, verify role status first
- **Pushing past 2 touches** → after 2 silent touches, the answer is no for now. Stacking doesn't help.
- **Treating them like a fresh cold lead** → if you ignore the prior context, you lose the only edge you have

## What to do after

- If reply is positive → branch to `clusters/cold-email/tasks/write-followup.md` Type C (interested, get to a meeting fast)
- If no reply after Touch 2 → mark as nurture, set re-evaluation in 6 months
- Track re-engagement reply rate separately from cold reply rate — different baseline (typically 8-15% reply rate vs 5-10% cold)

## Deeper knowledge (load only when needed)

- Full re-engagement template library → `clusters/cold-email/knowledge/email-templates-library.md`
- Sequence theory and value-prop rotation logic → `clusters/cold-email/knowledge/copywriting-sequences.md`
