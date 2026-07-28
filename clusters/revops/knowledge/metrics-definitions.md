> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Revenue Metrics: Definitions, Formulas, Benchmarks

Metrics are diagnostic tools, not scorecards. Every metric must connect to revenue through an articulable causal chain (metric → behavior change → revenue impact); otherwise it is a vanity metric. Kill it.

## The Funnel: Volume Stages

Full 12-stage model: V1 Visitors → V2 Leads → V3 MQLs → V4 SALs → V5 SQLs → V6 Opportunities → V7 Proposals/Demos → V8 Negotiations → V9 Closed Won → V10 Onboarded → V11 Retained → V12 Expanded.

Minimum viable funnel: Leads → MQLs → SQLs → Opportunities → Closed Won → Retained → Expanded. If you can't measure these seven reliably, fix that before anything else.

## Conversion Benchmarks (B2B SaaS)

| Stage | Benchmark |
|---|---|
| Lead → MQL | 20-25% average (heavily depends on lead definition and source) |
| MQL → SQL | 15-21% average; top performers 39-40% (scoring-driven) |
| SQL → Opportunity | 60-80% (practice-based) |
| Opportunity → Win | 15-30%; enterprise 15-20%, SMB 25-35% |
| Overall Lead → Win | 1-3% composite |

Healthy lifecycle-stage funnel shape (practice-based): 40% Subscriber→Lead, 30% Lead→MQL, 20% MQL→SQL, 25-30% SQL→Opportunity. Consistently lower = definitions or qualification broken; higher = upstream stages too lenient.

## Revenue Diagnostic Walk

```
Revenue = Opportunities × Win Rate × Avg Deal Size ÷ Sales Cycle Length

Revenue down? Walk in order:
1. VOLUME:     enough entering the funnel? (leads/MQLs/SQLs/opps vs target + trend)
2. CONVERSION: which stage is breaking? (MQL→SQL = scoring/handoff; SQL→Opp = qualification; Opp→Win = sales process/competition)
3. VALUE:      deal sizes holding? (ADS trend, discount rate, product mix)
4. VELOCITY:   pipeline moving? (days per stage, cycle length, stalled deals)
5. RETENTION:  base healthy? (GRR, NRR, churn cohorts, health scores)
```

**Breakout analysis** once a metric is off: slice WHO (rep/team: systemic or individual?), WHAT (product), WHERE (segment, source, territory), WHEN (cohort, period: did something change at a point in time?). Example: win rate 25%→18% → enterprise at 12% while mid-market fine → one region at 8% → 70% of losses "lost to competitor" → competitive fix, not a sales-wide fix.

## The Four Pipeline Velocity Levers

```
Pipeline Velocity = (# Opportunities × Win Rate × Avg Deal Size) ÷ Sales Cycle Length
Example: 100 opps × 25% × €40K = €1M; at 90-day cycle = €1M/quarter; cut cycle to 75 days = €1.2M/quarter.
```

1. **Opportunities (volume):** inbound, outbound, partner, PLG. Warning: volume without quality wastes sales capacity.
2. **Win rate (conversion):** qualification, process, positioning, multi-threading. Compounds: 25%→30% = 20% more revenue.
3. **Avg deal size (value):** multi-product, packaging, value selling. Warning: don't chase wrong-fit large deals.
4. **Cycle length (speed):** remove friction, mutual action plans, exec alignment. Warning: skipping stages cuts win rate.

A 10% improvement on each lever compounds to ~49% velocity improvement. Teams tracking velocity weekly grow 34%/yr vs 11% for ad-hoc trackers (Factors.ai).

## Unit Economics

```
CAC = Total S&M spend ÷ new customers. Fully loaded: sales comp, marketing, SDR, SE, allocated RevOps, tools.
Segment separately: inbound vs outbound CAC (2-5x difference), SMB vs enterprise, new vs expansion (expansion CAC ≈ 20-40% of new-biz CAC).

LTV = ARPA × gross margin × (1 ÷ annual churn rate).
With NRR > 100% the simple formula breaks (infinite lifetime); use 5-year DCF or cap lifetime at 5-7 years.

LTV:CAC. Minimum 3:1. Sweet spot 3-5:1. Above 5:1 = likely under-investing in growth.
By segment: enterprise 5:1+, mid-market 3-4:1, SMB 2-3:1.

CAC Payback = CAC ÷ (ARPA × gross margin), in months.
<12 excellent | 12-18 strong | 18-24 acceptable (enterprise) | >24 concerning.
By segment: SMB 8-12, mid-market 14-18, enterprise 18-24. Median market 15-16.
```

## Retention and Expansion

```
NRR = (Beginning ARR + Expansion − Contraction − Churn) ÷ Beginning ARR
<90% critical | 90-100% below par | 100-110% good | 110-120% strong | 120%+ exceptional. Median ~106%; top performers 130%+.

GRR = (Beginning ARR − Contraction − Churn) ÷ Beginning ARR (always ≤ 100%)
<80% serious problem | 80-85% below average | 85-90% average | 90-95% strong | >95% exceptional.
```

Why NRR beats growth rate: 50% growth at 80% NRR requires acquiring 70% of the base yearly just to keep pace; 30% growth at 120% NRR needs only 10%. The second business is more durable.

**Revenue composition** at €25M+ ARR: New Business 30-50% of gross new ARR, Expansion 30-50%, GRR >90%. Expansion <20% = money on the table; new business >70% = too acquisition-dependent. Mature SaaS often gets 50-60% of new ARR from expansion.

## Growth Benchmarks

```
Rule of 40 = growth rate % + profit margin %. Above 40 = healthy. Below €25M ARR, growth matters more than the rule.
Burn Multiple = net burn ÷ net new ARR. <1x exceptional | 1-1.5x strong | 1.5-2x average | 2-3x concerning | >3x alarming.
Magic Number = net new ARR ÷ prior-quarter GTM spend. >1.5 under-investing | 1.0-1.5 efficient | 0.5-1.0 optimize | <0.5 cut and diagnose. Median 1.37 (2025).
GTM Efficiency Ratio = total GTM spend ÷ net new ARR. <1.0 excellent | 1.0-1.5 good | 1.5-2.0 concerning | >2.0 broken.

Growth by stage (YoY): €1-5M ARR 100-200% | €5-15M 70-120% | €15-50M 40-80% | €50-100M 30-50% | €100M+ 20-40%. (T2D3 = triple, triple, double, double, double.)
```

## Quota and Productivity Benchmarks

| Metric | Value |
|---|---|
| Average quota attainment | 43% (RepVue) to ~58% (Bridge Group); 46% of reps hit quota in 2025 (Ebsta) |
| Healthy target | 70-80% of reps hit quota; below 50% org-wide = quota-setting flaw, not a performance problem |
| Rep time actually selling | 28% (2024) → 40% (2026, Salesforce State of Sales) |
| Time to full rep productivity | 11.2 months average (Sales Management Association) |
| High-performer premium | 400% more productive; 800% in complex roles (McKinsey) |
| Inbound vs outbound | Inbound leads cost 61% less; buyers initiate first contact 83% of the time (6sense) |
| Human-SDR touches per outbound opportunity | 1,000-1,400 (2026) vs 200-400 five years prior; ~70% of outbound opportunities booked via phone |

Revenue per AE = f(pipeline quality × conversion × velocity × capacity utilization). Low revenue/AE: pipeline quality → ICP drift; conversion → qualification gaps; velocity → process friction; utilization → AEs prospecting instead of closing (AEs who mostly close produce 3-4x revenue per head).

## Predictability Metrics

- Forecast variance: target <10% coefficient of variation.
- Pipeline quality score: % of pipeline meeting methodology threshold.
- Win rate variance by segment: high variance = wrong ICP or inconsistent qualification (e.g. enterprise 35% vs mid-market 12% means mid-market ICP or motion is wrong).
- Cycle time consistency: standard deviation of days-to-close per segment.
- Stage conversion stability quarter over quarter.

Productivity-first quota test: know cost per meeting, conversion at every stage, cycle length, and AE meeting capacity before setting any quota. Only hire AEs when there is pipeline to fill their calendars.

## Cohort Analysis

Revenue cohorts: group customers by acquisition quarter, track revenue at month 0/6/12/18/24. Look for: cohorts growing over time (NRR > 100%), first-6-month loss (early churn = onboarding problem), newer cohorts outperforming older (product improving). Payback cohorts: CAC per cohort ÷ monthly contribution (ARPA × GM) = payback months; improving payback cohort-over-cohort is one of the best health indicators.

## Role-Based Scorecards (Cascade)

- **Executive** (weekly/monthly): ARR + growth, NRR/GRR, Rule of 40, coverage ratio, forecast accuracy, CAC payback, LTV:CAC, burn multiple. Question: on track and efficient?
- **Manager** (weekly): pipeline created vs target by rep/source, stage conversion vs benchmark, win rate by segment/source, ADS trend, cycle by stage, forecast vs actual by rep, speed-to-lead, MQL acceptance. Question: where do I coach?
- **Rep** (daily): personal pipeline + coverage, deals by stage, activities, personal win rate + ADS, attainment %, deals at risk. Question: what do I work on today?
- **RevOps** (weekly): data quality score, process compliance (stage gates, methodology fields), forecast accuracy trend, velocity trend, integration sync health, field usage. Question: is the system working as designed?

Cascade rule: every rep metric rolls up to a manager metric rolls up to an executive metric. No path to a north star = stop tracking it.

## Deal Health: 6 Dimensions (score each 0-3, sum 0-18)

| Dimension | 0 | 1 | 2 | 3 |
|---|---|---|---|---|
| Next steps quality | None | Vague | Specific date + action | Mutual action plan with milestones |
| Activity velocity | None 14+ days | Sporadic | Weekly touchpoints | Multiple/week, multi-channel |
| Multi-threading | 1 contact | 2 | 3-4 | 5+ incl. decision-maker |
| Access to power | No EB identified | EB identified, no contact | EB met once | EB actively engaged |
| Review communication | Never reviewed | Monthly | Bi-weekly | Weekly with manager |
| Methodology adherence | No qual data | Partial (2-3 fields) | Complete | Leveraged in deal strategy |

Composite: 13-18 healthy | 10-12 watch (review in next forecast call) | ≤9 at risk (immediate intervention). Context: top performers score 2.64x higher on pipeline management, 43% better win rate, 455% better discovery quality (Ebsta/Pavilion).

## Conversational Intelligence Metrics

| Metric | Target | Why |
|---|---|---|
| Talk ratio (rep share) | 40-60% | >60% = pitching, not discovering |
| Longest monologue | <2.5 min | Long monologues lose attention |
| Customer story shared | ≥1 per call | Trust and engagement depth |
| Interactivity (turn frequency) | every 30-60 sec | Dialogue, not presentation |
| Patience after question | ≥3 sec | Rushed answers = not listening |
| Discovery questions per call | 11-14 | Below 8 = insufficient discovery |

Coach talk ratio and question rate first; highest correlation with discovery quality.

## Strategic Initiative Trackers

Seven views that turn pipeline data into intelligence: competitor mentions + win rate against each (monthly), objection frequency + resolution rate (monthly), deal momentum acceleration/deceleration (weekly), value-prop effectiveness vs wins (quarterly), new product attach rate in deals (monthly), churn risk signals (weekly), reference-ready customer pipeline (quarterly). Sources: call transcripts, deal fields, health scores.

## AI-Native Product Metrics (if AI is the product)

Four signal layers: explicit feedback (thumbs, surveys) → implicit behavior (edit intensity, copy/send rate of AI drafts) → adoption (messages per DAU, depth over frequency) → business impact (resolution rate, automation rate, work completed, time saved). Metric shifts: seats → digital capacity / FTEs augmented; DAU/MAU → work completed per user; NPS → output quality + resolution rate; ARR per customer → consumption per customer. When AI agents run outreach or calls, separate agent metrics from human metrics on every dashboard; blended numbers hide whether lift comes from targeting, message quality, or volume.
