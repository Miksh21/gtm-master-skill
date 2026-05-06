# Task: Design a Multi-Channel Sequence

Recipe for designing a coordinated email + LinkedIn outreach sequence — with correct timing, channel order, conditional logic across both channels.

## When to use this

User asks to build a multi-channel sequence, coordinate email + LinkedIn touchpoints, plan combined outreach for a hypothesis, or layer LinkedIn on top of an email-only campaign.

## Inputs required

- Hypothesis name + ICP
- Email sequence already written (or reference `clusters/cold-email/tasks/write-first-email.md` to write it)
- LinkedIn sequence already written (or reference `tasks/write-linkedin-sequence.md` to write it)
- Sending tools available (Instantly/PlusVibe for email, Heyreach/Expandi for LinkedIn)

## Multi-channel principles

- Email and LinkedIn are not duplicates — they support each other
- **Email is for the argument. LinkedIn is for the relationship.**
- NEVER send the same message on both channels on the same day
- Use LinkedIn to warm up before email at scale — connection before sequence
- After a positive email reply → switch to LinkedIn DM for the conversation (warmer, less pressure)
- After LinkedIn connection → reference it in the email sequence ("I saw we connected on LinkedIn")

## The default 14-day flow

```
Day 0:  LinkedIn — connection request (use clusters/sequences/tasks/write-linkedin-sequence.md for the note)
Day 2:  Email — Step 1 (signal opener; if LinkedIn not accepted, omit reference)
Day 3:  LinkedIn — if accepted, send follow-up message 1
Day 5:  Email — Step 2 (problem expand)
Day 7:  LinkedIn — follow-up message 2 (if no email reply yet)
Day 10: Email — Step 3 (final email, direct close)
Day 14: LinkedIn — soft close or resource share (if no response on either channel)
```

**Persona-based timing adjustments:**
- Founders → faster on LinkedIn (Day 0 LinkedIn, Day 1 email)
- VPs of Sales → faster on email (start with email Day 0, layer LinkedIn Day 3)
- ICs / Managers → standard 14-day flow

## Process

1. Confirm both sequences are written and stress-tested (8.1+ on `clusters/cold-email/tasks/stress-test-sequence.md`)
2. Map each touchpoint to a day + channel
3. Add coordination notes: what changes in the email if LinkedIn was accepted; what changes if email got a reply
4. Identify decision points: at what point do you go single-channel if one isn't working?
5. Return the full orchestration map with conditional logic

## Output format

```
Multi-channel sequence: [hypothesis name]
ICP: [role] @ [company type]
Total duration: [n] days | [n] touchpoints

SEQUENCE MAP
Day | Channel  | Step | Message summary | Condition
0   | LinkedIn | CR   | Connection note  | Always
2   | Email    | 1    | Signal opener    | If LinkedIn not accepted
3   | LinkedIn | FU1  | First follow-up  | If connection accepted
5   | Email    | 2    | Problem expand   | If no email reply
7   | LinkedIn | FU2  | New angle        | If no reply either channel
10  | Email    | 3    | Direct close     | If no reply
14  | LinkedIn | FU3  | Resource / close | If no reply either channel

CONDITIONAL LOGIC
- If email reply received → pause LinkedIn sequence
- If LinkedIn reply received → pause email sequence, switch to LinkedIn DM
- If connection not accepted by Day 5 → proceed email-only

PLATFORMS
Email via:    [Instantly / PlusVibe / Smartlead]
LinkedIn via: [Heyreach / Expandi / manual]

COORDINATION CHECK
- No same-day duplicates: ✓
- LinkedIn note + email Day 2 reference each other naturally: ✓
- Email Step 3 acknowledges LinkedIn touches: ✓
```

## Pass criteria

- Both sequences stress-tested independently before orchestration
- No same-day duplicate touches
- Conditional logic explicit (not "we'll figure it out")
- LinkedIn note is < 300 chars, no pitch
- Email Step 1 stands alone (works with or without LinkedIn acceptance)

## Common failures

- **Multi-channel without proven email** — LinkedIn doesn't fix bad targeting. Add LinkedIn ONLY to Tier 1 hypotheses already proven on email-only.
- **Same content on both channels** — defeats the purpose. Email = argument, LinkedIn = relationship.
- **No conditional logic** — sending email Step 2 to someone who already replied = unprofessional and burns the relationship
- **Platform mismatch** — running email through Heyreach or LinkedIn through Smartlead = wrong tool

## What to do after

- Wire into platforms via `clusters/campaign-ops/tasks/setup-campaign-platform.md`
- For coordination at scale (multi-rep, multi-account) → consider trigger.dev / n8n automation
- Track per-channel reply rate separately — if LinkedIn drives 90% of replies, the email sequence may be the wrong channel for this persona

## Deeper knowledge

- LinkedIn-specific rules (300-char limit, acceptance rate, profile readiness) → `tasks/write-linkedin-sequence.md`
- Sequence theory + value prop rotation across steps → `clusters/cold-email/knowledge/copywriting-sequences.md`
- LinkedIn profile audit (run before LinkedIn sequence at scale) → `clusters/campaign-ops/tasks/audit-linkedin-profile.md`
