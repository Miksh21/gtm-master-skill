> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Deal Desk Operations and Deal Velocity Engineering

Two connected disciplines: the deal desk governs non-standard commercial deals (price, terms, packaging); velocity engineering fixes why deals move slowly. Both are system work, not rep coaching.

## PART 1: DEAL DESK

A mature desk cuts cycle time 20-35%, lifts win rate via deal quality, and protects margin leakage typically running 3-9%.

### When to Build One

Triggers: custom deal structures outnumber standard bookings; reps have too much pricing discretion (discounts cluster wildly by rep/region; "everyone just asks the CRO"); discount leakage tracking 8-12% of affected contracts or revenue leakage 3-5% of ARR; quote turnaround creeping past 24-48 hours; 15+ AEs, ACV > €50K, or >30% of deals with custom terms.

### Approval Matrix (discount depth × deal size)

| Discount | Approval path | SLA |
|---|---|---|
| 0-10% | Rep autonomy (self-serve) | n/a |
| 10-20% | Sales manager + deal desk review | 4-8 h |
| 20-30% | Regional VP + desk lead, written rationale | 8-12 h |
| 30%+ | CRO + CFO + desk, written strategic case | 24 h |

Overrides: enterprise deals (> €100K ACV) route >15% to VP regardless; >25% requires CRO visibility; usage/outcome structures require desk economics review before proposal. SMB (< €15K) can tighten thresholds and auto-approve packaged bundles. **Margin floor is a hard gate at every tier**: below target contribution margin → Finance + Board explicit exception, logged separately.

**Strategic override lane** (deals that fail the discount gate but carry strategic weight): rep flags with a 2-3 line rationale → desk scores strategic value 1-5 (beachhead? reference? target vertical?) → score ≥3 escalates to VP/CSO with full margin impact → approval logged to the deal record → 30-day review of all exceptions: did they produce the outcome? Without this lane, everything gets escalated as "strategic"; with it, noise separates from genuine cases. Keep max 4 tiers total; a 10-tier matrix stalls decisions.

### Quote Workflow and SLAs

Stage 1 Intake and validation (0-2 h): structured request (account, ACV, discount %, non-standard terms y/n, renewal terms); validate margin floor, fields, discount band; standard auto-routes, non-standard gets analyst review with customer history (prior discounts, churn risk, LTV). Stage 2 Approval routing (2-8 h standard, 4-24 h non-standard): approver reviews discount depth, strategic fit, precedent risk ("third €50K deal at 25% off in that vertical?"), implementation complexity; legal runs a parallel track (24-48 h SLA). Stage 3 Delivery (quote sent within 2 h of approval; signature SLA 72 h).

Targets: standard quote 4-6 h, non-standard 12-24 h, legal + pricing 24-48 h, 80%+ of quotes within SLA. Every 4 hours of quote delay costs 10-15% of early-stage deals.

### Discount Governance

Every approved discount records: reason (competitive / strategic / volume / loyalty), expiry (one-time, auto-renew, or expires at date; most should expire), precedent flag (first time at X% for this industry/size?), renewal behavior. At renewal: "expires" → standard list price; "holdover" → same discount (rare, explicit decision); no flag → standard price + 30-day orphan-discount audit. Target: untracked concessions < 2% of ARR; exception volume ≤ 5% of quarterly bookings (trending down may mean reps are hiding discounts: audit).

**Renewal uplift by cohort**, pre-planned 120+ days before renewal: Cohort A high-value/low-churn absorbs 12-15% increases; B mid-value 8-10%; C high-risk 0-5% or prune. CFO + CRO co-sign the strategy; track hold-rate per cohort (A churning 10%+ on first touch = adjust). Communicate increases 60+ days ahead; proactive communication cuts increase-driven churn from ~15% to ~5%.

### Non-Standard Structures

**Usage/consumption deals**: govern minimum commit (must cover CAC + onboarding, else flag as land-and-expand), overage unit pricing with 3-5% annual escalation, usage tracking method (customer-auditable dashboard), billing cadence + true-up language. Overages priced to hold 70%+ gross margin or it needs CRO rationale. If the customer's usage history is 2x the proposed minimum, renegotiate before signing.

**Outcome-based deals**: success metric observable and third-party auditable (customer's data, not your opinion); baseline documented pre-deployment; payout schedule explicit (retainer + bonus vs pure outcome); named dispute-resolution arbiter; exit clauses. CRO + Finance + Sales Ops jointly sign.

**Multi-year with step-ups**: tie step-ups to usage or performance triggers, never arbitrary; include a one-year freeze option; pre-plan a mid-contract check-in at year 1.5-2. Aggressive arbitrary step-ups = year-2 churn.

### Desk Metrics

Velocity: quote approval times vs SLA, % within SLA (80%+), deal velocity trend. Quality: discount leakage < 2% ARR, margin of desk-reviewed deals ≥ target, renewal hold-rate on custom-priced cohorts, **win rate of desk-reviewed deals ≥ non-reviewed** (if lower, the desk slows deals instead of improving them). Compliance: 100% documented discount reason, 100% explicit expiry, 100% strategic exceptions with documented outcome. Review velocity + compliance weekly, quality monthly.

Maturity: Level 1 ad-hoc (CRO approves everything, discounts undocumented) → formalize in 6-12 weeks (matrix, CPQ, 30-60 day discount audit). Level 2 formalized (matrix + SLAs) → add discount dashboard, cohort renewal strategy, consumption templates, monthly Finance governance review. Level 3 strategic (RevOps + Sales + Finance + Product; desk feeds pricing strategy: "the €50-100K segment sees 30% discounts, raise list price"): leakage <1.5% ARR, desk cost <1-2% of revenue managed.

## PART 2: DEAL VELOCITY

Velocity is a system output. You can't will deals faster; you fix the conditions that slow them.

```
Pipeline Velocity = (# Opportunities × Win Rate × ADS) ÷ Cycle Length
```

### Velocity Diagnostic

Step 1, scorecard from 12 months of CRM data segmented by deal size: cycle length vs benchmark, win rate, ADS trend, daily velocity, slippage % (benchmark 36%), zombie % (target <10%), multi-threading rate (target >77%), steepest stage conversion drop-off.

Step 2, identify the ONE constraint:

| Symptom pattern | Constraint | Fix |
|---|---|---|
| Low win rate + normal cycle | Qualification (bad deals in pipeline) | Tighten entry criteria, ICP gates |
| Normal win rate + long cycle | Stage progression (stalling) | Exit criteria + mutual action plans |
| Healthy metrics, low velocity | Volume | The one case where more pipeline IS the answer |
| High win rate + short cycle + low revenue | Deal size (winning small) | ICP expansion, pricing, land-and-expand |
| Everything looks OK, forecast misses | Zombie deals (inflated pipeline) | Pipeline deflation |

Step 3: fix one constraint at a time (Theory of Constraints). Context: cycles are up ~22% since 2022 market-wide; diagnose against segment benchmarks (SMB 14-30 days, mid-market 30-90, enterprise 90-180), not absolutes.

### Pipeline Deflation

More pipeline ≠ more revenue. The math:

```
BEFORE:  €20M pipeline → €4M closes (20%). Reflex: inflate to €25M. Reality: worse quality, conversion drops, still miss.
STEP 1:  Deflate. €20M − zombies = €15M → €4M closes (27%). Same result, less noise.
STEP 2:  Grow what converts. Fix handoffs, qualification, next actions → €5M closes (33%). Target hit, no extra pipeline.
```

**Zombie deal = 2+ of:** no activity 14+ days; close date pushed 2+ times; same stage >2x average stage duration; no scheduled next step; single-threaded; past original close date >30 days; no economic buyer at Proposal+. Triage each into revive / push (nurture) / close. CLOSE is right 60-70% of the time; most managers close too few. Slipped deals lose 67% of their win rate. Prevention: automated nightly zombie flagging, monthly scrub in manager 1:1s, quarterly purge with leadership. Zombie % >15% of pipeline = mandatory scrub within 5 business days.

### Stage Exit Criteria (the #1 tactical fix)

Advancement must reflect **buyer actions**, not seller activities ("they scheduled a CFO review" yes; "I sent the proposal" no). Cap 3-5 criteria per stage. Enforce three ways: CRM validation rules (required fields per stage; keep minimal), manager inspection in weekly review ("show me the mutual action plan"), automated deal-health degradation when criteria are missing. Top performers are 588% more likely to follow methodology, 241% more likely to have the EB engaged before solution presentation; winning deals average ~9 engaged contacts at that stage (Ebsta/Pavilion, 655K opportunities).

### Deal Health Scoring (weighted, automatable)

| Dimension | Weight | Scoring |
|---|---|---|
| Engagement recency | 20% | <7d=10, 7-14d=6, 14-21d=3, >21d=0 |
| Multi-threading | 20% | 4+=10, 3=7, 2=4, 1=1 |
| Stage velocity | 20% | below avg=10, 1-1.5x=6, 1.5-2x=3, >2x=0 |
| Methodology adherence | 15% | all criteria=10, most=7, some=4, few=0 |
| Next step quality | 15% | scheduled+confirmed=10, scheduled=6, vague=3, none=0 |
| EB access | 10% | met+engaged=10, identified=5, unknown=0 |

Bands: 80-100 healthy | 60-79 watch (coach in next 1:1) | 40-59 at risk (manager intervention this week) | <40 critical (likely zombie, triage now). Compute nightly; surface <60 deals in the weekly pipeline review.

### Multi-Threading

Data (Gong, 1.8M deals): 77% of deals are multi-threaded; winning deals have 2x more buyer contacts; multi-threading boosts win rate 130% on deals >$50K; 58% win rate with 4+ contacts; large strategic deals average 17 contacts. Single-threaded deals slip 2.5x more often. Score: 1 contact = critical, 2 = high risk, 3 = adequate for smaller deals, 4+ = healthy. "Engaged" = active communication in the last 30 days, not a CC'd name. Coaching questions for single-threaded deals: who else is affected by this problem? who uses it daily? who controls budget? who tried to solve it before? who would block this if excluded?

### Mutual Action Plans

Shared seller-buyer document of steps, owners, dates to reach a decision. Impact: +26% win rate (Outreach); combats the no-decision outcome that kills ~60% of complex deals; enables early EB engagement (+55% win rate). Rules: buyer owns >50% of the steps; every step has a date and named owner; reviewed on every call as a living document. If the buyer won't help build it, they're not serious. Require for deals >€30K ACV at proposal-stage entry.

### Compression Tactics, Ranked by Evidence

1. **Early economic buyer engagement**: +55% win rate; delayed EB engagement −113%. Implement: EB identified as a stage-2 exit criterion; no stage 3 without an EB meeting scheduled; no EB = Best Case at most, never Commit.
2. **Multi-threading from discovery**: minimum 2 contacts by end of stage 1, 3 by end of stage 2.
3. **Methodology adherence**: full adoption = +18% win rate, +24% deal size, 15-25% cycle reduction; continuous reinforcement beats one-time training (+27% win rate).
4. **Mutual action plans**: +26% win rate.
5. **Pipeline deflation**: restores forecast accuracy to ±10%; deals untouched 30 days need re-engagement or closure.

### Velocity Breach Rules

| Signal | Action | Owner |
|---|---|---|
| Health score < 60 | Manager reviews in next 1:1: coach, intervene, or close | Manager |
| Same stage > 1.5x average | Rep documents reason + next step within 48 h | Rep → manager |
| Close date pushed 2nd time | Manager joins next customer call | Manager |
| No activity 14+ days | 48 h to log activity or deal moves to at-risk review | Rep → manager |
| Single-threaded at stage 3+ | CRM blocks advancement until a 2nd contact is engaged | CRM-enforced |
| Segment win rate < 20% | Strategic review: ICP, qualification, or competition? | CRO + VP Sales |
| Cycle > benchmark +30% | Deflation sprint + exit-criteria audit | RevOps + VP Sales |

### The Top Performer Gap

Top performers out-earn the rest ~11x, and the gap is methodology adherence, deal discipline, and inspection rigor, not talent. All system-fixable: design the system to pull the middle 60% toward the top 20%. 76% of B-player deals lack critical milestone events (the root cause of slippage).

### 90-Day Velocity Program

Phase 1 Diagnose (weeks 1-3): extract data, find patterns, name the ONE constraint. Phase 2 Design (weeks 4-6): stage gates, health model, MAP template, zombie detection. Phase 3 Install and measure (weeks 7-12): activate, iterate, embed in the operating cadence.
