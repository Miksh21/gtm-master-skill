# Outbound Master System — 7-Step Framework

End-to-end outbound architecture. Use when designing or auditing a full outbound motion (not a single campaign). Synthesized from the Workflows.io 7-step framework that reportedly booked 320+ qualified meetings in a single month.

This file is the **strategic-architectural backbone**. Individual cluster tasks (ICP, signals, lead scoring, etc.) implement the steps.

## When to load

- "Build me an outbound motion from scratch"
- "Audit our outbound — what's broken?"
- "How should we structure outbound at $X ARR?"
- Any time multiple clusters need to be coordinated (ICP + signals + list + scoring + copy + scaling)

---

## The 7 steps

```
1. ICP Model         → who actually buys (data, not opinion)
2. TAM Mapping       → how many of them exist (Dedupe→Filter→Normalize→Qualify→Segment in Clay)
3. Account Research  → context for personalization + signal tracking infrastructure
4. Lead Scoring      → Fit × Intent × Triggers → Tier 1/2/3
5. Contact Sourcing  → buying committee, not single point-of-contact
6. Message-Market Fit → 6 testable variables, A/B before scale
7. Scale             → only when 3 conditions met (positive intent + proven angle + stable deliverability)
```

Most outbound programs fail because they skip steps. ICP without backtest. TAM without dedup. Research without signal tracking. Scoring without tiers. Single-thread contacts. Copy without testing. Scaling before stability.

---

## Step 1 — ICP Model

Treat ICP as a **data problem, not a brainstorming exercise.**

**3 input streams (all required):**
1. **Standardized onboarding form** — captures firmographics, commercial model (ACV bands, sales cycle, PLG vs sales-led), ideal customer traits, **negative ICP**, historical performance. Converts qualitative preferences into queryable criteria.
2. **SDR + CSM interviews** — front-line nuance data alone can't capture. SDRs know which titles reply vs ignore. CSMs know who finds value fastest, who gets stuck in onboarding, who expands.
3. **Closed-won analysis (last 6-24 months)** — firmographic + technographic win patterns, thresholds (e.g., "teams under 20 employees rarely convert"), pre-purchase triggers, expansion behavior.

**Outputs:**
- **ICP criteria** as RULES not narratives (firmographic + technographic + behavioral + negative).
- **Filters/queries** — saved searches in Apollo/Sales Nav, Boolean strings, inclusion/exclusion lists. Eliminates "reinvent targeting" before every campaign.
- **Lookalike signals** — companies that *behave like* your best customers (tool combos, hiring patterns, traffic ranges), not just "look like."

**Backtest validation criterion:** Run the scored ICP across historical deals. **Do wins cluster in Tier 1 and losses cluster in Tier 3?** If not, refine until they do.

For the recipe: `clusters/icp/tasks/build-icp.md`

---

## Step 2 — TAM Mapping (Clay processing flow)

Triangulate 3 source types, then run a 5-step Clay process to produce a clean TAM.

**3 source types:**
1. **Core firmographic databases** — Apollo, LinkedIn Sales Navigator (baseline).
2. **Lookalike expansion** — Ocean.io, DiscoLike (companies that *behave* like your best customers).
3. **Niche + long-tail capture** — Apify, EasyScraper for industry directories, event sponsor pages, association memberships, G2/Capterra, intent-keyword search results.

**Clay processing: Dedupe → Filter → Normalize → Qualify → Segment**

1. **Dedupe** — Standardize on company domain as primary key. Merge variations ("Acme Inc" vs "Acme Incorporated"). Keep richest record.
2. **Filter** — Apply ICP rules. Strip companies that don't meet thresholds + apply negative ICP. Remove agencies, freelancers, resellers if not ICP.
3. **Normalize** — Map provider-specific industry labels to common taxonomy. Consolidate geo names ("USA" / "United States" / "US" → one value). Align headcount + revenue into consistent buckets.
4. **Qualify** — Enrich with tech stack data (BuiltWith, Wappalyzer). Apply rules ("≥10 employees in marketing or sales"). Flag low-confidence rows for manual review.
5. **Segment** — Slice by sub-industry / size / tech stack / region. Each segment drives a different messaging angle.

**Output:** a clean, qualified, tiered, segmented account universe — single source of truth, not a generic B2B list.

---

## Step 3 — Account Research

**4 research layers:**
1. **Firmographics** — industry/sub-industry, headcount (overall + departmental), HQ + regional locations, funding stage + investors, growth (hiring surges) or decline (layoffs).
2. **Technographics** — cloud + infra (AWS/GCP/Azure), core systems (CRM/ERP/data warehouse), competitor or adjacent products, integration dependencies, security/compliance.
3. **Fit signals (timing-driven)** — SOC2/ISO compliance announcements, rapid hiring in target departments, leadership transitions (new CRO/VP RevOps/CTO), funding/acquisitions, product launches/rebrands, job postings implying category adoption.
4. **Custom fields** — model-specific. Business model (SaaS/marketplace/hybrid), revenue model (subscription/transactional), customer segment (SMB/MM/Enterprise), operational complexity, industry-specific nuances.

**Signal tracking stack** — see `clusters/signals/knowledge/signal-activation-architecture.md` for the full architecture. Quick reference:
- **Trigify** — LinkedIn engagement intelligence
- **LoneScale** — champion + org movement (incl. champion job changes)
- **Warmly** — website deanon + visit intent

---

## Step 4 — Lead Scoring (Fit × Intent × Triggers → 3 Tiers)

Scoring is what separates strategic outbound from random activity.

**3 dimensions:**
- **Fit** = structural suitability (firmographics + technographics + business model + deal potential). "If they had a need, would they be a great customer?"
- **Intent** = current activity/awareness (website behavior + content engagement + events + downloads). Dynamic, shifts constantly.
- **Triggers** = why-now (funding, M&A, leadership hires, team scaling, compliance mandates, infrastructure milestones).

**3-tier model with explicit motions:**

| Tier | Who | Outbound motion |
|---|---|---|
| **Tier 1** (manual + calls) | Strong ICP match + multiple positive fit signals + recent triggers | Multi-threaded engagement, personalized cold call + email + LinkedIn, custom messaging tied to stack/model/stage |
| **Tier 2** (multichannel) | Clear ICP fit, limited or no visible intent yet | Automated multichannel (email + LinkedIn), light segment-level personalization, continuous monitoring for promotion to Tier 1 |
| **Tier 3** (automated) | Minimum ICP match, no strong signals, limited context | Low-frequency automated sequences, generic but ICP-relevant messaging, discovery-focused (surface unexpected interest) |

For the recipe: `clusters/lead-scoring/tasks/score-and-prioritize.md`
For weighted scoring tables + recency multipliers: `clusters/signals/knowledge/signal-scoring.md`

---

## Step 5 — Contact Sourcing (Buying Committee)

**B2B deals involve 6-10 stakeholders on average (Gartner 2023).** Single-thread = single-point-of-failure.

**Tools (3-layer for coverage):**
1. **Findymail** — primary email discovery + verification (built-in verification reduces bounces, protects sender domain).
2. **BetterContact** — phone enrichment for Tier 1 + phone-led sequences.
3. **Apollo Enrich** — coverage expansion + cross-verification for missing/adjacent functions.

**Standardized buying committee — 5 roles to fill per account.** See `clusters/personas/knowledge/buying-committee-5-roles.md` for per-role messaging strategy (Exec / Ops / Tech / Finance / End-User).

---

## Step 6 — Message-Market Fit (6 Testable Variables)

**Don't change everything at once.** Each test isolates 1-2 variables.

**6 variables:**

1. **Openers (4 types):**
   - Context-based — "Saw you recently [hiring for X / announcing Y / launching Z]…"
   - Role-based — "As a [title], you're likely dealing with…"
   - Stack-based — "Teams running on [Snowflake / HubSpot / X] usually hit a wall with…"
   - Outcome-based — "Most [ICP] we speak with are trying to hit [metric] without adding headcount."

2. **Value props (Core benefit / Specificity / Layer):**
   - Core benefit: revenue↑ / cost↓ / risk↓ / speed↑ / accuracy↑
   - Specificity: generic vs quantified ("reduce manual reporting" → "cut reporting time by 60%")
   - Layer: IC-level productivity vs manager-level efficiency vs exec-level strategy

3. **Problem calls (Depth / Focus / Ownership):**
   - Depth: minor annoyance vs critical blocker
   - Focus: time, compliance, cost, growth, complexity
   - Ownership: their problem / team's / customer's
   - Pattern: "Most [ICP] we talk to still rely on [current workaround], which leads to [specific friction]."

4. **Social proof (Type / Proximity / Placement):**
   - Type: logos / named customers / anonymized ("Series C fintech") / quantified results
   - Proximity: same industry / size / tech stack
   - Placement: early vs near CTA

5. **Offers (Type / Friction / Format):**
   - Type: demo / audit / teardown / benchmark / short call
   - Friction: high ("45-minute deep dive") vs low ("share benchmarks, you decide next")
   - Format: resource-led (playbook, checklist) vs product-led (walkthrough)

6. **CTAs:**
   - Soft: "Worth a quick look?" / "Open to exploring this?"
   - Time-based: "Free for 20 minutes next week?"
   - Choice-based: "Is this more relevant to you or [other role]?"

**Execution:**
- **Instantly** for email split-test (sequences with isolated variables, deliverability + opens + replies + spam monitoring, roll winners to larger segments)
- **HeyReach** for LinkedIn variant testing (connection-note + follow-up variants by persona, timing aligned with email for Tier 1+2)

**Word + length discipline:** Cold message under **70-80 words** total. See `clusters/cold-email/knowledge/copywriting-frameworks.md` for the 3-line + 11-body-component + 4-CTA framework.

---

## Step 7 — Scale (3 Non-Negotiable Gate Conditions)

**Scaling unproven messaging = louder inefficiency.** Most outbound programs collapse here because they scaled too early.

**3 go/no-go conditions — ALL must be met:**

### 1. Positive intent (not just replies)
- Reply rate alone is insufficient.
- Track: **% positive replies** (interest, questions, meeting requests), **meetings booked per 100-200 contacts**, conversion rate from reply → meeting → opportunity.
- Decision rule: If reply rates are high but replies are neutral ("not now", "not relevant"), messaging is off. Pause + iterate.

### 2. Proven angle (replicable narrative)
- Specific validated segment (e.g., "Heads of Data at mid-market SaaS using Snowflake")
- Clear problem narrative + value prop already delivered: multiple positive replies + multiple meetings + early pipeline
- **Consistency across SDRs** — works for more than one person
- **Repeatability across accounts** — performs across multiple companies in the segment
- One SDR + one account = signal, not proof.

### 3. Stable deliverability (protect the engine)
- Bounce rate low and stable
- Spam indicators minimal
- Open rates healthy + consistent by region
- Domain/IP health monitored across all sender domains
- **If new domains still warming OR open-rate dips OR bounce spikes → pause.** Don't scale on top of weak infra.

**3 scale levers (once gates pass):**

1. **Add more SDRs.** Same validated plays (ICP + segments + sequences + messaging). Defined account pools per SDR. Track performance variance to detect skill or messaging gaps.

2. **Expand to adjacent personas (depth before breadth).** If "Head of Data" performs, test Director of Data + VP Data / CDO + Analytics Lead + Head of Platform / Data Engineering. Tests message transferability across related personas. Increases account coverage. Discovers new champions.

3. **Add new data sources (same pipeline).** New Apollo segments. Lookalike expansion via Ocean.io / DiscoLike. Niche Apify scrapes. New geographies / sub-industries. **Each new input goes through the SAME ICP → TAM → Research → Scoring → Contact Sourcing → Messaging → Testing pipeline.** No shortcuts.

---

## Channel role within the system

| Channel | Best for | Cost |
|---|---|---|
| **Cold calling** | Tier 1 accounts where timing matters; visited website / interacted with content | High effort |
| **Email** | Scale across large segments; consistent reach without manual effort | Low effort |
| **LinkedIn** | Warm prospects who've seen content; multi-thread relationship-building | Medium effort |
| **Manual prospecting** | Highest-value accounts only (Dream 100 or Tier 1) | Highest effort |

**Tip from real-world Workflows.io playbook:** They reserve "Dream 150" for fully-manual LinkedIn prospecting, separate from Tier 1 (cold calling + semi-automated). This is an extra tier above Tier 1 for must-win accounts.

---

## The GTM flywheel context

Outbound stronger when not isolated. From the GTM flywheel: **Content → Paid → Outbound → Partnerships** — each reinforces the others.

- Content creates familiarity → SDRs reference past posts in cold messages → reply rates lift
- Paid ads pre-condition the same ICP → "impression alignment" before the cold touch lands
- Partnerships inject 3rd-party credibility → warmer audiences
- **The strongest signals come from your own marketing activity.** A real benchmark: Founder LinkedIn Connections play hit **25.4% reply rate** after 1+ year of consistent founder content built familiarity with the audience first.

See `clusters/campaign-ops/knowledge/abm-operating-system-2026.md` for the cross-motion architecture.

---

## Source

Synthesized from workflows.io content corpus (workflows + blogs), 2026-05-13 crawl. See `workflows-io-extraction-2026-05-13.md` for verbatim source quotes per step.
