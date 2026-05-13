# Task: Build an ICP from Scratch

Recipe for producing a structured, reusable ICP definition from existing customer knowledge, call recordings, or win/loss data. Output is a markdown file every other cluster can reference.

## When to use this

User asks to define their ICP, build an ideal customer profile, structure ICP documentation, or clarify "who should we target".

## Inputs required

- Description of best current customers (3-5 minimum)
- ANY of: sales call recordings/transcripts, win/loss notes, industry intuition, founder description of who buys
- One sentence: "What problem we solve and for whom"

## The 8 calibration questions (ask if inputs are thin)

1. Who are your 3 best customers right now — what do they have in common?
2. Who do you lose deals to most often, and why?
3. What does the prospect say in the first call that makes you think "this is perfect"?
4. What's the typical team size/structure that gets value fastest?
5. What signals tell you a company needs you right now vs. in 6 months?
6. What roles are involved in the buying decision?
7. What is the one sentence your best customer would use to describe your value?
8. What type of company is a waste of time, even if they match on paper?

## Process

1. Collect inputs. If thin (< 3 customer descriptions OR no founder sentence), run the 8 questions before drafting.
2. Synthesize into the structured dimensions below
3. Add **negative ICP** (disqualifiers — equally important as positive criteria)
4. Output as a reusable markdown file the user can reference across all GTM work
5. **Backtest the ICP against historical deals** (see "Backtest validation" below — this is the step most ICPs skip and the reason most ICPs predict nothing).

## Backtest validation (skipped at your peril)

An ICP is just a hypothesis until you check whether it predicts actual deal outcomes.

**Process:**
1. Export 12-24 months of Closed Won + Closed Lost from CRM (HubSpot / Salesforce).
2. Score every past account against the new ICP rubric → assigns Tier 1 / Tier 2 / Tier 3.
3. **Check: do wins cluster in Tier 1 and losses cluster in Tier 3?**
4. If not, refine signals + thresholds until tiers correlate with real ACV, win rates, and cycle length.

**The validation criterion:**
> "Wins should cluster in Tier 1. Losses should cluster in Tier 3."

If your model says a closed-won was Tier 3, either the model is wrong or that customer is going to churn — both worth investigating.

**Outcome:** An ICP that *predicts* close rate and contract size, not based on assumptions.

For backtest tooling: enrich historical accounts in Clay with firmographics + technographics + growth + intent data, apply the scoring rules, run the cluster analysis.

## Output format

```
# ICP Definition: [Company Name]
Last updated: [date]

## Firmographic fit
- Industry: [list]
- Company size: [headcount range]
- Revenue stage: [e.g., Series A–C / $5M–$50M ARR]
- Geography: [list]
- Business model: [B2B SaaS / Agency / Services / etc.]

## Technographic fit
- Uses: [tools that indicate fit]
- Likely stack: [CRM, outbound tools, etc.]

## Persona fit
- Primary: [role] — [why this person buys]
- Secondary: [role] — [influence/blocker context]

## Situational fit (when they need you NOW)
- [Signal 1]
- [Signal 2]
- [Signal 3]

## Negative ICP (disqualifiers)
- [Company type or situation to skip]
- [Characteristic that predicts churn or no-close]

## One-sentence value for this ICP
"[What you do] for [who] so they can [outcome]."
```

## Pass criteria

- All 6 sections populated (firmographic, technographic, persona, situational, negative, one-sentence value)
- At least 3 disqualifiers in negative ICP
- One-sentence value passes the "your customer would say this verbatim" test
- **Backtest run + validated**: wins cluster in Tier 1, losses cluster in Tier 3

## Common failures

- **Too broad** ("B2B SaaS, 50-500 employees, US") — narrow until 3 specific verticals or signals are named
- **No negative ICP** — without disqualifiers the ICP is aspirational, not operational
- **Generic value sentence** ("we help companies grow") — rewrite with the customer's own words from calls
- **Skipped the call recordings** — if recordings exist and you didn't use them, you missed the highest-signal input

## What to do after

- This file is the input to: `tasks/validate-against-icp.md`, `clusters/signals/tasks/*`, `clusters/personas/tasks/build-persona.md`, `clusters/list-building/tasks/build-prospect-list.md`, `clusters/cold-email/tasks/write-first-email.md`
- Revisit after every 20 closed deals — ICPs drift

## Deeper knowledge

- ICP scoring matrix theory + tier weights → `clusters/list-building/knowledge/sales-navigator-guide.md`
- ABM account selection (TAM under 2K) → `clusters/list-building/knowledge/abm/account-selection-framework.md`
