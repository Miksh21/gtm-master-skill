> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Revenue Forecasting

A forecast is a commitment, not a wish. Goal: narrow the range of outcomes to something the business can plan against. ±5% variance is exceptional, ±15% normal, ±30% means the system is broken.

## Principles

1. **Forecast the process, not the outcome.** Don't ask "will this close?" Ask: next step? when? who's in the room? what must be true to advance? Forecast quality = deal inspection quality, not seller optimism.
2. **Multiple lenses beat single methods.** Use at least two methods and triangulate. Convergence = confidence; divergence = diagnostic.
3. **Segment conversion rates.** Enterprise vs SMB, inbound vs outbound, new vs expansion all convert differently. Blended averages produce useless forecasts.
4. **The forecast call is a management tool.** Identify at-risk deals, mobilize resources, make generation decisions. Reps reading deal updates = wasted time.
5. **Measure accuracy relentlessly**, by rep, segment, quarter. Who over/under-forecasts is itself actionable.

## Method 1: Category-Based Forecasting

| Category | Definition | Expected close rate |
|---|---|---|
| COMMIT | Rep would bet their job on it. Confirmation received, terms agreed, procurement/legal in process, close date in period. | 85-95% |
| BEST CASE | Well-progressed, one or more risks remain (procurement delay, competitor, budget approval). | 40-60% |
| UPSIDE | Could close if everything breaks right; often a timing question. | 15-30% |
| PIPELINE | Active, being worked, too early to call. | 5-15% |

Three-number roll-up, always present all three:
```
Conservative = Commit × 0.90
Expected     = Commit × 0.90 + Best Case × 0.50
Optimistic   = Commit × 0.90 + Best Case × 0.50 + Upside × 0.20
```
A wide conservative-to-optimistic gap means qualification is weak, not that the math needs work.

**Commit validation checklist (all boxes or it's Best Case):**
- Buyer explicitly confirmed intent to purchase this period
- Economic buyer identified and engaged
- Commercial terms (price, scope, length) agreed
- Signed mutual action plan or documented close plan
- Procurement/legal review initiated
- Close date within the current period

## Methods 2-4 (Triangulation)

**Method 2: Stage-weighted pipeline.** Weight = historical % of deals entering each stage that eventually won (pull 12 months closed won+lost; needs 50-100 closed deals per segment). Weighted pipeline = Σ(deal value × stage weight). Use as a sanity check: Commit €1.2M but weighted €800K = commits include deals that historically don't close from their stage. Limitations: treats all deals in a stage equally, ignores deal age.

**Method 3: Run-rate / trend.** Simple run-rate, MoM-trend-adjusted, or seasonally adjusted from YoY. Use for the renewal/expansion base only; new business is too variable.

**Method 4: Bottoms-up capacity.** Per rep: quota ÷ ADS = deals needed; ÷ win rate = opps needed; ÷ meeting-to-opp rate = meetings needed. Sum over ramped reps (ramp: 25/50/75/100% in months 1-4+). Use for annual/capacity planning; if capacity says €8M and the board wants €12M, that's a capacity gap, not a forecasting problem.

## Weekly Cadence

```
MON: Reps update stages, close dates, amounts; categorize deals. Automated snapshot.
TUE: Frontline managers challenge Commits against the checklist; flag at-risk deals.
WED: Director/VP rolls up; reviews variance vs last week, new Commits, slips.
THU: Executive forecast review; Commit/Best Case/Optimistic vs target; pipeline generation check.
```

**The forecast call (deal inspection, not status read-out):**
1. Start with the number (2 min): "€X Commit, €Y Best Case vs €Z target; gap is €Z−X, here's my focus."
2. Inspect at-risk Commits (bulk of time): what changed, next step + date, EB last contact, what could block close.
3. Best Case → Commit candidates (10-15 min): what must happen, can we accelerate, what support is needed.
4. Pipeline generation check (5 min): next quarter on track? gaps by segment?
5. Actions (2 min): who does what by when.

**Manager red flags:** "They're really interested" (no next step). "Just waiting on procurement" (no timeline or contact). "I think the budget is there" (not confirmed). Same close date 3+ weeks. "The champion is on board" (never met the EB).

## Accuracy Measurement

```
Forecast Accuracy = 1 − |Actual − Forecast| ÷ Actual
Track at company, segment, and rep level. Snapshot weekly (period, date, rep, commit, best case, pipeline, actual, accuracy).

Benchmarks: ±5% elite | ±10% strong | ±15-20% average | ±25%+ broken (structural fix needed).
Only ~7% of companies reach 90%+ accuracy (Gartner via ORM).
```

**Diagnosing misses by direction:**
- Consistent over-forecast: Commit criteria loose, optimistic close dates, weak qualification. Fix: tighten Commit validation, deal review rigor.
- Consistent under-forecast: sandbagging, uncaptured expansion, late fast-closing inbound. Fix: incentivize accuracy (not just attainment), capture all revenue sources.
- High variance: low deal volume, lumpy deal sizes, inconsistent stage definitions. Fix: standardize stages, segment the forecast by deal size.
- Accurate early, wrong late: last-week heroics; build coverage earlier.
- Single rep outlier: coaching case; diagnose optimism vs sandbagging vs methodology gap (different fixes).

**Slippage (Ebsta/Pavilion):** 36% of pipeline deals slip (down from 44%). >40% = process problem (exit criteria unenforced); 30-40% normal; <25% strong. Predictors: no critical event = 3x more likely to slip; single-threaded = 2.5x; no activity 14+ days = already dead; close date unchanged 3+ weeks = will slip. Adjustment: Best Case adjusted = Best Case × (1 − historical slip rate), e.g. ×0.64 at 36% slip.

## Pipeline Coverage

```
Coverage = Total Active Pipeline ÷ Revenue Target

The flat 3x rule is outdated. Correct coverage = 1 ÷ historical win rate.
25% win rate → 4x. 15% enterprise → 5-6x. 60% SMB-fit → 1.7-2x.
Reps starting the quarter at 3.2x+ weighted coverage hit quota 89% of the time; below 2.8x → 52% (Clari/Gradient Works/Fullcast).
Practical baseline: 3x minimum, 3.5x healthy, 4x+ strong. Segment by ACV and win rate.

By category: Commit 0.9-1.1x target | Commit + Best Case 1.5-2x | total 3-4x.
By time remaining: start of quarter 3-4x | end of M1 2.5-3x | end of M2 1.5-2x (below 1.5x → contingency) | final 2 weeks: Commit covers 90%+ of target.
```

Coverage insufficient → contingency ladder: 1) accelerate Best Case deals to Commit, 2) pull forward next-quarter pipeline that's ahead of schedule, 3) outbound blitz + marketing + partner activation, 4) adjust expectations with leadership early; never hide the gap.

## Breach Rules (Signal → Trigger → Action)

| Signal | Trigger | Action | Owner |
|---|---|---|---|
| Coverage < 3x for current quarter | Any week | Activate generation contingency within 5 business days; pull forward pipeline | CRO + CMO |
| Commit < 0.9x remaining target | Any week | Inspect every Best Case for acceleration | VP Sales |
| Accuracy trending > ±20% | 2 consecutive weeks | Diagnose: qualification drift, stage definitions, or sandbagging; open A3 | RevOps |
| Best Case slippage > 40% | Any 4-week window | Tighten Best Case criteria (require ≥3 of the Commit checkboxes) | VP Sales + RevOps |
| Single rep variance > ±30% | 2+ quarters | Coaching intervention (optimism vs sandbagging vs methodology) | Manager |
| New pipeline creation < 80% of pace | Weekly pace | Diagnose generation vs conversion problem | CMO + VP Sales |
| Weighted pipeline vs category forecast diverges > 25% | Any week | Stage inflation likely; audit deals contributing to the gap | RevOps |
| Next-quarter pipeline < 2x target at midpoint | Quarter midpoint | Outbound blitz + partner + marketing acceleration within 1 week | CRO |

**Escalation severities:** S1 information (coverage 2.5-3x with >6 weeks left; single-week spike) → note and monitor. S2 warning (coverage <3x with <6 weeks; accuracy >±15% for 2+ weeks) → assign investigation owner this week. S3 breach (coverage <2.5x with <4 weeks; Commit <0.8x; accuracy >±25% for 3+ weeks) → CRO/CEO escalation, contingency playbook, proactive board communication. S4 critical (coverage <2x with <3 weeks; >20% miss projected) → board-level communication; protect Commit, manage the miss, build next quarter.

**Forecast dashboard tile:** Green = Commit ≥ 90% of target AND coverage ≥ 3x. Amber = Commit 70-90% OR coverage 2.5-3x. Red = Commit < 70% OR coverage < 2.5x. Secondary: trailing 4-week accuracy (green ±10%, amber ±10-20%, red ±20%+). Leading: next-quarter creation pace vs 3x coverage. Goal: every miss visible 6+ weeks in advance.

## Forecasting by Revenue Type

- **New business:** most variable. Category + stage-weighted methods; coverage 3.5-4x; segment by deal size; quarterly trend periods.
- **Expansion:** more predictable. Account health + usage as leading indicators; coverage 2.5-3x; track trigger events (contract anniversaries, usage thresholds, team growth).
- **Renewal:** most predictable. Run-rate baseline at 90-95% gross retention; forecast only the at-risk exceptions; early warning = health score below threshold 90+ days before renewal.

## Probabilistic Forecasting (Advanced)

Replace the single number with scenarios: conservative (25th percentile), most likely (50th), upside (75th). Models combine historical conversion, stage, deal age, rep performance, velocity. Ensemble (model + rep forecast) outperforms either alone. Progression: nail point accuracy first (85%+ consistently), then layer scenarios. Unlocks: "if we lose the two biggest deals, what happens?" and "what's the 90%-confidence revenue floor?"

AI forecasting notes: use model output as a third lens, never a replacement for deal inspection; disagreement between model and manual forecast is a diagnostic; garbage CRM data = garbage model. Teams with AI-assisted forecasting report variance dropping from 30-40% to under 10% (Forrester), but the prerequisite is clean data and enforced stage definitions. Standard hybrid planning model: annual top-down budget + rolling 12-18-month driver-based forecast updated monthly.
