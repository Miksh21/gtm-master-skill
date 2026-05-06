# Task: Detect Signals From a Company List

Recipe for scanning a company list, finding active buying signals, and returning a tiered list ready for sequencing.

## When to use this

User has a list of companies and wants to find which ones are showing buying signals right now (hiring, funding, leadership change, tool change, etc.). Triggered by "find signals", "scan for hiring", "detect buying triggers", "signal scan".

## Inputs required

- A list of companies (Clay export, CSV, or pasted list)
- Signal type(s) to look for (or use the default 4 types below)
- ICP context so signals can be filtered for relevance

## The 4 signal types

| Type | Examples |
|---|---|
| **Hiring** | "first SDR hire", "Head of RevOps", "VP Sales" — open roles matching target persona or team build-out |
| **Growth** | Recent funding, headcount growth >20% in 6 months, new office, product launch |
| **Tool change** | Job descriptions mentioning specific tools, G2 review activity, tech stack changes |
| **Leadership** | New CRO/VP Sales/CMO in last 90 days — new leaders buy new things |

## Process

1. For each company in the list, query Clay (via MCP) for enrichment data
2. Cross-reference LinkedIn (via MCP) for open roles and recent activity
3. Score signal strength per company:
   - **Strong** — active, specific to target persona, < 60 days old
   - **Weak** — indirect or older (60-90 days)
   - **None** — no detectable signal in the lookback window
4. Filter out "None" companies (they get downgraded to nurture, not removed entirely)
5. Return scored list sorted by signal strength

## Output format

```
Signal scan: [date] — [N companies scanned]

STRONG SIGNALS ([n])
- [Company] | [Signal type] | [Specific evidence] | Tier 1
- ...

WEAK SIGNALS ([n])
- [Company] | [Signal type] | [Specific evidence] | Tier 2
- ...

NO SIGNAL ([n]) — moved to nurture queue, not deleted

Recommended next step: [run ICP validation on Tier 1 / push Tier 1 to score-multi-signal]
```

## Pass criteria

- Every Strong-signal entry has SPECIFIC evidence (not "growing" — say "Series B raised 2026-03-15, 12 SDRs hired since")
- Recency rule: signals older than 90 days = Weak by default
- Tier 1 contains hiring signals for the EXACT target role (highest possible signal)

## Common failures

- **Vague signals** ("they're growing") — push back, demand specific evidence
- **Stale signals** — anything > 90 days is weak; > 180 days is dead
- **Skipping ICP filter** — a hiring signal at a non-ICP company is still noise
- **Treating "no signal" as remove** — keep them in nurture; signals appear weekly

## What to do after

- Strong-signal Tier 1 → `tasks/map-signals-to-icp.md` to verify persona-relevance, then `tasks/score-multi-signal.md` for stack scoring
- Tier 1 with verified ICP fit → `clusters/cold-email/tasks/write-first-email.md` with signal-led opener
- Track which signal types convert best in `clusters/campaign-ops/tasks/analyze-replies.md`

## Deeper knowledge

- 137-trigger signal taxonomy (exhaustive catalog) → `knowledge/signal-taxonomy.md`
- 30-trigger detection-tools matrix (which tool catches each signal, Clay credit cost, freshness rules) → `knowledge/signal-detection-tools.md`
- 6 core buying signals + benchmarks (reply-rate lift per signal type) → `knowledge/buying-signals.md`
