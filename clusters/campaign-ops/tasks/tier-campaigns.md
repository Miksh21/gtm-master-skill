# Task: Tier Active Campaigns (Scale / Optimize / Kill)

Review all running campaigns, sort into tiers, and stop running what isn't working.

## When to use this

User asks to review campaigns, decide what to scale vs kill, sort hypotheses by performance, or plan next week's outbound focus. Run weekly.

## Inputs required

- Performance data per campaign (reply rate, interest rate, open rate)
- List of active campaigns with hypothesis names
- Number of sends per campaign (need ≥ 50 for tier assignment)

## Performance thresholds

| Tier | Interest rate | Action |
|---|---|---|
| **Tier 1 — Scale** | > 30% | Add LinkedIn as 2nd channel. Increase volume. Expand list. |
| **Tier 2 — Optimize** | 17-30% | Tweak copy. Test new subject. New CTA. Don't kill yet. |
| **Kill** | < 17% (or reply rate < 1%) | Pause immediately. Don't add contacts. Document what failed. |

**Interest rate definition:** % of replies that expressed genuine interest (not OOO, not unsubscribe, not "not interested").

## Process

1. Pull campaign metrics via MCP
2. Filter out campaigns with < 50 sends (insufficient data)
3. Calculate interest rate: (interested replies / total replies) × 100
4. Assign tier per thresholds
5. For Tier 1: suggest specific scale actions
6. For Tier 2: suggest ONE specific optimization to test
7. For Kill: identify the most likely root cause (targeting, copy, angle, signal quality)

## Output format

```
Campaign tiering review: [date]
Campaigns evaluated: [n] | Excluded (< 50 sends): [n]

TIER 1 — SCALE ([n] campaigns)
[Campaign name] | Sends: [n] | Reply rate: [n%] | Interest rate: [n%]
→ Scale action: [add LinkedIn / expand list / increase volume]

TIER 2 — OPTIMIZE ([n] campaigns)
[Campaign name] | Sends: [n] | Reply rate: [n%] | Interest rate: [n%]
→ Optimize: [specific suggestion — subject line / CTA / opener]

KILL ([n] campaigns)
[Campaign name] | Sends: [n] | Reply rate: [n%] | Interest rate: [n%]
→ Root cause: [targeting / copy / angle / signal quality]

SUMMARY
Scale: [n] | Optimize: [n] | Kill: [n]
Recommended next step: [one action]
```

## Pass criteria

- Every campaign with ≥ 50 sends is tiered (none in limbo)
- Tier 1 campaigns get specific scale actions, not "scale up"
- Tier 2 campaigns get ONE specific change, not a list
- Kill recommendations include root cause attribution

## Common failures

- **Reluctance to kill** — keeping a 12% interest-rate campaign alive wastes attention. Kill is good news.
- **Killing then re-starting same hypothesis** — never. Same hypothesis, same result. Change the hypothesis or don't restart.
- **Tier 2 with no optimization specified** — vague "improve copy" → no action taken. Be specific.
- **Confusing open rate with reply rate diagnosis** — high open + low reply = COPY problem; low open = subject or deliverability problem

## What to do after

- Tier 1 → execute scale action immediately (LinkedIn add via `clusters/sequences/tasks/design-multi-channel.md`; list expansion via `clusters/list-building/tasks/build-prospect-list.md`)
- Tier 2 → run the optimization, then `tasks/run-ab-test.md` to measure
- Kill → document failure mode in hypothesis log; don't restart without changing the hypothesis
- Aggregate result → push to `tasks/weekly-report.md` for stakeholder visibility

## Deeper knowledge

- A/B testing methodology → `tasks/run-ab-test.md`
- Diagnosing reply-rate vs open-rate problems → high open + low reply = copy; low open = subject/deliverability (see `clusters/cold-email/knowledge/deliverability-guide.md`)
