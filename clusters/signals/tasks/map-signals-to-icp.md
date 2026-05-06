# Task: Map Signals to an ICP

Recipe for identifying which buyer signals are actually relevant to a specific ICP — ranked by intent strength, with the tool/method to detect each.

## When to use this

User wants to build a signal tracking plan from scratch, decide which signals to monitor for their ICP, or pick the 8-12 highest-leverage signals to invest in.

## Inputs required

- ICP definition (reference ICP file from `clusters/icp/tasks/build-icp.md`)
- Target personas
- Detection tools available (Clay, Trigify, LinkedIn, Apollo, Crunchbase, BuiltWith, RB2B)

## The signal library — pick 8-12 that fit the ICP

### Leadership signals (highest intent)
- New CRO / VP Sales / CMO hired in last 90 days
- Founder is now running sales directly (no VP)
- Previous decision-maker left — new person in role

### Hiring signals (high intent)
- Actively hiring SDRs → needs outbound infrastructure
- Actively hiring AEs → scaling pipeline, needs more top-of-funnel
- Hiring RevOps / Sales Ops → systematizing GTM
- Paused or closed sales hires → budget pressure (for ROI-positioned offers)

### Growth signals (medium-high intent)
- Raised Series A/B in last 6 months
- Headcount grew 20%+ in last 6 months
- Opened new office or market
- Product launch or major feature announcement

### Technology signals (medium intent)
- Recently adopted or removed a specific tool
- Job descriptions mention a competitor tool
- Tech stack shows a gap your product fills

### Engagement signals (medium intent)
- Someone from the company liked/commented on relevant LinkedIn content
- Company visited your pricing page (if intent data available — RB2B/Trigify/Common Room)
- Downloaded a relevant piece of content

### Timing signals (variable)
- End of fiscal quarter approaching
- Recent layoffs (budget consolidation = opportunity for cost-saver positioning)
- Competitor went down, had outage, raised prices

## Process

1. Review ICP and personas
2. Select the 8-12 most relevant signals from the library above
3. For each signal: identify the best detection method + tool
4. Rank by intent strength (1 = highest)
5. Flag automatable (Clay/Trigify enrichment) vs manual research (LinkedIn deep dive)

## Output format

```
Signal map: [ICP name]
Date: [date]

RANK | SIGNAL                          | DETECTION METHOD          | TOOL              | AUTOMATABLE?
1    | New VP Sales hired (last 90d)   | LinkedIn job change       | Trigify / Clay    | Yes
2    | Actively hiring SDRs            | LinkedIn jobs search      | Clay / Apollo     | Yes
3    | Series A/B raised last 6 months | Funding data              | Crunchbase / Clay | Yes
...

Signals to track automatically: [list]
Signals requiring manual check: [list]

Recommended starting set for first hypothesis wave: [top 3 — don't try to use all 12 at once]
```

## Pass criteria

- 8-12 signals selected (not 3, not 30 — this is the operational sweet spot)
- Each signal has a specific tool + method assigned
- Top 3 are all "Yes" automatable (manual signals can't scale)
- Combined Tier 1 intent (leadership + hiring + growth) covers ≥ 60% of ICP TAM

## Common failures

- **All 12 signals at once** — start with 3 highest-intent. Layer in others after first results.
- **Picking signals you can't detect** — if no tool catches it, it's not a signal, it's a wish
- **Ignoring stack effects** — "new VP Sales + actively hiring SDRs" is much stronger than either alone. Flag stackable pairs.
- **Generic detection method** ("LinkedIn") — name the SPECIFIC search/filter/MCP query

## What to do after

- Top 3 signals → push to `tasks/detect-signals-from-list.md` with current company list
- For multi-signal stacks → `tasks/score-multi-signal.md` to design weighting
- Choose detection tools → `knowledge/tool-setup-guides.md`

## Deeper knowledge

- 137-trigger taxonomy → `knowledge/signal-taxonomy.md`
- Tool comparison + setup (RB2B, Trigify, Common Room, Bombora, Koala, Warmly, 6sense, BuiltWith) → `knowledge/tool-setup-guides.md`
- Job-change tracking deep dive (days 14-45 vendor-amnesty window) → `knowledge/timing/job-change-tracking.md`
