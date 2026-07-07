# Task: Map Total Addressable Market (TAM)

Estimate TAM size for a given ICP, segment by tier, and identify the best starting point + runway.

## When to use this

User asks to map TAM, estimate market size, segment a market before campaign launch, or check whether ABM vs hypothesis-driven outbound is the right motion.

## Inputs required

- ICP definition (from `clusters/icp/tasks/build-icp.md`)
- Target personas (roles to reach)
- Data sources available (Apollo, Sales Navigator, Clay, LinkedIn)

## Process

1. Query Apollo (via MCP or manual search) with ICP filters: industry, headcount range, geography, technology
2. Pull headcount from Sales Navigator as a cross-reference
3. Estimate contacts per company based on persona density (companies of 50-200 typically have 1-2 VPs of Sales)
4. Calculate:
   - Total companies matching ICP
   - Total contacts (companies × avg decision-makers)
   - Reachable contacts (apply ~60% email find rate)
5. Segment into tiers:
   - **Tier 1**: strongest ICP fit + active signal
   - **Tier 2**: strong fit, no active signal yet
   - **Tier 3**: marginal fit (test at lower volume)
6. Estimate runway (months to TAM exhaustion at current send volume)

## Output format

```
TAM Map: [ICP name]
Date: [date]

MARKET SIZE
Total companies:       ~[n]
Total target contacts: ~[n]
Reachable contacts:    ~[n] (60% find rate)

SEGMENTATION
Tier 1 (signal + fit):  ~[n] companies | ~[n] contacts
Tier 2 (fit, no signal): ~[n] companies | ~[n] contacts
Tier 3 (marginal):       ~[n] companies | ~[n] contacts

RUNWAY ESTIMATE
At [n] emails/day → Tier 1 exhausted in [n] months
Full TAM covered in [n] months

Data sources used: [list]
Confidence: [High / Medium / Low] — [reason]

MOTION RECOMMENDATION
[If TAM < 2,000: ABM mandatory. If 2K-20K AND ACV ≥ $50K: ABM recommended (Workflows.io gate —
volume channels can't be relied on in silos below 20K). If 2K-50K at lower ACV: hypothesis-driven
outbound. If 50K+: vertical-first then expand.]
```

## Pass criteria

- 3 tiers populated with both company AND contact estimates
- Confidence flagged honestly (don't claim High when 1 source used)
- Motion recommendation matches TAM size

## Common failures

- **Single-source TAM** — Apollo alone misses 30-40% of non-US ICP fit
- **Ignoring negative ICP** — TAM should exclude disqualifiers from `clusters/icp/`
- **Treating directional as exact** — TAM estimates are ±20%; flag confidence
- **TAM < 2K but running hypothesis-driven** — switch to ABM, custom approach per account

## What to do after

- TAM > 2,000 → `clusters/list-building/tasks/build-prospect-list.md` for first batch
- TAM < 2,000 → ABM motion via `clusters/list-building/knowledge/abm/account-selection-framework.md`
- Re-run TAM mapping every quarter (markets shift, new entrants)
