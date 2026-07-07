# ABM Engine — Tactical Implementation Guide (HubSpot + Clay + Claude)

Implementation companion to `abm-operating-system-2026.md` (the 11-step strategic pipeline). That file answers *what the system is*; this file answers *how you actually build it* — the RevOps mechanics, cost math, CRM patterns, and channel lessons from dozens of real ABM implementations.

**When to load:**
- "Set up ABM in HubSpot/Clay for us" (hands-on build, not strategy)
- "How much does a full TAM map cost?"
- "How do we make enrichment evergreen in the CRM?"
- "Which reports prove ABM is working?"

## When ABM is the right motion (the qualification gate)

Recommend ABM to any B2B company with:
- **ACV $50k+**, AND
- **Constrained addressable market: < 20,000 qualified companies**

Rationale: with a TAM under 20k, the low conversion rates of volume channels (automated outbound, LinkedIn content) make them impossible to rely on in silos — and every incremental % of TAM coverage has massive revenue implications. Under ~2,000 accounts, ABM is not optional but mandatory (see `map-tam.md` motion recommendation).

---

## Step 1 — TAM + stakeholder mapping (target: 90%+ TAM coverage)

**Goal: a Target Account List capturing 90%+ of the TAM.** Don't shortchange this — in a <20k TAM, coverage is revenue.

Prerequisite: a written, agreed-upon ICP doc (surprisingly rare). If missing → `clusters/icp/tasks/build-icp.md`. Keep tiering models **simple** — simplicity means more accuracy and more clarity for the sales team.

### The 4 data provider types (combine 3+ to hit 90% coverage)

| Type | Examples | Best for |
|---|---|---|
| General prospecting databases | Apollo, ZoomInfo | Companies with a LinkedIn presence |
| Lookalike databases | Ocean.io, Discolike | Hyper-specific searches incl. companies NOT on LinkedIn |
| Specialized databases | Storeleads, influencers.club | TAMs with a reputable niche provider |
| Web scraping | Apify, Claude Code | Niches not fully represented on LinkedIn |

**The coverage/cost tradeoff is two-fold:** maximizing coverage means pulling broader lists → (a) more data provider credits, and (b) more AI spend, because every company gets qualified by an AI research agent against its website content. This is a necessary evil — database filters don't suffice (e.g. vertical SaaS sits under its industry vertical, not "software development"). Real example: a Series A SaaS targeting B2B distributors required scraping **70+ sources** (mostly industry association directories).

### Merge + dedupe: Claude Code, not Clay

Workflow split that works best (2026):
- **Claude Code:** merge + dedupe the multi-source lists (far easier than in Clay)
- **Clay:** back-testing and optimizing the centerpiece qualification prompt / research agents

The qualification prompt (industry + product fit on website content) is the centerpiece — full copy-paste framework: `clusters/enrichment/knowledge/prompts/qualification-prompt-framework.md`. Everything up to CRM upload *can* be done in Claude Code with the same data providers, but the evergreen workflows (Step 3 below) are more robust in Clay.

### Example tiering criteria (real client)

| Tier | Criteria |
|---|---|
| Dream Account List | Hand-picked 150 accounts |
| Tier 1: Best-fit | B2B (excl. web dev/IT/agencies/consultancies), Seed–Series B, US/CA/UK, 100+ headcount, **HubSpot AND NO Salesforce** |
| Tier 2: Good | Any B2B (no services), Seed–Series B, US/UK/W-EU/CA/AU/IL, 50+, HubSpot |
| Tier 3: Potential | Any B2B (services incl.), any funding, US/UK/EU/CA/AU/IL, 20+, any tech |

Note the technographic gate as a Tier 1 criterion — tiering on *sellable fit*, not just size.

### Contact sourcing process (A→F)

A. Manually map titles into groups: **decision-makers, champions, influencers** (+ end-users optional)
B. Repeat closed-won analysis using *contacts* instead of accounts
C. Use findings to improve the manual title list
D. Run actual title searches (e.g. Apollo) per group; adjust criteria based on result counts (e.g. broaden Champion titles to boost numbers)
E. Pull contacts from multiple sources (Apollo, AI Ark, Clay)
F. Verify + find missing emails/phones **only for tiers that warrant it** (e.g. Tier 1 decision-makers), using low-cost providers (Findymail, BetterContact)

---

## Step 2 — Account research (30+ custom data points)

Collect data points useful for (a) campaign personalization, (b) reps researching accounts *without leaving the CRM*. Typically **30+ custom data points = 30+ custom CRM properties**.

**Map everything in a spreadsheet BEFORE building any workflow** — columns: Data Point / Object (Contact vs Company) / Enrich? / Description-Solution Design / Property Type / exact HS-SF Property Name / overwrite rules. This is what lets you predict costs accurately.

**Cost benchmark:** a full TAM map with account research = **$2,000+** across data providers + Clay + AI credits. Justifiable because the data points get extremely precise.

Real client examples (simple → complex): engineering headcount · custom sub-industry classification · e-commerce hosting platform · competitor tech usage · closest coffee spot to prospect's office · recent clinical trials · parent-child relationship mapping · composite media-buying activity score.

Deployment: Claygent web research agents + the 150+ rentable Clay providers (some data isn't public). Expect heavy prompt engineering + back-testing.

### Derived / computed fields (make raw data actionable)

- **Job title categorization** — AI classifies every title into decision-maker / champion / influencer
- **Headcount bands** — custom SMB / Mid-Market / Enterprise bands used for routing + scoring
- **Account scoring in HubSpot itself** (not only Clay) — so when a rep manually overwrites a value, the score reassesses automatically
- **Parent-child associations** — for PE-backed targets you may sell through the parent; web research agents find the relationship, HubSpot associations record it

Net effect: the CRM becomes a data-rich, pre-filtered prospecting database — reps never log into Apollo/ZoomInfo (you use that data through Clay).

### HubSpot tier-classification workflow pattern

Branch **by size band first** (SMB vs MM/Strategic on employee count), then within each band check Tier 1 → Tier 2 → Tier 3 → None met, each branch setting the `Company Tiering` property. Tiers are relative to segment, and priority-ordered branching prevents an account matching multiple tiers from landing in the lower one.

### Clay → HubSpot push mechanics

- Object ID: use a **Final ID** column (CRM lookup result) as HubSpot Object ID
- **Ignore blank values = ON** — a failed enrichment must never wipe an existing CRM value
- Map each Clay column to the exact property name from the spreadsheet

---

## Step 3 — CRM cleanup + evergreen enrichment

**Cleanup first, before adding records/properties.** Bare minimum: (a) hard domain + email duplicate removal, (b) property audit to prevent redundancies. Tooling that covers 99% of cases: Clay + HubSpot API · HubSpot Data Hub · Claude Code + HubSpot MCP.

### Convert the one-time TAM workflow into an evergreen enrichment workflow

The one-time TAM/stakeholder build converts into everlasting value in 4 steps:
1. Duplicate the TAM + stakeholder map workflows
2. Trigger = **list enrollment (24h cadence)** or **webhooks** (instant, but requires HubSpot Data Hub Pro at ~$800/mo)
3. Change final action from "Create record" → **"Update record"**
4. Enroll the backfill of existing companies + contacts

**Freshness tracking:** an `Enriched by Clay` date field on BOTH company and contact objects → powers re-enrollment workflows when the freshness window passes (**~1 year**), plus easy tracking. Pair with a `Net New` flag.

### Quality-of-life activations (adoption drivers)

- Customize contact/company views to surface the key research properties
- Segments by tier and category
- **On-demand enrichment buttons** in record views — one-click workflows reps trigger themselves: Find Phone Number, Find Email, Enrich w/ LinkedIn Data, Find HQ Number, Create Sequence, Find Additional Stakeholders at Company

---

## Step 4 — Signal tracking (pointer + the numbers)

Full architecture: `clusters/signals/knowledge/signal-activation-architecture.md` (13-step capture→enablement). The 5 uses of intent signals: awareness scoring · trigger automated outreach · Slack/CRM notifications for manual outreach · customer expansion monitoring · building targeted micro-campaign lists ("liked a LinkedIn post AND visited the website this month").

**Evidence:** best implementations see **20-40% of active pipeline attributed to signal activation** (7-day deal-creation windows). Intent-based outbound ranked **#2 GTM channel** teams invest more into in 2026 (Growth Unhinged 2025 State of B2B GTM). Rep reception is universally positive — but expect some signals to fail (no intent correlation, or insufficient volume). *Capturing a signal is the easy part; activating it is 90% of the work.*

Canonical tier activation recipe:
- **Tier 1:** Slack alert + manual outreach via Nooks + CRM task
- **Tier 2:** Retargeting ads (Google/LinkedIn) + automated outbound (Instantly + HeyReach)
- **Tier 3:** Automated email only (Instantly)

---

## Step 5 — Awareness scoring (pointer)

Model + HubSpot mechanics: `clusters/lead-scoring/knowledge/awareness-stage-model.md`. Key framing: this fixes the major shortcoming of lifecycle stages — **they start after an opt-in**, missing a significant portion of the warm market.

On stage change: tasks + Slack for high-intent · build the key lists reps prospect out of (e.g. Tier 1+2 accounts in *Interested*) · generate an **AI signal summary** on every stage change, stored as a property / task description.

---

## Step 6 — Demand generation (channel lessons)

What happens once the infrastructure exists: awareness segments become ads retargeting audiences · SDRs spend zero time list-building outside the CRM · sales naturally focuses on Interested + Aware accounts (**3x conversion lift is common**) · sales starts valuing marketing's signals because they generate its pipeline.

### 1:1 channels (Tier 1 / dream accounts)

| Channel | Lesson |
|---|---|
| Gifting campaigns | Multiply ROI by tying to an IRL event + custom email sequences per recipient + generating social content from the process (Freckle: custom pickleball rackets to 60 ICP accounts in SF → 140k impressions) |
| Warm intros | #1 hack: add your close network (investors, partners, evangelists) to a **monthly company update** — recent wins + insider reflections, paired with asks that would feel uncomfortable 1:1 ("just signed a medical-device case study — know anyone like X?") |
| Event invites | Event CTAs outperform other offers in cold outbound to enterprise. Start with webinars on trending topics → then IRL (small dinners) in SF/NY-type hotspots |
| Manual outreach | Automate 90%+; reserve manual for dream + high-intent accounts where a lower conversion rate is unacceptable. Hyper-personalize (custom microsites). Where manual vastly outperforms → **human-in-the-loop AI sequencing** to scale it |

### 1:many channels (Tier 2/3)

| Channel | Lesson |
|---|---|
| Automated outbound | Don't fear "burning your TAM" if you don't spam and messages are great. **Re-engage the TAM every 60 days**, layering signal-based + micro-campaigns on top |
| Parallel dialing | With every contact pre-uploaded to CRM, Nooks/Orum reps hit 100s of dials/day. TitanX (cold-call intent) is even pricier than the dialers |
| Social content | LinkedIn = #1 B2B inbound channel besides SEO (80% of Workflows.io deals at least indirectly attributed). The common mistake: promotional/corporate content instead of what the ICP actually wants (usually not product-related) |
| On-site content | Lead magnets feed every other channel; for clients with no offer besides meetings/audits/POCs this opens a whole new funnel |
| Video outreach | Targeted 1:many Looms > AI video tools (educated buyers see through the gimmick). Video explainer as outbound CTA is a consistent winner: "Want a 2-min video breaking down how this would work?" |
| Targeted ads | Upload company/contact lists (LinkedIn) or contact lists (Meta/Google retargeting) → 100% of spend on ICP. Last-touch attribution looks low; multi-touch attribution skyrockets |
| Public events | Automate pre-/post-event outreach with an adapted version of the CRM enrichment workflow — massive time/cost savings where trade shows matter |
| Connection requests | Literally free to send to Tier 1 TAM — and they start seeing your content for free. Low-lift, high-impact default |

---

## Step 7 — The 6 ICP pipeline progression reports

**ICP pipeline progression is the north-star readout of ABM success.** The six reports to build:

1. **ICP pipeline created (MoM)** — the most accurate program-success readout; should increment from baseline
2. **Signal influence by category** — each signal category modeled against pipeline/closed-won with **7-day + 30-day attribution windows** → which signals to double down on
3. **Overdue signal tasks by rep** — tasks are the best way to assign work; % overdue per rep shows who needs enablement
4. **Awareness stage progression/regression by tier** — movement in last 30 days predicts future pipeline; **track backwards movement separately to spot leaks** before they hit pipeline
5. **Accounts by tier × awareness stage** — the base market-penetration report
6. **Tier 1 accounts with no activity in last 30 days** — the accountability report; should be ~0

---

## The flywheel + who builds this

Done right: high-performing social content becomes ads → ads warm outbound lists → outbound targets social engagers. First hire to build it: **GTM engineer or RevOps specialist** (see `{SKILL_BASE}/reference/gtm-engineer-role.md`).

---

## Cross-references

- Strategic 11-step pipeline: `clusters/campaign-ops/knowledge/abm-operating-system-2026.md`
- Qualification prompt framework: `clusters/enrichment/knowledge/prompts/qualification-prompt-framework.md`
- Signal activation (13-step): `clusters/signals/knowledge/signal-activation-architecture.md`
- Awareness stages: `clusters/lead-scoring/knowledge/awareness-stage-model.md`
- Clay CRM push mechanics: `clusters/enrichment/knowledge/crm-sync.md`
- Case study numbers (Medrio, Workflows.io): `{SKILL_BASE}/reference/case-studies-and-benchmarks.md`

## Source

Dan Rosenthal (Workflows.io co-founder), "How to build a modern ABM engine", Growth Unhinged, 2026-05-27 — plus 12 companion visuals (TAM Mapping Playbook, 2026 ABM Playbook, Signal Activation Guide, Signal Playbook, awareness-stage examples, HubSpot screenshots). Workflows.io: bootstrapped to $2.5M ARR in 10 months, 250+ companies served.
