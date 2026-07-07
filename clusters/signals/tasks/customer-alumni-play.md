# Task: Customer Alumni Play

Turn past customer champions (people who used your product at a previous job) into a high-intent, always-on outbound pipeline. Reported uplift: **3-5x reply rates** + **15-30% qualified-pipeline lift per quarter** vs cold outbound, without additional headcount.

**Visual reference:** `visual-library/the-customer-alumni-play.md` — full workflow diagram showing Closed Won Accounts (HubSpot) → Find past employees (Clay) → Qualify new company (Clay) → Score (ChatGPT) → Tier 1 (Manual Prospecting via HubSpot) / Tier 2 (Auto Email + LinkedIn via Instantly + HeyReach) / Tier 3 (Auto Email via Instantly).

## When to use this

User asks to:
- Reconnect with past customers / champions / users
- Find people who used your product and moved companies
- Build "warm outbound" without a content/marketing engine
- "Where are the highest-intent leads we're not tracking?"

## Why this signal works

Customer alumni = three signals stacked:
1. **Built-in trust** — already experienced product, no credibility gap
2. **Internal influence** — can advocate internally, often becomes champion instantly
3. **Perfect timing** — job change aligns with new budget cycle + tool evaluation + urge for quick wins

Unlike cold outbound, you're not introducing yourself. You're continuing a conversation with someone already convinced — they just have a new email, new team, new budget.

## Inputs required

- Access to HubSpot or Salesforce (closed-won history)
- Clay workspace with "Include Past Companies" / "Find People Who Worked at [Company]" feature
- Defined ICP tier rubric (Tier 1/2/3 with explicit criteria)
- Outreach platforms: Instantly (email) + HeyReach (LinkedIn) + AE assignment workflow in CRM

## Process

### Step 1 — Build the Alumni Seed List

Export all **closed-won deals from the past 12-24 months**:
- Company name
- Company domain
- Deal value (ARR/ACV) — for prioritizing high-value alumni later
- All primary buyer contacts (champions, decision-makers, key users — not just deal owner)

Combine into the **Alumni Seed List**. This is your hidden goldmine — every contact already understands your value proposition.

**Cleanup pass before Clay:**
- Remove bounced/inactive emails
- Verify current LinkedIn profiles
- Tag by role (champion / decision-maker / user) for later segmentation

### Step 2 — Find them now (via Clay)

In Clay, use **"Include Past Companies"** in people-search:
1. Select "Include Past Companies" filter
2. Upload Alumni Seed List as the company filter
3. Pull everyone who *previously* worked at those accounts
4. **Eliminate anyone who still works there** (keep only past employees)
5. Filter for qualified titles (RevOps, GTM, Product, Data, Leadership, etc.)
6. Capture: new company + new role + seniority + job-change recency + LinkedIn URL

**Optimal recency filter: 90-180 days post-job-change.**
- Too early (< 30 days): not yet settled, no buying authority
- Too late (> 180 days): honeymoon over, urgency faded
- 90-180 days = the sweet spot — they're in onboarding mode, looking for tools, fresh budget cycle

### Step 3 — Qualify their NEW company

Just because someone used your product at Acme doesn't mean their new company at Newco is ICP.

In Clay, enrich each alumni's new company with:
- Industry + sub-industry (relevance + use-case alignment)
- Headcount + revenue range (sales motion fit)
- Funding data (active budget signal)
- Tech stack + integrations (compatibility + competitor check)
- **AI-generated ICP match score** (Tier 1-3 rubric)

Strip non-Tier-1/Tier-2 accounts before proceeding.

### Step 4 — Apply point-based tier scoring

A published rubric (adapt the weights to your model). Score each new company:

| Dimension | Score |
|---|---|
| **Geo** | UK +5, EU +3, US 0 |
| **Headcount** | 50-500 +5, 500-2000 +3, else 0 |
| **Industry match** | ICP vertical +5, adjacent +2, non-ICP 0 |
| **Funding** | Series A-C +4, Seed +1, late stage +2 |
| **Tech stack** | Complementary +3, competitor -3 |

**Tiering thresholds:**
- **Tier 1:** 12+ points
- **Tier 2:** 6-11 points
- **Tier 3:** 0-5 points

This is a starting calibration. Adjust weights to reflect your ICP — but **publish the explicit rubric** rather than handwaving "Tier 1 / Tier 2 / Tier 3 by feel."

Optional: Run an LLM pass (ChatGPT or Claude) over the enriched dataset for a sanity-check confidence score + 1-2 line reasoning per account + negative flags ("uses direct competitor", "service business", "outside ICP vertical").

### Step 5 — Route to tiered outreach

| Tier | Motion | Tools |
|---|---|---|
| **Tier 1** | Human-led LinkedIn + email; AE-assigned via HubSpot task | HubSpot tasks, AE LinkedIn DM, AE email |
| **Tier 2** | Automated multichannel | Instantly (email) + HeyReach (LinkedIn) |
| **Tier 3** | Automated nurture-only | Instantly drip campaigns |

HubSpot workflow logic:
- Tier 1 scored contact → create AE task with the alumni context (former company + new company + ICP score reason)
- Tier 2/3 → auto-sync into pre-built Instantly/HeyReach sequences

### Step 6 — Run it on a schedule

The play is **always-on**, not a one-shot campaign:
- Re-run Clay search weekly (or daily for high-velocity teams)
- New job changes trigger fresh alumni leads automatically
- HubSpot workflows route them without manual intervention

## Output format

A live HubSpot view + Slack notification per Tier 1 alumni signal:
- **Slack alert payload:** former-employer + new-company-name + new-role + ICP tier + reason + LinkedIn URL + AE assigned

## Pass criteria

- Alumni Seed List has at least 50 verified past customer contacts
- Clay job-change recency filter set to 90-180 days
- Scoring rubric explicit (no "Tier 1 by feel")
- Tier 1 routing creates HubSpot tasks (not just Slack alerts that get ignored)
- Re-run cadence defined (weekly minimum)

## Common failures

- **Static seed list** — built once, never refreshed. Set a Clay re-run on schedule.
- **No recency filter** — capturing job changes from 2 years ago = stale. Use 90-180 days.
- **Forgetting to strip "still at original company"** — Clay's default "Include Past Companies" can return current employees. Verify the filter.
- **Tier 1 = Slack alert only** — alerts get muted. Tier 1 needs an AE task in CRM with the context attached.
- **Treating new-company ICP as same as old-company ICP** — the alumni person is warm; the new company may not be ICP. Score the new company independently.

## Reported benchmarks

- **3-5x higher reply rates** than cold list outbound
- **15-30% increase in qualified pipeline per quarter** without additional headcount, tools, or budget
- "Shorter sales cycles" (qualitative — alumni know the product so discovery is faster)

## What to do after

- Customer alumni signal can be combined with other signals (e.g., alumni at a target account where there's also a website-visit signal = very Hot)
- Feed alumni signal into the broader signal architecture: `clusters/signals/knowledge/signal-activation-architecture.md`
- For more 3rd-party signal classes: `clusters/signals/knowledge/engagement-on-external-content.md`

## Tools

- **HubSpot** (or Salesforce) — closed-won export
- **Clay** — "Include Past Companies" people-search + enrichment + scoring
- **ChatGPT / Claude** — AI sanity-check on new-company ICP fit
- **Instantly** — Tier 2/3 email automation
- **HeyReach** — Tier 2/3 LinkedIn automation
- **BetterContact** — Tier 1 phone enrichment (if cold-calling is in the play)

## Source

Workflows.io "The Customer Alumni Play" workflow + "Customer Alumni Outreach" blog, 2026-05-13 crawl.
