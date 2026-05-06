# Task: Optimize a Call-to-Action

Review and rewrite the CTA in an email or LinkedIn message — easier to say yes, harder to ignore.

## When to use this

User asks to improve a CTA, fix a weak close, reduce friction at the end of a sequence, or troubleshoot low reply rate (high open rate but low reply often = CTA problem).

## Inputs required

- The message + current CTA
- ICP and persona context
- Sequence step (Step 1 / 2 / 3) — the right CTA changes per step
- What action you want the recipient to take

## CTA principles per step

### Step 1 — Low commitment
- Question, not meeting request
- "Would this be relevant to you?" NOT "Can we hop on a call?"
- The goal of Step 1 is a REPLY, not a booked meeting

### Step 2 — Advance the conversation
- Build on prior context
- "Would it be worth a quick 15 minutes?" is appropriate at Step 2
- Reference what they (may have) already read

### Step 3 — Direct
- Last attempt: be clear + specific
- Offer a specific time OR direct booking link
- ONE option, not multiple ("here's my calendar" not "when are you free?")

## CTA red flags (rewrite immediately)

| Red flag | Why |
|---|---|
| "Let me know if you're interested" | Passive, no ask |
| "Would love to connect" | Vague, non-committal |
| "Feel free to book a time" (at Step 1) | Off-putting, premature |
| "I know you're busy, but..." | Apology start = weakness |
| Multiple questions in one CTA | Pick one |

## CTA types by step

| Step | Type | Examples |
|---|---|---|
| **1** | Single yes/no question tied to signal | "Is this a problem you're actively thinking about?" / "Would it be worth sharing how we did this for [similar company]?" |
| **2** | Soft meeting ask | "Worth a 15-minute call to see if this is relevant?" / "Would Tuesday or Wednesday work for a quick chat?" |
| **3** | Direct close | "[Calendly link] — grab 20 minutes if you want specifics." / "Yes or no — should I send the one-pager?" |

## Process

1. Read current CTA. Identify which step it's in.
2. Flag any red flags from the table above
3. Rewrite with 3 variants — one from each CTA type appropriate for the step
4. Score each: specificity (0-2) + low friction (0-2) + alignment with step goal (0-2). Max 6.
5. Return ranked variants + recommendation

## Output format

```
CTA audit: [email step] — [hypothesis]
Current CTA: "[paste current]"
Red flags found: [list]

REVISED OPTIONS
Option 1: "[new CTA]" | Score: [n/6] | [one-line note]
Option 2: "[new CTA]" | Score: [n/6] | [one-line note]
Option 3: "[new CTA]" | Score: [n/6] | [one-line note]

Recommended: Option [n] — [reason]
```

## Pass criteria

- ONE question per CTA, not two
- Step 1 CTA = question, not meeting ask
- Step 3 CTA = ONE specific option (calendar link OR time slot, not "when are you free")
- Top option scores ≥ 4/6
- No red-flag phrases in any of the 3 options

## Common failures

- **Two questions in one CTA** — pick one, the other dilutes
- **Hard ask at Step 1** — "book 30 min" at first touch = ignored
- **"Let me know if you change your mind"** — passive, kills momentum
- **Multi-option close at Step 3** — "any of these times work?" is harder to answer than "Tuesday at 3pm — works?"

## What to do after

- For LinkedIn: CTAs should be ONE sentence max + softer than email equivalents
- If reply rate < 1% but open rate > 40% → CTA is likely the problem (start here, not subject line or body)
- Test new CTA via `tasks/run-ab-test.md` against the current as control
