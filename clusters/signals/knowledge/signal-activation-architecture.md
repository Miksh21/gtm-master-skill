# Signal Activation Architecture

Companion to `signal-scoring.md` (weights + tiers) and `signal-taxonomy.md` (137-trigger encyclopedia). This file is the **process architecture** — how raw signals become live actions across the GTM motion.

## When to load

- "We're collecting signals but nothing converts" → activation gap
- "How do we wire signals into outbound + ads + Slack + CRM tasks?"
- "What's the right metadata schema for our signal table?"
- Designing a signal infrastructure from scratch

**Visual reference:** `visual-library/the-signal-playbook.png` — radial 3-ring diagram showing 1st/2nd/3rd-party signal categories as concentric rings, with 16+ signal types around the perimeter (Funding Announcements, Search Analytics, Web Data, LinkedIn Engagement, Marketing Events, CRM Data, Webinar Attendance, Outreach Replies, Website Visitor, Product Usage, Warm Intros, Champion Tracking, Social Signals, Review Sites, Job Openings, Ad Insights). Load it directly via Read tool when explaining the architecture visually.

## The core insight

> *"The goal is not to collect more data. The goal is to make every captured signal have a destination, a purpose, and an owner."*

Most teams collect signals but don't *activate* them — they sit in CRM dashboards or trigger reports nobody reads. The activation step is what separates signal infrastructure from data hoarding.

---

## Step 0 — Define purpose (do this first)

Most signal systems are built before someone asks what they're for. Pick from 5 candidate outcomes (prioritize at least 2-3):

1. **Score account awareness + buying readiness** (feeds lead scoring)
2. **Trigger automated outbound / ads / tasks** (feeds outbound sequences)
3. **Push high-priority CRM + Slack alerts to reps** (feeds AE/SDR queues)
4. **Track expansion + retention + churn risk** (feeds Customer Success)
5. **Build high-intent ABM segments dynamically** (feeds list-building)

Without an explicit outcome, the signal system becomes a write-only data store.

---

## The 3-bucket signal taxonomy (Workflows.io framing)

Used across `signal-scoring.md` and `abm-operating-system-2026.md`. Quick reference:

### 1st party — own ecosystem (highest quality)
- CRM activity (emails, replies, calls, tasks)
- Product analytics (activation, feature use, usage depth)
- Website events (visits, pricing page, form submissions)
- Marketing/content events (webinars, downloads, campaigns)

### 2nd party — trusted partner ecosystem
- Partner overlaps (Crossbeam)
- Warm intros / mutual connections (The Swarm)
- Review-site behavior (G2, Capterra, TrustRadius)
- Ad + LinkedIn engagement (Fibbler for LinkedIn Ads, ZenABM)

### 3rd party — public data
- Tech-stack changes (BuiltWith, TheirStack, Sumble)
- Funding rounds (Crunchbase, Pitchbook)
- Hiring spikes (TheirStack, PredictLeads)
- Market news + category activity
- Social engagement + keyword/search trends
- Firmographic + technographic enrichment updates

---

## The 13-step pipeline (2026 revision)

```
0. Define purpose   → which of the 5 outcomes drives this system?
1. Capture          → pull from all sources: webhooks, APIs, native integrations
2. Aggregate        → one Clay/Cargo table, one row = one signal + one company/contact
3. Normalize        → standardize domain, LinkedIn URL, job title; clean, dedupe, format
4. Enrich           → basic enrichments for qualification (evergreen CRM workflow handles the rest)
5. CRM lookup       → existing account? A net-new account vs an existing pipeline account
                      need DIFFERENT treatment. Pull the assigned owner if one exists.
6. Qualify          → AI-qualify net-new companies/contacts, add to CRM if missing.
                      Many teams skip this — then complain about signal fatigue.
7. Score            → pull tiers from CRM (Tier 1/2/3/Unqualified) → enables logical routing
8. Segment          → group by territory: size, industry, location, business type
9. Route            → live rep-assignment table (rep name + CRM Owner ID + Slack channel).
                      Match signal type to role: ad engagements → BDR; champion tracking → AE.
10. Sync to CRM     → as custom events (HubSpot) / dedicated custom object (Salesforce)
11. Activate        → Tier 1: Slack + manual (Nooks) + CRM task
                      Tier 2: retargeting ads + Instantly + HeyReach
                      Tier 3: automated email only
12. Track           → roll signals up into awareness stages (Identified→…→Selecting)
13. Enablement      → sales leadership steps in (see below)
```

**The economics of this pipeline:** capturing a signal is the easy part — **activating it is 90% of the work**. Done right, best-case implementations attribute **20-40% of active pipeline to signal activation** (7-day deal-creation windows), and intent-based outbound ranked #2 among GTM channels teams invest more into in 2026 (Growth Unhinged State of B2B GTM). Expect some signals to fail anyway: either no correlation to buying intent, or insufficient volume — finding winners takes testing.

### Step 13 — Enablement (where sales leadership steps in)

The pipeline is RevOps work; adoption is a leadership deliverable:
- Custom sequences per signal type
- Call scripts referencing the signal
- Weekly signal digests
- Dashboards per rep (incl. overdue-signal-tasks accountability)
- Rep onboarding for new hires

---

## The 5-field signal metadata schema

**Every signal record carries:**

| Field | Why |
|---|---|
| **Source** | Which tool/system originated the signal (RB2B vs Warmly vs Trigify, etc.) |
| **Timestamp** | When it happened (enables recency filtering + decay) |
| **Account ID** | What company it belongs to (HubSpot/Salesforce domain match) |
| **Contact ID** | Which person (if individual-level signal) |
| **Event type + weight** | What happened + how heavy (feeds scoring) |
| **Signal category** | 1st / 2nd / 3rd party (optional 6th field) |

**Why this matters:** Without this schema, signals double-count, can't be traced to outcomes, and feedback loops break. With it, you can answer "which signals from which sources drove which deals over what time window?"

---

## The activation layer (Step 11)

Most signal systems die here. Capturing without activating = data hoarding. The 5 channels that actually move pipeline:

### A. Retargeting ads
- Google Ads + LinkedIn Ads audiences synced with CRM tier
- Warm leads (past 14 days) → LinkedIn audience automatically
- Funnel-aware: BOFU content to "Considering" stage, TOFU content to "Identified"

### B. Automated outbound sequences
- Instantly (email) + HeyReach (LinkedIn DMs)
- Tier-routed: Tier 1 = high-touch, Tier 2/3 = automated
- Reference the signal in the opener ("Saw you visited our pricing page twice this week...")

### C. Manual outreach (Tier 1 only)
- AE + Nooks (AI dialer) for cold calls when signal is Red Hot
- Custom decks via Gamma + microsites via HubSpot + warm intros via The Swarm

### D. Slack alerts
- Routed to rep-specific channels via CRM-owner-to-Slack-user-ID mapping
- Critical signals (Tier 1 pricing-page visit) → immediate ping
- Daily/weekly digests for lower-priority

### E. CRM tasks for follow-up
- Auto-created when account crosses score threshold (e.g., score ≥50)
- Assigned to existing owner or round-robin'd if unowned
- Task includes the signal context, not just "follow up"

---

## Storage rule: custom events, not properties

When syncing signals back to CRM (HubSpot specifically):

- **Store as custom events** (timestamped + frequency-trackable) — for any signal that happens multiple times
- **Store as properties** only for state values (e.g., Awareness Stage, Account Tier, CEO Connection = yes/no)

Why: properties overwrite. If you store "last website visit" as a property, you lose the visit history. Custom events preserve frequency + recency — which is what signal scoring needs.

Exception: a few signals where state matters more than frequency *should* be properties:
- CEO LinkedIn Connection (yes/no — binary state, not frequency)
- LinkedIn Ads Engagement attribution from Fibbler (state, ad campaign linked)

---

## The feedback loop (Step 12)

**Capture → Score → Act → Measure → Adjust**

- Feed meeting + deal outcomes back into scoring logic
- **Increase weights for signals that drive revenue; decrease noise**
- Review dashboards monthly to reassess signal ROI
- If a particular signal pattern consistently leads to booked meetings → its weight should rise
- If a signal frequently triggers workflows that go nowhere → deprioritize or remove

Without this loop, weights drift wrong over time. Most signal systems are write-only and degrade silently.

---

## Score weight calibration (from a published example)

A real example weighting schema for behavioral intent signals:

| Signal | Weight |
|---|---|
| Blog post view | +2 |
| Pricing page view | +8 |
| Demo form submit | +15 |
| Product activity spike | +20 |
| Score 50 = create deal automatically | (threshold) |
| Pricing visited twice in 48h → Slack alert | (rule) |

This is one calibration — different from gtm-master's existing scale (5-100 in `signal-scoring.md`). Use whichever matches your sales cycle + ACV. The ratio between weights matters more than the absolute numbers.

---

## Tools mentioned in this architecture

**Capture:** RB2B + Warmly + Albacross (website deanon), Trigify + Jungler (LinkedIn engagement), Fibbler (LinkedIn Ads attribution), ZenABM (ad engagement), TheirStack + PredictLeads (intent), BuiltWith + Sumble (technographics), Crossbeam (partner overlap), LoneScale + Champify (champion tracking)

**Orchestration:** Clay (primary) or Cargo (alternative)

**AI qualification:** Clay's "Use AI" with Claude / ChatGPT / Perplexity. ChatGPT 4o-mini recommended for cost optimization on bulk runs.

**Enrichment:** Findymail (email waterfall), BetterContact (phone waterfall), Apollo (firmographic baseline)

**CRM sync:** HubSpot (with custom events) or Salesforce

**Activation:** Instantly + HeyReach (outbound), Nooks (AI dialer), Google Ads + LinkedIn Ads (retargeting), Slack (alerts), HubSpot tasks

---

## Cross-references

- Signal weights + tiers: `clusters/signals/knowledge/signal-scoring.md`
- 137-trigger taxonomy: `clusters/signals/knowledge/signal-taxonomy.md`
- Engagement-on-external-content signal class: `clusters/signals/knowledge/engagement-on-external-content.md`
- Customer alumni play (high-value 3rd-party signal): `clusters/signals/tasks/customer-alumni-play.md`
- Where this fits in the broader outbound motion: `clusters/campaign-ops/knowledge/outbound-master-system.md` (Step 3)
- ABM activation context: `clusters/campaign-ops/knowledge/abm-operating-system-2026.md` (Step 8-10)

## Source

Synthesized from workflows.io "The 2026 Signal Playbook" + "Signal Activation Playbook" + "How to Build a Signal Architecture for GTM Teams" (2026-05-13 crawl); 13-step revision + enablement layer + pipeline-attribution stats from Dan Rosenthal, "How to build a modern ABM engine", Growth Unhinged, 2026-05-27.
