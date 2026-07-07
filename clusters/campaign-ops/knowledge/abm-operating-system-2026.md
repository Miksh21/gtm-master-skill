# ABM Operating System (2026)

The 11-step ABM operating system. Load when designing an account-based motion (not just a "campaign"). Synthesized from the workflows.io 2026 ABM playbook + the narrative companion blog.

**When to load:**
- "Design our ABM motion"
- "How do we run ABM inside HubSpot/Salesforce?"
- "Tier × awareness × signal — how should plays differ?"
- Cross-cluster orchestration question that spans ICP + signals + lead scoring + sequences

**Strategic framing (the one-line summary):**
ABM is **architectural, not theoretical.** "Most teams don't struggle with ABM strategy, they struggle with execution. They know how to define an ICP or build a target list, but few know how to run ABM inside the CRM, automate intent signals, or route real buyer activity to sales in real time."

**The qualification gate (when to recommend ABM at all):** ACV $50k+ AND a constrained addressable market of < 20,000 qualified companies. Below that TAM, volume channels can't be relied on in silos and every % of TAM coverage matters.

**For the hands-on build** (cost math, evergreen CRM enrichment, HubSpot mechanics, channel lessons, the 6 reports): `clusters/campaign-ops/knowledge/abm-engine-implementation.md`.

---

## The 11-step pipeline

```
1. Analyze + backtest CRM data       → win/loss patterns
2. Build ICP model                    → firmographic + technographic + account-fit signals
3. Build broad TAM map                → aggregate sources into Clay
4. Clay enrichment + AI qualification → strip non-qualified
5. Account scoring + tiering          → push tier as property to CRM
6. Operationalize Tier 1-2 audiences  → LinkedIn Ads, HubSpot Ads, buying-committee audiences
7. Contact sourcing + stakeholder map → Decision Maker / Champion / Influencer per account
8. Three-tier signal infrastructure   → 1st / 2nd / 3rd party
9. Awareness-stage lead scoring       → Identified→Aware→Interested→Considering→Selecting
10. Demand gen execution by play type → 1:1 plays (Tier 1) + 1:Many plays (Tier 2/3)
11. Push-back to CRM + monitor        → pipeline, tier movement, awareness shifts, revenue
```

---

## Step 1 — Backtest CRM data

**Closed-won analysis** (most teams skip this):
- Highest spend customers identified
- ACV + sales cycle + expansion revenue analyzed
- AE/CSM interviews extract buying triggers + decision-makers involved

**Closed-lost analysis:**
- Industry mismatches
- Budget issues
- Competitor wins
- Repeated objections

**Output:** Win patterns + loss patterns documented. Inputs feed Step 2.

---

## Step 2 — ICP Model

Three layers:
- **Firmographics** — industry, headcount, revenue, geography
- **Technographics** — tools used, tech stack
- **Account-fit signals** — hiring activity, funding stage, growth signals

For the recipe: `clusters/icp/tasks/build-icp.md`. For backtest validation: ensure wins cluster in Tier 1 and losses in Tier 3 (see Step 5 backtest).

---

## Step 3 — Broad TAM map

Multiple sources triangulated:

**Databases:**
- Apollo
- AI Ark (esp. non-US coverage)
- Ocean.io (lookalike expansion)
- DiscoLike (account discovery)
- Sales Navigator
- StoreLeads (ecommerce-specific)

**Scraping:**
- Apify
- Octoparse
- Serper.dev
- Python (when no API exists)

Aggregate all into Clay → see `clusters/campaign-ops/knowledge/outbound-master-system.md` Step 2 for the Dedupe → Filter → Normalize → Qualify → Segment Clay processing flow.

---

## Step 4 — Clay enrichment + AI qualification

- Enrich firmographics + technographics
- Use Clay's "Use AI" with ChatGPT model — **ChatGPT 4o-mini recommended** for cost/quality balance
- Classify Qualified / Not Qualified
- **Strip non-qualified accounts before tiering** (don't tier garbage)

---

## Step 5 — Account scoring + tiering

- Score using Clay formulas + AI scoring logic
- Tier 1: Strong fit / Tier 2: Good fit / Tier 3: Okay fit
- Push tier property to CRM
- **Backtest validation:** Do historical wins cluster in Tier 1, losses in Tier 3? If not, refine.

For HubSpot-specific mechanics (re-enrollment, fallback for missing tier, monthly/quarterly review cadence), see the HubSpot tiering recipe pattern from workflow 11.

---

## Step 6 — Operationalize Tier 1+2 audiences

Sync prioritized accounts into:
- LinkedIn Ads
- HubSpot Ads

Build **buying committee audiences** — not just contact-level, also account-level. This pre-conditions the prospects via paid before outbound lands.

---

## Step 7 — Contact sourcing + stakeholder mapping

Per qualified account, source 3 contact types:
- **Decision Makers**
- **Champions**
- **Influencers**

Enrich and upload to CRM with custom properties:
- Tier
- ICP fit
- Stakeholder role

For the 5-role buying committee depth (Exec / Ops / Tech / Finance / End-User with per-role messaging strategy): `clusters/personas/knowledge/buying-committee-5-roles.md`

---

## Step 8 — Three-tier signal infrastructure (1st / 2nd / 3rd party)

**The Workflows.io signal taxonomy (used across nearly all their playbooks):**

| Tier | Sources |
|---|---|
| **1st party** (own ecosystem) | CRM activity (emails, replies, calls, tasks), product analytics (activation, feature use), website events (visits, pricing page, form submits), marketing/content events (webinars, downloads, campaigns) |
| **2nd party** (trusted partner ecosystem) | Partner overlaps (Crossbeam), warm intros / mutual connections, review-site behavior (G2, Capterra, TrustRadius), ad + LinkedIn engagement |
| **3rd party** (public data) | Tech stack changes (BuiltWith, TheirStack, Sumble), funding rounds (Crunchbase, Pitchbook), hiring spikes (TheirStack, PredictLeads), market news, social activity, firmographic + technographic enrichment updates |

For the full architecture (capture → normalize → score → enrich → trigger → feedback loop): `clusters/signals/knowledge/signal-activation-architecture.md`

---

## Step 9 — Awareness-stage lead scoring

5 stages: **Identified → Aware → Interested → Considering (or Evaluating) → Selecting**

- CRM custom events for: pricing-page visits, demo requests, high-intent actions
- Trigger CRM tasks + Slack alerts on stage change
- **Store signals as custom events, NOT properties** — events carry timestamps + frequencies; properties are point-in-time only.

For the HubSpot-specific mechanics (5 lists with OR-criteria filters, priority-branch workflow ordering): `clusters/lead-scoring/knowledge/awareness-stage-model.md`

---

## Step 10 — Demand-gen execution by play type

Plays differ by **Tier × Awareness × Signal-strength**.

### Tier 1 (1:1 plays)
Must-win accounts deserve focused attention + personalized experience that builds consensus across buying committee.

- **Warm intros** via investors / customers / partners (The Swarm, Commsor)
- **Custom gifting** / direct mail tailored to key stakeholders
- **Personalized microsites** / landing pages per account (HubSpot)
- **Short tailored video** from AE or founder (Sandcastles AI for at-scale, Loom/Vidyard for manual)
- **Private event invites** / exclusive webinars
- **Role-specific content** + thought leadership assets
- **Manual multichannel outreach** (email + phone + LinkedIn)
- **Custom decks** via Gamma

### Tier 2/3 (1:Many plays)
Regular relevant engagement without full personalization — drive awareness + capture signals + surface intent.

- Automated outbound (Instantly + HeyReach)
- Paid social + retargeting campaigns
- Personalized video at scale (Vidyard, Sendspark)
- Role-based / segment-based landing pages
- Co-marketing with partners
- Targeted newsletters + webinars + drip flows

### The effort/opportunity rule
- **Tier 1 → Creativity + Human Effort**
- **Tier 2 → Automation + Smart Personalization**
- **Tier 3 → Awareness + Scalable Reach**

Track CTR + response rate + meetings booked + awareness-score progression. Shift resources where engagement + intent are compounding fastest.

---

## Step 11 — Push back to CRM + monitor

Sync all engagement + signals back to CRM. Monitor:
- Pipeline progression
- Tier movement
- Awareness shifts
- Closed-won rate
- Revenue by tier

**Final outputs:**
- Account mapped
- Company tiers defined
- Stakeholder maps complete
- Signals centralized
- Awareness scores tracked
- Closed-won attribution clear

---

## The bi-directional CRM ↔ Slack feedback loop

CRM and Slack shouldn't work in isolation. The most effective systems run **bi-directional**:
- Signals captured in CRM → trigger alerts in Slack
- Reps take action in Slack → actions feed back to CRM

**Implementation checklist:**
- Route high-priority signals (Tier 1 pricing-page visits, ad engagement) to dedicated Slack channels
- Map CRM owner IDs → Slack user IDs for rep-specific alerts
- Send daily/weekly summaries (Tier 1 Account Digest)
- Trigger Slack messages when awareness stages change
- Slack bots / emoji reactions to assign or confirm next actions

This loop is what separates measured ABM (continuous data flow + reps acting on real-time insights + leadership visibility) from one-way data hoarding.

---

## Cross-references

- Master outbound system (the strategic backbone): `clusters/campaign-ops/knowledge/outbound-master-system.md`
- Signal architecture (the activation layer): `clusters/signals/knowledge/signal-activation-architecture.md`
- 5-role buying committee depth: `clusters/personas/knowledge/buying-committee-5-roles.md`
- HubSpot awareness-stage mechanics: `clusters/lead-scoring/knowledge/awareness-stage-model.md`
- Outbound attribution measurement: `clusters/campaign-ops/knowledge/outbound-attribution.md`

## Source

Workflows.io ABM Playbook 2026 (workflow + blog companion), 2026-05-13 crawl.
