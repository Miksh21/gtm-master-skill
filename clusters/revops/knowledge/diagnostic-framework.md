> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# RevOps Diagnostic Framework

Find the real constraint before recommending any fix. Roughly 94% of revenue problems are system issues, not people issues (Deming). The problem almost never lives where the symptom appears.

## The Revenue System: Three Layers

```
GOVERNANCE   Strategy + priorities + KPIs + rhythm. The control system. "Steer, not hope."
ENABLEMENT   People + process + platforms + data spine. The infrastructure. "Design, not accumulate."
VALUE LOOPS  Product Value Engine + Revenue Engine. Where value is created. "Compound, not extract."
```

Direction flows down, results flow up. Break either flow and the system drifts.

- Governance failures look like: strategies reset every quarter, conflicting priorities, no shared KPIs, meetings without decisions, new initiatives launched without killing old ones.
- Enablement: companies hire people and buy tools but rarely design processes or build a data spine. Around 80-100 employees, change stops happening through direct relationships; you need communication plans, training, adoption tracking.
- Single Vision of Truth, not Single Source: one database is fantasy. Achievable: standardized dashboards + agreed definitions so leadership sees the same picture.
- RevOps owns Enablement. Infrastructure owner, not report factory. Authority to say no comes from Governance.
- Value loop failure: the product-to-revenue feedback loop breaks (win/loss, adoption patterns, ICP refinement not flowing back to product).

## Misdiagnosis Table: Symptom vs Actual Constraint

Problems almost always sit one layer out from where they appear.

| Symptom | Common blame | Actual constraint |
|---|---|---|
| Pipeline weak | Revenue engine | Processes don't qualify properly (Enablement) |
| Forecast wrong | Data | Definitions aren't aligned (Governance) |
| Reps underperforming | People | Platforms not configured for workflow (Enablement) |
| Too many initiatives | Busy people | No portfolio governance or WIP limits (Governance) |
| Churn at month 4 | CS team | Wrong ICP or broken onboarding (Value Loop) |
| "We need a new CRM" | Platform | Processes undefined, data spine missing |
| Marketing "doesn't generate pipeline" | Marketing team | No shared ICP, no feedback loop, broken attribution |
| Deals slip late in quarter | AE skill | No mutual action plan, weak multi-threading (Process + Governance) |

## The IFA Diagnostic (Information → Focus → Action)

Use when conversations go in circles, decisions don't stick, or meetings feel like deja vu. Diagnose the weakest link:

**INFORMATION: right signals and shared definitions?**
- Stage exit criteria defined, agreed, audited? Lost/stalled reasons logged, 60-day pattern known? Time-to-first-impact tracked? Dashboards show the same reality across teams?
- Weak: people debate numbers instead of decisions. Fix: align definitions, build the data spine, shared views.

**FOCUS: rhythm, decision rights, clear priorities?**
- Weekly revenue review with default agenda? Breach definition (exception needing immediate action)? Go/No-Go owner and stop-rules for experiments? Decisions logged with owner, deadline, expected impact?
- Weak: decisions don't stick, too many parallel initiatives. Fix: install cadence, DACI decision rights, WIP limits, decision log.

**ACTION: do decisions execute and learnings spread?**
- Last month's top 3 decisions: owner, status, impact? When something works, how does it spread? Experiments time-boxed with success metrics?
- Weak: great discussions, no follow-through. Fix: action tracking in the cadence, spread mechanisms, experiment backlog with kill criteria.

Sequence: Action weak → check Focus first. Focus weak → check Information first. Fix the weakest link; downstream links often resolve.

## The Six Stages of Check

Scan in order before blaming people or adding resources. The problem usually lives higher in the stack:

1. **PURPOSE**: goal clear, success defined? If not, no process or tool helps.
2. **DEMAND**: real demand, right market/segment/ICP, urgent problem? If not, fixing execution is pointless.
3. **CAPABILITY**: skills, tools, knowledge to execute? Train/hire/tool only after 1-2 confirmed.
4. **FLOW**: work moving without waste, bottlenecks, unnecessary handoffs? Queues building? Fix: process redesign, bottleneck analysis.
5. **SYSTEM CONDITIONS**: data quality, tool config, integration reliability, team structure supporting the work? Fix: infrastructure.
6. **MANAGEMENT THINKING**: leadership's mental model accurate? Hardest to fix; requires an honest data-vs-belief conversation.

## Quick Triage (5 Minutes, Before the Full Diagnostic)

Decision tree (Union Square Consulting GTM Efficiency Pyramid):

```
"What will impact revenue most?"
├─ MORE NEW BUSINESS
│   ├─ Generating pipeline? → Inbound producing qualified leads? NO → diagnose INBOUND
│   │     YES → Outbound producing meetings? NO → diagnose OUTBOUND
│   │     YES → the problem is PIPELINE MANAGEMENT
│   ├─ Closing pipeline? → diagnose PIPELINE MANAGEMENT (always start here)
│   └─ Could existing customers give more? → check EXPANSION before adding top-of-funnel
└─ IMPROVING NRR
    ├─ Churn → diagnose RENEWALS (health scoring, renewal process, save plays)
    ├─ Expansion → diagnose EXPANSION (signals, whitespace, handoff to sales)
    └─ Both → start with CHURN. Expansion on top of churn is a leaky bucket.
```

**Fix pipeline management first.** More pipeline into a broken process = more waste. Order: 1) pipeline management, 2) inbound/outbound generation, 3) CS (often fastest path, fix in parallel), 4) partner (only if a motion exists).

**Per-motion layer check** for the prioritized motion:

| Layer broken | Symptom | Fix + time |
|---|---|---|
| Fundamentals | "No defined process for this" | Define, document, implement (2-4 wk) |
| Adoption | "We built it but nobody uses it" | Reporting, coaching, management cadence (4-8 wk) |
| Optimization | "We do things but don't know what works" | Analytics, attribution, conversion tracking (8-12 wk) |
| Acceleration | "We know what works but can't scale it" | Automation, AI (12+ wk; only if layers 1-3 solid) |

Triage output: priority motion, stuck layer, estimated fix time, then run the full diagnostic on that motion.

## Capacity vs Productivity Diagnosis

| Signal | Capacity problem | Productivity problem |
|---|---|---|
| Pipeline volume | Low | Adequate |
| Win rate | Normal | Low |
| Activity level | Low | High |
| Deal velocity | Normal | Slow |
| Fix | More pipeline sources | Better qualification, process, tools |

Test questions: If pipeline doubled tomorrow, would revenue double? (No → constraint is downstream.) If AE headcount doubled, would revenue double? (No → constraint is pipeline quality.) Where do deals stall longest? (That is the bottleneck.)

Activity theater: high activity metrics + low win rate + many proposals, few closes. Fix: tighten qualification gates, shift toward inbound-fed model.

## The Revenue Flywheel Check

Data quality → forecasts → coaching → rep behavior → data quality. Check each link:
1. Forecasts based on clean data? Inconsistent stage definitions = garbage forecast.
2. Managers coach from forecast data, or gut instinct?
3. Reps change behavior after coaching tied to specific data-backed actions?
4. Reps log activity and update stages accurately? If they don't trust the system, they don't feed it.

Most common break: data quality → forecast. Fix by escalating data quality to exec level ("code red"), not by tweaking coaching.

## Structural Alignment Audit

Pick the top exec goal. For each function ask: what metric do you own that contributes to it? How measured? How often reviewed? In your comp? Any function failing all four = alignment gap.

Behavior = f(Metrics, Visibility, Frequency, Compensation). Example failure for an NRR goal: Sales comp = 100% new logo, CS comp = NPS only, Marketing comp = MQL volume → nobody drives NRR.

## Diagnostic Artifacts

**A3-Lite (one page):**
```
PROBLEM:        Specific + measurable ("SQL→Close dropped 25%→16% in Q3 mid-market", not "pipeline is bad")
CURRENT STATE:  What the data shows. Facts, not opinions.
ROOT CAUSE:     Trace via Six Stages / IFA. Apply 5 Whys.
COUNTERMEASURE: Specific change ("SPICED gate between SAL and SQL with mandatory CRM fields")
IMPLEMENT:      Owner, timeline, resources.
CHECK:          Metric + when measured + stop-rule.
```

**5 Whys discipline:** write each answer down; answers must be factual (get data before guessing); 3-7 whys is fine, stop at a systemic actionable cause; if a Why points at a person, go one more (training? incentive? process? tool?); branches are normal.

**Strategy scorecard row:** GOAL → LEVER → OWNER → METRIC → STOP-RULE. Example: NRR 98%→110% → expansion pipeline with QBR-triggered upsell → Head of CS → expansion pipeline value per quarter → if <40% of target by end of Q2, escalate.

**DACI:** Driver (runs the process), Approver (one person, final say), Contributor, Informed. Map for every recurring decision that causes confusion.

## Integration Architecture Check

Ask: how many systems keep their own copy of customer data? (3+ = definitions drift.) How many direct system-to-system integrations? (10+ = brittle; 25+ = critical maintenance burden.) When a metric definition changes, how many places need updating? (>1 = no semantic layer.) Point-to-point is O(n²) complexity; hub-and-spoke O(n); shared data substrate O(log n). Most scale-ups: a CRM hub plus dozens of point-to-point around it. If integration is a top pain, the constraint may be architectural, not operational.

## Running a Diagnostic Session

Pre-work: ARR + growth + NRR/GRR/CAC payback, org chart, ICP definition, tech stack, meeting cadence, top 3-5 pains per leadership, latest board deck/QBR.

Sequence: 1) listen for symptoms, 2) map to system layers, 3) IFA, 4) Six Stages, 5) score four capabilities 1-4 (Customer Insight, Revenue Efficiency, Enablement, Governance; fix the weakest ENABLING constraint first: Governance at 1 makes fixing anything else pointless), 6) name the single constraint, 7) draft one A3-lite, 8) propose a 2-week micro-experiment.

There is always ONE constraint that limits the system more than any other. Fix it, then find the next one.

## Crisis Mode: When Multiple Systems Break at Once

Switch from diagnostic to triage when ANY of these fires:

```
FORECAST:  Missed 2+ consecutive quarters, or variance >±30%
WIN RATE:  Down 5+ points over 3 quarters
PIPELINE:  Coverage below 2.8x AND falling month over month (below 2.8x, quota attainment drops to 52%)
RETENTION: NRR below 90% or GRR below 84%
DATA:      Critical deal fields <70% complete; CRM vs finance mismatch >10%
TRUST:     Functions blaming each other; leadership doesn't believe the numbers
```

### 4-Week Emergency Triage

**Week 1: DATA AUDIT.** Sample 200 random open deals. Targets: amounts populated 95%+, close dates updated last 14 days 95%+, sensible stage 98%+, contact roles 80%+, activity last 30 days 85%+, next step 80%+, lost reason on closed 95%+, customer name matches finance 99%+. Below 70% = data crisis: run a 5-day blitz (day 1 sort by completeness and find root cause; days 2-3 bulk-fix objective data + validation rules; days 4-5 daily 15-min data standup + assign data owner per team). Below 70% overall, STOP: nothing else matters until data is fixed.

**Week 1-2: CASH DIAGNOSIS.** 2-hour version: pull deals closing in 30-60 days + renewals due in 30-90 days, stack rank by amount, flag at-risk (no recent activity, no champion, competitor, EB not engaged), top 10 at-risk = the downside number for leadership, assign an EXECUTIVE owner to each (CRO/VP, not the deal owner), define next tangible action with a deadline this week. Start a daily 15-min cash standup (CRO, VP Sales, VP CS, RevOps), one line per deal, run for 60 days.

**Week 2-3: ROOT CAUSE.** Six Stages in fast mode, one stage per day. Day 4 (Flow): pick 20 random deals, find where they stall. Output: one-page root cause summary (crisis, evidence, root cause checkbox, the ONE immediate fix, owner, 1-3 week timeline).

**Week 3-4: CONSTRAINT.** Score Governance / Enablement / Revenue Engine / Customer Insight 1-2 only. Emergency constraint = the one scoring 1. All four at 1 → start with Governance (you need a steering mechanism first). Unlocks: Governance=1 → install daily standup + decision driver. Enablement=1 → data audit + 3 non-negotiable processes. Revenue=1 → win rate analysis, talk to 5 lost deals fast. Insight=1 → pattern-match top 5 wins vs 5 losses.

### 30-60-90 Crisis Response

- **Days 1-30 STABILISE:** data audit done (target 85%+), top 10 at-risk deals with exec sponsors, daily cash standup running, root cause named, first structural fix live, one visible quick win, all non-essential projects halted.
- **Days 31-60 DIAGNOSE AND FIX:** full IFA + maturity assessment, fix roadmap of 3 initiatives max, first major structural change designed, weekly leadership update ("here is what broke, here is the fix"), baseline-vs-now measurement.
- **Days 61-90 REBUILD:** first change at 70%+ adoption, initiatives 2-3 in design (never launch 3 at once), operating cadence installed, forecast rebuilt properly, trusted dashboard live, team pulse improving.

Crisis don'ts: don't launch multiple fixes at once, don't reorganize people mid-crisis, don't buy tools to fix process problems, don't hide the numbers from the board.
