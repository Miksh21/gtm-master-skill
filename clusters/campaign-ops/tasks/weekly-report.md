# Task: Generate the Weekly Campaign Report

Pull metrics across all active campaigns, generate a structured performance report, surface the ONE most important action this week.

## When to use this

User asks for the weekly outbound report, monthly summary, client briefing, or stakeholder update on campaign status.

## Inputs required

- Sending platform access via MCP (PlusVibe / Instantly / Smartlead)
- Reporting period (default: last 7 days)
- Internal report vs client-facing (changes tone + level of detail)

## Report sections (in order)

1. **Executive summary** — 3 bullets max, plain language
2. **Campaign performance table** — every active campaign with key metrics
3. **Tier movements** — campaigns moving up or down since last report
4. **Top performer** — single best campaign + why it worked
5. **Key insight** — ONE pattern across campaigns
6. **Recommended action** — ONE specific thing to do this week

## Process

1. Pull metrics for the reporting period via MCP
2. Calculate open rate, reply rate, interest rate per campaign
3. Run `tasks/tier-campaigns.md` to assign tiers
4. Compare tiers to last week's (if data) — surface movements
5. Identify top performer + extract what made it work (signal + persona + angle)
6. Synthesize ONE key insight from cross-campaign patterns
7. Recommend ONE specific action

## Output format

```
Outbound Report: [week / date range]
Generated: [date]
Prepared by: Claude Code

EXECUTIVE SUMMARY
• [Key result 1]
• [Key result 2]
• [Key result 3]

CAMPAIGN PERFORMANCE
Campaign | Sends | Opens | Replies | Interested | Tier
[name]   | [n]   | [n%]  | [n%]    | [n%]       | [1/2/Kill]
...

Total pipeline: [n] interested leads this period

TIER MOVEMENTS (vs last report)
Moved to Tier 1: [campaigns]
Moved to Tier 2: [campaigns]
Killed:          [campaigns]

TOP PERFORMER
Campaign:      [name]
Interest rate: [n%]
Why it worked: [signal + persona + angle that drove results]

KEY INSIGHT
[One pattern observed across campaigns — e.g. "SDR-hiring signal is outperforming new-CRO signal 2:1 this week"]

RECOMMENDED ACTION THIS WEEK
[Specific action — campaign to scale, test to run, copy to change, signal to add]
```

## Pass criteria

- Executive summary readable in 30 seconds
- ONE recommended action — not three "things to consider"
- Top performer explanation cites specific signal + persona + angle (not "good copy")
- Key insight is something NEW, not a restatement of metrics
- Client-facing version: replace internal tier labels with plain-language descriptors

## Common failures

- **Multi-action recommendations** — "consider testing X, Y, and Z" → operator paralysis. Pick ONE.
- **No key insight** — without a pattern observation, the report is just a dashboard
- **"Good week / bad week" framing without diagnosis** — what specifically caused this week's number?
- **Declining interest rate week-over-week NOT flagged prominently** — leading indicator of list exhaustion; surface it loudly

## What to do after

- Recommended action → execute via the relevant cluster (scale = `tasks/tier-campaigns.md` Tier 1 actions; test = `tasks/run-ab-test.md`; copy change = `clusters/cold-email/tasks/*`)
- Schedule report to run automatically every Monday morning (trigger.dev / n8n / cron)
- Archive each report — patterns across reports become institutional memory
