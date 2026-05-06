# Task: Score & Stack Multiple Signals

Recipe for combining multiple signals on the same account into a single heat score that drives action and SLA.

## When to use this

User has signal data on accounts and wants to: build a heat-score dashboard, set SLA tiers (red-hot vs warm), design Cool→Warm→Hot transitions, decide who routes to AE vs SDR vs marketing nurture.

## Inputs required

- List of accounts with detected signals (output of `tasks/detect-signals-from-list.md`)
- Signal-to-action map (from `tasks/map-signals-to-icp.md`)
- Sales team capacity (how many AE-touch leads/week is realistic?)
- Optional: existing weighting preferences

## Default scoring weights

Each signal type gets a base weight + a recency multiplier:

| Signal type | Base weight | Recency mult (< 30d) | (30-60d) | (60-90d) | (> 90d) |
|---|---|---|---|---|---|
| New decision-maker (CRO/VP Sales) | 50 | 1.5x | 1.0x | 0.5x | 0.2x |
| Funding round | 40 | 1.5x | 1.0x | 0.5x | 0.2x |
| Hiring target persona's team | 35 | 1.5x | 1.0x | 0.5x | 0.2x |
| Pricing page visit (intent data) | 30 | 2.0x | 1.0x | 0.3x | 0 |
| Tech stack change | 25 | 1.5x | 1.0x | 0.5x | 0.2x |
| LinkedIn engagement on your content | 20 | 2.0x | 1.0x | 0.3x | 0 |
| Headcount growth >20% | 20 | 1.0x | 1.0x | 0.5x | 0.2x |
| Competitor signal (churn, outage, price hike) | 15 | 2.0x | 1.0x | 0.3x | 0 |

**Stack bonus:** If 3+ signals stack on the same account, multiply total by 1.3.

## The 5-tier heat scale + SLAs

| Score | Heat | Action | SLA |
|---|---|---|---|
| **150+** | 🔥 Red Hot | Immediate manual outreach by AE | < 1 hour |
| **100-149** | Hot | SDR personalized sequence | < 24 hours |
| **50-99** | Warm | Automated nurture + SDR monitoring | < 72 hours |
| **20-49** | Cool | Marketing nurture campaigns | This week |
| **0-19** | Cold | Monitor for signal changes | Ongoing |

## Process

1. For each account, list all detected signals
2. Apply base weight × recency multiplier per signal
3. Sum
4. If 3+ distinct signals → apply 1.3x stack bonus
5. Assign heat tier
6. Generate routing recommendation (which person owns it, what cadence)

## Output format

```
Multi-signal scoring: [list / hypothesis]
Date: [date]
Accounts scored: [n]

🔥 RED HOT ([n]) — AE must touch within 1 hour
[Company] | Score: [n] | Signals: [list with weights] | AE owner: [name]

HOT ([n]) — SDR sequence within 24h
[same format]

WARM ([n]) — Automated nurture
[summary count + top 5]

COOL ([n]) — Marketing nurture
[count only]

COLD ([n]) — Monitor
[count only]

STACK BONUS APPLIED to: [n] accounts ([list of top 3])

Capacity check: [Is # of red-hot/hot leads realistic for current sales capacity? if not, raise threshold]
```

## Pass criteria

- Red Hot accounts ≤ AE capacity (don't generate leads sales can't action)
- Stack bonus correctly applied (3+ distinct signals on same account)
- Recency multipliers actually applied (don't score all signals equally)
- SLAs are operational (named owner, not "the team")

## Common failures

- **Equal weighting all signals** — funding ≠ LinkedIn engagement; weight accordingly
- **Ignoring recency** — a 6-month-old funding signal scored same as fresh = false hot leads
- **No capacity check** — generating 50 red-hot leads when AE can handle 10 = SLA failure within a week
- **Missing stack bonus** — multi-signal is the whole point of stacking; without the 1.3x bonus, single-signal noise wins

## What to do after

- Red Hot → AE manual outreach (can include `clusters/cold-email/tasks/write-first-email.md` for initial draft, but AE owns the conversation)
- Hot → SDR sequence via `clusters/sequences/tasks/design-multi-channel.md`
- Warm → automated nurture via `clusters/cold-email/tasks/write-first-email.md` standard template
- Track conversion rate by tier in `clusters/campaign-ops/tasks/weekly-report.md` to recalibrate weights

## Deeper knowledge

- Full scoring framework with custom weights, GTM plays per signal stack, SLA design → `knowledge/signal-scoring.md`
- 11 executable GTM plays (funding, hiring, website visitors, tech changes, competitor signals, content engagement, multi-signal campaigns) → `knowledge/examples/signal-campaigns/gtm-plays.md`
