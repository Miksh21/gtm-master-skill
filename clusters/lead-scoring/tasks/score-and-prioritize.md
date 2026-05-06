# Task: Score & Prioritize Leads

Recipe for ranking a contact list by conversion likelihood — combining ICP fit, signal strength, and persona authority into a single score. Output is a prioritized queue.

## When to use this

User asks to score leads, rank prospects, prioritize a contact list, decide who to contact first, or build a "who to call today" queue.

## Inputs required

- Contact list with company + role data
- ICP definition (from `clusters/icp/tasks/build-icp.md`)
- Signals detected (from `clusters/signals/tasks/*` — if not done, run first)
- Optional: custom scoring weights (use defaults below)

## The scoring model (max 100 points)

### ICP fit (max 40 points)
- Industry match: 0 / 10 / 20 (no / partial / full)
- Size match: 0 / 10 / 20 (no / partial / full)

### Signal strength (max 40 points)
- No signal: 0
- Weak/indirect signal: 10
- Clear signal, 60-90 days old: 20
- Strong signal, under 60 days old: 30
- **Multiple signals present (signal stack): 40**

### Persona authority (max 20 points)
- Influencer only (e.g., manager): 5
- Strong influencer (e.g., Director): 10
- Decision-maker (e.g., VP, Head of): 15
- Economic buyer (e.g., CRO, CFO, CEO): 20

## Tier assignment

| Tier | Score | Action | SLA |
|---|---|---|---|
| **Tier 1** | 70-100 | Priority sequence + manual review | Send within 48 hours |
| **Tier 2** | 40-69 | Standard sequence | Send within 1 week |
| **Tier 3** | < 40 | Hold or discard | — |

**Override rule:** A clear economic buyer (20 pts persona) at perfect ICP fit (40 pts) with zero signal still scores 60 — but move them to **Tier 1** anyway. Too valuable to wait for a signal.

## Process

1. Score each contact across the 3 dimensions
2. Sum to get total score
3. Assign tier per the table
4. Apply override rule (economic buyer + perfect ICP)
5. Sort descending by score
6. Cross-check: if EVERYTHING scores 40-50, the list is weak OR weights need calibration

## Output format

```
Lead scoring: [hypothesis / list name]
Date: [date]
Contacts scored: [n]

TIER 1 — Send now ([n] contacts)
[Name] | [Company] | [Role] | Score: [n] | ICP: [n] | Signal: [n] | Persona: [n] | Signal detail: [what]
...

TIER 2 — Queue ([n] contacts)
[same format]

TIER 3 — Hold/discard ([n] contacts)
[summary count only — no need to list individually]

Average score: [n]
Top signal driving Tier 1: [signal name]
List health: [Healthy / Weak — recommendation]
```

## Pass criteria

- Tier 1 ≥ 5% of the total list (if less, signals are too narrow OR list is wrong ICP)
- No Tier 1 lead sits longer than the SLA without contact
- Override rule applied where applicable

## Common failures

- **Treating signal as binary** — strong vs old vs weak vs stack are different scores. Don't collapse them.
- **Ignoring decay** — a list scored 60 days ago is no longer valid. Re-score.
- **No override for economic buyer** — perfect-fit CRO without signal still warrants Tier 1
- **Calibration drift** — if 80% of leads are Tier 2 across multiple lists, the weights are off

## What to do after

- Tier 1 → push to `clusters/cold-email/tasks/write-first-email.md` with signal-specific copy
- Tier 2 → standard cadence via `clusters/sequences/tasks/design-multi-channel.md`
- Tier 3 → either drop OR feed to `clusters/signals/tasks/score-multi-signal.md` to wait for signal trigger
- After 60 days → re-score (signal decay)

## Deeper knowledge

- Signal scoring framework with weights, action thresholds, SLAs → `clusters/signals/knowledge/signal-scoring.md`
- ICP scoring matrix and tier rationale → `clusters/list-building/knowledge/templates/qualification-workflow.md`
