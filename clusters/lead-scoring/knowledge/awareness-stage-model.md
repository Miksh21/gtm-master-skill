# Awareness Stage Model — 5-Stage Account State Framework

A **state model** (where is the account in the buying journey) that complements gtm-master's existing scoring tiers (`signal-scoring.md` heat tiers — Red Hot/Hot/Warm/Cool/Cold). Score = number; stage = state. **Stage is what your playbook is keyed to.**

**Visual reference:** `visual-library/awareness-scoring-playbook.png` — matrix view with companies on the left axis (Clay, Parabola, Userpilot etc.) × 5 stages on the top axis (Identified → Aware → Interested → Considering → Selecting), with specific signal criteria per cell.

## When to load

- "How do we know which accounts are in active buying mode?"
- "Lead scoring isn't translating to action — what should we do?"
- "Set up HubSpot lists for awareness stages" (HubSpot-specific mechanics)
- Designing the activation layer of a signal architecture

## The core insight

**Stage > score.** A score is a number ("87"); a stage is a *state with a play attached* ("Considering — accelerate decision via case studies + ROI calculator"). Lead scoring outputs numbers; awareness staging outputs *actions*.

This model is used across the workflows.io content corpus (ABM Playbook, Signal Playbook, Awareness Scoring Playbook). It's complementary to gtm-master's existing heat-tier scoring, not a replacement.

---

## The 5 stages

```
Identified  → Aware  → Interested  → Considering (Evaluating)  → Selecting
```

| Stage | Definition | Default play |
|---|---|---|
| **Identified** | Target account list, no engagement yet | Add to retargeting audience; passive nurture; no rep outreach |
| **Aware** | Brand recognition starting (email opens, low ad engagement) | Light nurture, retargeting intensifies, top-of-funnel content |
| **Interested** | Meaningful engagement (multi-page visit, content downloads, comments on posts) | First SDR touch with signal-led opener; offer free resource |
| **Considering** | Active evaluation (pricing visits, demo asks, competitor comparison on G2) | AE-led conversation, case studies, ROI calculator, custom demo |
| **Selecting** | Open opportunity (active deal, multiple stakeholders engaged) | Sales process; deal-team alignment; objection handling |

**5 is the right number** — fewer (3) collapses too much detail; more (7+) is operationally unmanageable.

---

## Variables that drive stage transitions

Define signals per stage. Examples:

### Identified → Aware (entry signals)
- Outbound email open (low-weight, repeated)
- Low-level LinkedIn ad engagement
- Single deanonymized website visit

### Aware → Interested
- Multiple LinkedIn ad clicks
- Multi-page website visit (deanon)
- Positive reply to outbound email
- LinkedIn connection accepted

### Interested → Considering (Evaluating)
- High LinkedIn ad engagement
- Repeat pricing-page visit (2+ in 48h)
- Content download (case studies, ROI calc)
- Demo request

### Considering → Selecting
- Open opportunity in CRM
- Multi-stakeholder engagement (buying committee forming)
- Competitor comparison detected (G2 alert)

### Anti-progression: account stays cold or de-stages
- 30+ days no activity → demote
- Negative reply / "unsubscribe" → exit funnel
- Closed-lost flag → strip from active list

---

## HubSpot implementation (concrete mechanics)

This is where the model gets operationally real. HubSpot-specific but translates to other CRMs.

### 1. Create the property

- Property name: **"Awareness Stage"**
- Type: single-select
- Options: Identified / Aware / Interested / Evaluating (or Considering) / Selecting

### 2. Decide: events vs properties

**Critical mechanic.** Most signals should be stored as **custom events** (timestamped, frequency-trackable), NOT as properties (overwrite). Why:
- Events: "email_opened" with timestamp + frequency → enables "≥3 opens in 30 days" filters
- Properties: "last_email_opened_at" overwrites every time → loses history

**Exceptions — store these as properties:**
- CEO LinkedIn Connection (yes/no — binary state, not frequency)
- LinkedIn Ads Engagement attribution from Fibbler (state, ad-campaign-linked)
- Account Tier (state, doesn't change frequently)
- Awareness Stage itself (the OUTPUT property)

### 3. Build 5 HubSpot lists (one per stage)

Each list uses **OR criteria** (not AND) — a single strong signal advances stage. AND would require too many signals to align before any action triggered.

**Example: Aware-stage list**
- Outbound Email Open completed ≥3 times in last 30 days OR
- Website Visitor completed ≥1 time in last 30 days OR
- LinkedIn Ad Engagements (30 days) < 4

**Window: 30 days** is the standard rolling window across most signal types. Recency matters more than absolute count.

### 4. The priority-branch HubSpot workflow

One workflow auto-updates the Awareness Stage property.

- **Trigger:** Account has entered any of the 5 lists.
- **Check branches in this order (highest to lowest):** Selecting → Evaluating → Interested → Aware → Identified.
- **Why this order:** an account in multiple lists should be assigned the HIGHEST awareness stage. If it's both "Aware" and "Considering," it's Considering. Without priority branching, the workflow could assign Aware (the first match) and miss the higher signal.
- **On stage change:** fire webhook to Clay (or directly trigger downstream automations — Slack alert, AE task, sequence enrollment).

### 5. Per-stage activation in Clay (optional but valuable)

When stage changes, import the company into Clay and:
- Look up HubSpot properties for signals
- Use HTTP API column to look up all custom events for this account
- Run a Claude prompt: "Generate a 2-3 sentence summary explaining why this account moved from [prev stage] to [new stage], referencing the specific signals."

This gives the AE a contextual brief without manual digging.

---

## The activation layer per stage

Each stage triggers specific plays. This is the table that turns the model into a real ops system:

| Stage | Activation |
|---|---|
| **Identified** | Add to LinkedIn Ads retargeting audience; no SDR/AE touch |
| **Aware** | Top-of-funnel content via Customer.io drip; light LinkedIn ad frequency increase |
| **Interested** | SDR Tier 2/3 sequence (signal-aware opener: "Saw you've engaged with our [content] — worth a quick look?"); Slack alert at lower priority |
| **Considering** | AE-led personalized outreach; Tier 1 routing (Instantly C-level + HeyReach AE + supporting profile connections + Slack); custom resources (ROI calc, case studies) |
| **Selecting** | Deal team alignment; multi-stakeholder engagement; competitor objection handling; close motions |

For the underlying tiered routing template: `clusters/sequences/knowledge/tiered-routing-template.md`

---

## How awareness stages relate to existing gtm-master scoring

**Both models coexist. They answer different questions.**

| Model | Answers | Output |
|---|---|---|
| **Signal scoring** (existing in `signal-scoring.md`) | "How hot is this account?" | Numeric score → heat tier (Red Hot 150+, Hot 100-149, Warm 50-99, Cool 20-49, Cold 0-19) |
| **Awareness staging** (this file) | "Where are they in the buying journey?" | State → Identified / Aware / Interested / Considering / Selecting |

Use both:
- A score of 150 in "Identified" stage = strong signal data but no buying journey progress yet (likely premature outreach)
- A score of 60 in "Considering" stage = moderate signal data but in active buying mode (immediate AE attention)

Score + stage combined gives you "how urgently AND for what play to act."

---

## Common failures

- **Storing signals as properties not custom events** — loses history, can't filter by frequency or recency
- **AND criteria instead of OR** — accounts never advance because waiting for multiple signals to align
- **No priority branching in HubSpot workflow** — accounts get lower stage when they qualify for higher
- **Defining stages without per-stage plays** — the model becomes a dashboard, not an ops system
- **5+ stages** — overcomplicates the workflow; 5 is the right count
- **Daily window** instead of 30-day rolling — too noisy; signals don't decay that fast for most B2B cycles

---

## Cross-references

- Master signal architecture (the activation layer): `clusters/signals/knowledge/signal-activation-architecture.md`
- Numeric scoring framework (the score side): `clusters/signals/knowledge/signal-scoring.md`
- Per-stage activation plays: `clusters/sequences/knowledge/tiered-routing-template.md`
- Where this fits in ABM: `clusters/campaign-ops/knowledge/abm-operating-system-2026.md` (Step 9)

## Source

Workflows.io "Awareness Scoring Playbook 2026" workflow + "ABM Playbook 2026" (Step 4) + "The 2026 Signal Playbook" (Step 7), 2026-05-13 crawl.
