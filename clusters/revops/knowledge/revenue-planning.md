> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Revenue Planning, Capacity, and Org Design

The plan of record is a commitment contract between revenue, finance, and the market. A plan sales owns and can defend beats a perfect plan sales doesn't believe.

## Principles

1. **Bottoms-up first, then top-down.** Build from capacity and known pipeline; finance adds ambition; reconcile the gap with named scenarios, never by spreading a number unilaterally.
2. **Separate three questions:** what CAN we produce (capacity model), what do we WANT to produce (strategic target), what does the market ALLOW (ICP/TAM sizing). Conflating them creates noise.
3. **Version control:** bottoms-up original, finance stretch, and plan of record all survive. Every reforecast preserves the prior baseline.
4. **Stretch targets are scenarios, not directives.** Every euro of stretch has a named scenario, an owner, and explicit assumptions. A stretch without owners is a wish.
5. **Reforecasting is triggered, not continuous.** Fixed triggers and windows; continuous re-planning creates chaos and erodes ownership.
6. **FP&A and RevOps are joint decision-makers.** RevOps owns pipeline reality and call quality; FP&A owns financial implications. A forecast that doesn't reconcile across both gets revised, not approved.

## Annual Planning Calendar (12 weeks, backwards from board approval)

```
PHASE 1 (wk 1-2):  Retrospective data + team input window (capacities, market intel, customer feedback)
PHASE 2 (wk 3-5):  Bottoms-up build: account planning by segment, capacity model, segment roll-up
PHASE 3 (wk 6-8):  Top-down shared; reconciliation meeting(s); revised plan with scenarios + finance impact
PHASE 4 (wk 9-10): Executive validation; Plan of Record locked; sensitivity analysis; board narrative
PHASE 5 (wk 11-12): Board materials + presentation; approval; budget allocation
BUFFER:            Sales enablement, quota setting, incentive finalization
```
Lock the board date first, work backwards. Compressed cycles (8-10 weeks) compress data gathering or validation, never reconciliation.

## Bottoms-Up Build

1. **Baseline** current ARR by segment tier (SMB/MM/Ent) and revenue type (new/expansion/renewal).
2. **Capacity model:**
```
Annual bookings capacity = effective FTE reps × annual quota
Effective FTE = tenured reps × 100% + ramping reps × ramp factor
Example: 4 tenured + 3 ramping at 80% = 6.4 FTE × €850K quota = €5.44M
Adjust: + expansion from base (typically +15-20%) + inbound/self-sourced contribution (10-30%)
```
3. **Named pipeline overlay:** audit CRM for deals above threshold with confirmed timelines; probability-weight them. Named pipeline far above capacity expectations = document why; far below = that's the pipeline generation gap for the year.
4. **Per-type assumptions:** new business = capacity × historical attach; expansion = current expansion ARR × retention × (1 + expansion rate); renewal = renewal ARR × GRR (most predictable).
5. **Assumptions sheet** as the contract with finance: assumption | value | source/owner | confidence (e.g. renewal GRR 97% HIGH, expansion growth 12% MEDIUM, AE capacity €850K MEDIUM, SDR pipeline contribution 35% MEDIUM, inbound:outbound mix LOW).

## Reconciliation Meeting (90 min)

1. Set the frame (5 min): not a negotiation, a diagnostic. Two independent analyses; convergence = confidence, divergence = something to learn.
2. Present bottoms-up (20 min): segments, capacity model, named pipeline.
3. Present top-down (10 min): strategic target, drivers, sensitivity.
4. Close the gap (40 min) with named scenarios: e.g. gap €700K = hiring scenario (+€350K, owner assigned) + expansion acceleration (+€250K, CS owner) + pipeline-generation investment (+€100K, marketing owner).
5. Lock plan of record (10 min): base (bottoms-up) + stretch (scenarios with owners and dependencies). If hiring slips, the plan adjusts.
6. Document and distribute to the whole revenue org; one agreed number.

If the gap won't close, escalate honestly: "The market will not support this plan unless we make these three bets. We own two. The third depends on product. What is product committing to?"

## Versioning and Reforecasting

Three versions persist forever: Bottoms-Up Original (BO), Finance Stretch (FS), Plan of Record (POR). Each reforecast compares current projection against POR AND BO (did we miss capacity, or did execution slip?).

Cadence: monthly lightweight review (1 h; flag >±10% variance from POR), quarterly full reforecast (4 h; update all assumptions), trigger-driven full reforecast within 5 business days of a trigger firing. Boundaries: quarterly minimum, weekly maximum (paralysis); standard = monthly reviews + quarterly reforecasts.

**Triggers:**
- Revenue: coverage < 2.5x; month-end close rate < 60% of plan; forecast variance > ±20% two consecutive months; named-deal slippage > 50%.
- Unit economics: NRR < 105%; CAC payback > 14 months; gross margin erodes > 3% below plan.
- Execution: actual variance > 15% two consecutive periods; hiring plan slips; major churn event (large single ARR loss).
- External: competitor disruption hitting win rate; macro shock; product release delay 6+ weeks.

**Locked mid-year (never reforecast):** quota targets, headcount plan (board-committed), comp structure, ICP/positioning. **Flexible:** revenue target, pipeline assumptions (conversion, velocity, mix), stretch scenario owners, reforecast cadence itself. Mixing locked and flexible parameters is the primary cause of reforecasting chaos.

Coverage bands for escalation: <2.5x critical, reforecast now | 2.5-3.0x at risk, plan generation response | 3.0-3.5x healthy | 3.5x+ strong. Accuracy: ±5% elite | ±10% strong | ±15-20% normal | ±25%+ structural fix.

**FP&A + RevOps model:** weekly 30-min sync (material forecast changes flagged immediately; no surprise reforecasts); joint sign-off on POR and reforecasts; RevOps owns feasibility of stretch scenarios and capacity math, FP&A owns financial modelling and cost allocation.

## Planning Process Diagnostic (10 questions, No/Unknown = process risk)

1. Formal planning calendar with locked phase dates? 2. Can you produce bottoms-up from capacity + pipeline alone, without finance input? 3. Three plan versions preserved? 4. Every euro of stretch has a named scenario + owner + assumptions? 5. Reforecasts compare against POR and BO? 6. Documented list of what may NOT change mid-year? 7. FP&A and RevOps review material changes together in real time? 8. Explicit reforecast triggers articulated? 9. Do reps know the plan of record and their segment targets? 10. Can a miss be traced to a specific assumption rather than "execution" or "market"?

Scoring: 8-10 yes = strong discipline; 5-7 = fix gaps next cycle; <5 = plan the planning process before setting targets.

## GTM Motion and Capacity Reference

**Touch model by ACV** (motion must match economics; €5K ACV can't fund a €200K OTE AE, €100K ACV can't rely on self-serve):

| Motion | ACV | Deals per AE per year | Org model |
|---|---|---|---|
| No-touch (self-serve) | <€1K | n/a | Marketing + product |
| Low-touch (PLG + light sales) | €1-10K | 80-120 | Small inside sales |
| Medium-touch (inside/velocity) | €10-50K | 25-40 | SDR → AE, structured process |
| High-touch (field/enterprise) | €50-250K | 8-15 | SDR → AE → SE, territories |
| Dedicated (strategic/named) | €250K+ | 3-6 | Named account pod + exec sponsor |

Hybrid motions are normal above €10M ARR; keep them operationally separate (own funnels, metrics, teams). Never launch two new motions simultaneously.

**Team ratios:** SDR:AE = 1:2-3 inbound-heavy, 1:1-2 balanced, 2:1 outbound-heavy, 1:1 enterprise. AE:SE = none for SMB, 3-4:1 mid-market/enterprise, 2:1 strategic. CSM load = 20-40 accounts high-touch, 40-80 mid, 100-200+ tech-touch. Manager span = 6-8 SDRs or SMB AEs, 4-6 enterprise AEs, 6-10 CSMs.

**Headcount model:** revenue target ÷ ADS per segment = deals needed → ÷ deals per ramped AE = AEs needed → adjust for ramp (new hires ~50% productivity in year one) → add SDR/SE/manager/CSM ratios → fully loaded cost = OTE × 1.3-1.5 → validate GTM spend ÷ new ARR < 1.5.

**Ramp:** month 1 = 0%, months 2-3 = 25%, months 4-5 = 50%, month 6+ = 75-100%; full productivity month 6 mid-market, months 9-12 enterprise; industry average 11.2 months. Implication: reps needed producing in Q3 must be hired by Q1 (or prior Q4 for enterprise). AI-assisted onboarding programs target compressing 11 → 3-5 months, which changes hiring lead-time assumptions.

**Territory design:** equal opportunity (TAM-weighted), not equal account counts; start geographic, add named accounts for enterprise (20-50 per AE; 5-15 strategic), vertical overlays last; design to scale by splitting, not reorganizing. Sizing check: each territory needs 3-4x pipeline potential vs quota. Balance check quarterly: pipeline per territory within ±10-15% of median; large win-rate variance across territories = design issue, not rep issue.

**Quota and comp quick numbers:** quota-to-OTE ratio ~5:1; AE pay mix 50/50 (60/40 enterprise); manager 60/40; SDR 60/40-70/30; accelerators ~1.5x rate above 100% of quota. A healthy plan produces spread: top performers 130%+ of OTE, average 95-105%, underperformers below 80%. When only ~43-58% of reps hit quota (market medians), treat it as a target-setting problem: set quota bottom-up from measured productivity (cost per meeting, stage conversions, cycle length, AE meeting capacity), add stretch only when the inbound engine is proven.

**RevOps team sizing:** first RevOps hire at €3-5M ARR (earlier if GTM is complex; triggers: nobody trusts the CRM, no reliable pipeline report, comp administration eats days). Team by stage: €5-15M = 1 generalist manager; €15-30M = 2-3 (+analyst); €30-75M = 4-6 (+ops leads per function); €75-150M = 7-10 (+architect). Staffing ratios: AE:RevOps from 4:1 (small) to ~12:1 (100+ AEs); budget rule 5-10% of GTM budget. First hire is always a generalist connective-tissue manager, never an analyst or admin.

**Efficiency gates:** GTM Efficiency Ratio (total GTM spend ÷ net new ARR) < 1.5 healthy; CAC payback > 24 months = the motion destroys value even while adding ARR; Magic Number and payback benchmarks in knowledge/metrics-definitions.md.

**Acquisition vs retention math:** left of the bow tie plans in conversion rates and frequency (marginal improvements compound polynomially); right side plans in retention rates and time (small NRR gains compound exponentially over 3-5 years). At 80% GRR you churn 20% of ARR yearly and run to stand still; model retention before adding logo targets.
