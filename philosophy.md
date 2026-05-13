# GTM Philosophy — Foundational Principles

Cross-cutting principles that inform every cluster. Load this when the user asks "how should I think about X", "what's the philosophy behind Y", "train my team on GTM fundamentals", or any conceptual / strategic framing question.

For executable recipes, go to the cluster tasks. This file is *theory*, not procedure.

---

## 1. The 6 Fundamental Principles

1. **Scale what top performers do** — Study the top 10-20% of reps in your org (or industry exemplars). Reverse-engineer their inputs (which lists, which signals, which copy patterns, which channels), then systematize. Most "GTM strategy" should start here, not with frameworks.

2. **Diagnose before prescribing — BIPSY framework**
   - **B**ehaviors — What is the rep actually doing day-to-day? (Activity volume, channel mix, message types)
   - **I**ndividual — Who is the rep as a person? (Strengths, motivation, fit for the role)
   - **P**rocess — Is the process broken? (Lead routing, qualification criteria, handoffs)
   - **S**kill — Does the rep lack a teachable skill? (Copywriting, objection handling, discovery)
   - **Y**ou — Are *you* (the manager) the problem? (Coaching, priorities, expectations)

   Apply when a team or rep is underperforming. The default response is "give them more training" — BIPSY forces you to find the actual constraint before throwing skill-building at a process/individual/behavior problem.

3. **Signal-based outreach = 3-4× higher contract values** — Companies reaching out on a fresh buying signal close bigger deals than cold lists. Signal sourcing is not just a reply-rate optimization; it changes deal economics. See `clusters/signals/` for the full signal taxonomy and scoring.

4. **You can't burn your TAM** — Re-engagement with new angles is always available. "We've already emailed these accounts" is rarely a real constraint — change the hook, change the sender, change the signal, change the channel. See `clusters/cold-email/tasks/re-engage-cold-leads.md`.

5. **Lead with pain, not features** — HockeyStack-style framing: "Do you have problems tying brand awareness to revenue?" beats "We help marketers attribute brand to revenue." Open with the problem the buyer feels, not the capability you sell. See `clusters/cold-email/knowledge/copywriting-principles.md`.

6. **Segment and convert, don't over-personalize** — Gorgias went from 200 hyper-personalized sequences to 10 modular ones and improved conversion. Sequence sprawl is a tell that you're substituting volume of variants for clarity of segmentation. Define 5-10 segments, write strong modular copy per segment, stop the proliferation.

---

## 2. Multi-Channel Coordination

**The data:**
- Email + ads + referrals coordination → extra $2M ARR (case study)
- ABM (account-level multi-channel) → 36% meeting rate vs 10% for non-ABM single-channel
- "Warm before you touch" principle — never make a cold channel the *first* impression if you can avoid it

**Default channel coordination:**

| Channel | Role | Timing |
|---|---|---|
| Ads (LinkedIn / Meta / display) | Warm up, build awareness, prime the name | Before outreach starts |
| Email | Primary outreach, scalable, asynchronous | Day 1 |
| LinkedIn | Secondary touch, social proof, profile visit | Day 2-3 |
| Phone | High-intent follow-up after engagement signal | After email/LinkedIn engagement |
| Referrals | Leverage network for warm intros to top-tier accounts | Throughout |

For full sequence design, see `clusters/sequences/tasks/design-multi-channel.md`.

---

## 3. Key Mindsets

### On Personalization
- Personalize to the *person*, not just the company.
- Use specific numbers, not vague claims.
- Research should *inform your approach* (which hook to lead with), not just decorate the first line with a fact.
- **Effort allocation by tier:** Tier 1 = Creativity + Human Effort. Tier 2 = Automation + Smart Personalization. Tier 3 = Awareness + Scalable Reach.

### On Volume vs Quality
- Quality signals beat raw volume — 100 signal-based emails beat 1,000 cold ones.
- Stack signals for heat scoring: 3+ signals on the same account = reach out same day.
- See `clusters/signals/tasks/score-multi-signal.md` for the Cool → Warm → Hot scoring framework.

### On Timing
- **New role signals** peak at days 14-45 after the start date. Too early = they don't have authority yet; too late = the honeymoon's over.
- **Customer alumni** at new companies peak at days 90-180 post-job-change (onboarding mode, fresh budget cycle, looking for tools).
- **Website visitor signals** decay fast — act within 24-48 hours.
- **Engagement-on-LinkedIn signals** — 14-day rolling window is the standard recency filter.
- **Funding announcements** — wait 2-4 weeks. Day-of is noise; the buying process starts after the announcement settles.

### On Messaging
- Lead with pain, not features (see Principle 5).
- Soft CTAs outperform hard asks ("worth a 15-min look?" beats "book a demo").
- Humor reduces tension and increases response — but only when it's grounded, not performative.
- **Cold message under 70-80 words.** Many readers read the P.S. first — use it intentionally.

### On Attribution
- **Reply rate is the wrong success metric.** It optimizes for engagement, not pipeline.
- Track **full-funnel influence**: which outbound touches preceded which signups (incl. signups that look "Direct" or "Organic" in CRM).
- Two binary CRM properties (Outbound Campaign = TRUE on first touch; Sign Up = TRUE on conversion) enable joining "outbound-influenced signups" — usually 2-5× the reply-driven pipeline.
- See `clusters/campaign-ops/knowledge/outbound-attribution.md`.

### On Scaling
- **Don't scale unless 3 conditions are met simultaneously:**
  1. **Positive intent** — qualified replies + meetings + pipeline (not just "not now" replies)
  2. **Proven angle** — repeatable across SDRs AND across accounts in a segment
  3. **Stable deliverability** — bounce rate low + sender domain healthy + no warmup pause
- One SDR + one account = signal, not proof. Scaling unproven messaging = louder inefficiency.
- See `clusters/campaign-ops/knowledge/outbound-master-system.md` Step 7.

### On Tool Stack Discipline
- **"Not opened in 7 days → cut."** Tools accumulate; only weekly use justifies the seat.
- **"Claude Code skill (via MCP) replaces it → cut the standalone."** Orchestration via MCPs collapses tool-switching tax.
- **"$20K/month tool spend with no operating layer compounds nothing."** Tools sit on top of (a) the knowledge layer (Company OS), (b) the skill library, (c) the MCP execution layer. None of the tools matter without that underneath.
- A 30-tool stack used well outperforms a 60-tool stack used at 30 percent.
- See `reference/2026-tool-stack-and-mcps.md`.

### On AI-Native Operating Models
- **The "agent" definition that matters:** an agent is a **versioned skill** that pulls live data via MCPs, runs the workflow end-to-end, outputs reviewed work the team can call from terminal. Not a prompt (one-shot, no memory). Not a project (chat with stored context, ends at draft).
- The 4 operating layers, in order: Company OS (knowledge in GitHub) → client repos (per-client context, auto-synced) → skill library (the playbooks-as-code) → MCP + CLI execution layer (Claude can act, not just advise).
- **Headcount math:** traditional B2B services agency runs 8:1 staff:revenue per $M ARR. AI-native runs 2:1 or 1:1. The math doesn't require firing — it requires hiring operators who author skills, not more juniors.

---

## 4. Reply rate + conversion benchmarks (published numbers)

Calibrating expectations from real published agency data (Workflows.io, 2026):

| Approach | Reply rate / lift | Source |
|---|---|---|
| Cold (no signal) | 6-8% baseline | — |
| Single signal | 18-22% | gtm-master existing benchmarks |
| Multi-signal (3+) | 35-40% | gtm-master existing benchmarks |
| Customer alumni at new ICP company | **3-5× cold** (+15-30% qualified pipeline per quarter) | workflows.io |
| Social listening / engagement-on-external-content | **3-6× cold** | workflows.io |
| Multi-signal aggregate (across plays) | **2-10× cold** | workflows.io |
| Founder LinkedIn Connections (with 1+ year content investment building familiarity) | **25.4%** | workflows.io's own best play |
| ABM multi-channel meeting rate | 36% vs 10% non-ABM | — |

**Key insight:** the strongest signals come from your own marketing activity. The 25.4% reply rate above was driven by a year of consistent LinkedIn posting that built familiarity with the audience first. Content creates attention → signals capture that attention → outbound converts it.

## How this connects to the rest of gtm-master

| Principle | Operationalized in |
|---|---|
| Signal-based outreach | `clusters/signals/` (entire cluster) |
| You can't burn your TAM | `clusters/cold-email/tasks/re-engage-cold-leads.md` |
| Lead with pain | `clusters/cold-email/knowledge/copywriting-principles.md`, `atl-btl-messaging.md` |
| Segment, don't over-personalize | `clusters/cold-email/tasks/personalize-at-scale.md` (modular variant approach) |
| Multi-channel coordination | `clusters/sequences/tasks/design-multi-channel.md` + `clusters/sequences/knowledge/tiered-routing-template.md` |
| Heat scoring (3+ signals) | `clusters/signals/tasks/score-multi-signal.md` |
| Scale what top performers do | `clusters/campaign-ops/tasks/tier-campaigns.md` (find your winners, double down) |
| Don't scale until 3 gates pass | `clusters/campaign-ops/knowledge/outbound-master-system.md` Step 7 |
| Effort by tier (Creativity / Smart Auto / Reach) | `clusters/campaign-ops/knowledge/abm-operating-system-2026.md` Step 10 |
| Attribution beyond reply rate | `clusters/campaign-ops/knowledge/outbound-attribution.md` |
| Tool stack discipline | `reference/2026-tool-stack-and-mcps.md` |
| BIPSY diagnosis | This file — apply manually before reaching for any cluster |
