> Source: swan-gtm/gtm-skills (ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Meta Ads Operating System (decision framework)

The single decision framework for running B2B Meta accounts. Every pause/scale/graduate/budget decision flows from here. Core principle: Meta optimizes delivery but cannot see lead quality; you add the qualified-lead (QL) layer and decide on QLs, never raw form fills. Core rule: **Meta thinks in weeks, not days.** Never decide on <7 days of data; the most common way to kill a winner is fiddling every 2-4 days.

## 1. Set the Target: TCPL

TCPL = target cost per QUALIFIED lead. Every threshold derives from it. Establish it first.

| Scenario | Formula |
|---|---|
| A: Target cost per demo known (strongest) | TCPL = target cost per demo x QL-to-demo rate (e.g. $2,000 x 0.28 = $560) |
| B: Historical data, no target | TCPL = 30-day trailing CPL(QL) x 0.80; hit it within 30 days (20% is achievable via operational cleanup alone) |
| C: New account | TCPL = target CAC x QL-to-customer rate, or benchmark $300-800; switch to B after 30 days |

Once both exist: TCPL = MIN(trailing x 0.80, demo target x QL-to-demo rate).

## 2. Campaign Structure: 2 Campaigns, Both CBO

| Campaign | Budget | Contents |
|---|---|---|
| Scaling (CBO) | ~80% | Graduated/proven ads only; CBO distributes freely |
| Testing (CBO) | ~20% | New concepts + iterations; protected budget |

Why two: in one CBO, proven ads starve tests. Why CBO for testing: uneven distribution IS data (Stage 1). Why not ABO: equal split wastes budget on creative the algorithm already rejected. Why not Advantage+ yet: needs 50+ conversions/week/ad set. 1 ad set per campaign (2 max), identical audiences in both; the split is budget control, not segmentation.

**Ad count.** Sweet spot 6-10 active ads = winners + 2-3 test slots. Ceiling before starvation:

```
Ceiling = (Daily budget x 14) / (2 x TCPL)
```

$1,000/day at TCPL $500 = 14 ceiling, 6-10 sweet spot. At ceiling: queue tests, one in = one out. You grow into the ceiling; 3 winners + 2 tests = fine.

## 3. The Decision Tree

### Stage 1: Delivery check (is Meta spending on it?)

Valid ONLY at or below the ad-count ceiling; above it, low spend = crowded out, fix count first. CBO picks favorites within 48-72h, stable by day 7.

- **Day 7 minimum spend:** min = (daily campaign budget / active ads) x 7 x 0.5 (half of fair share). Below it: KILL. $0 spend after 7+ days: KILL immediately.
- **Spend-share view (testing campaign, day 5-7):** expected share 1/N, underdelivery threshold (1/N)/2. N=4 ads: kill under 12.5% share.
- **Ongoing delivery kill:** ad spent >= TCPL lifetime AND last 7d < $70 total (< $10/day avg). Under TCPL lifetime, low spend is lack of data, not a verdict.
- Delivery kills are hook/visual failures. Swap hook, visual, or format; do NOT iterate copy or CTA, the audience never got that far. Delivery kills also free budget early, which is why real testing throughput runs 1.5-2x the base formula.

### Stage 2: Quality evaluation (every Monday, rolling 14-day data)

1. **Enough data?** Spend < 3x TCPL: WAIT. (Poisson: at true cost = target, 0 QLs after 3x spend has ~5% probability, so 3x = 95% confidence; 2x has a 13% false-negative rate, 5x wastes budget.)
2. **Zero pixel leads:** SWAP, abandon concept entirely.
3. **Quality (the layer Meta cannot see):** zero QLs despite pixel leads: SWAP, keep format, change angle. QL rate < 40%: SWAP, add ICP-qualifying language (at 40% QL rate a $360 pixel CPL is a $900 true CPL; at 65% it is $554). 40-60%: MONITOR one more week. >= 60%: continue.
4. **Cost:** per-QL <= TCPL: potential winner. 1-1.5x TCPL: MONITOR (normal variance is 10-20%). > 1.5x TCPL over 14 days: SWAP, same angle, different hook/format/visual (structural underperformance, not luck).
5. **Graduation (testing -> scaling), ALL required:** >= 5 QLs, QL rate >= 60%, cost per QL <= TCPL, running >= 14 days, >= 1 QL in last 7 days.
6. **Fatigue (scaling ads):** frequency < 3.0 and cost stable: healthy. 3.0-3.5 or cost +20%: WARNING, start producing 2 iterations now (ready in 14 days). > 3.5 or cost +40% or > 1.5x TCPL for 2 weeks: CRITICAL, swap immediately. Frequency > 3.5 is the canonical cold-prospecting fatigue trigger; at 4.0 you are already late.

## 4. Swap Rules (never pause without replacing)

| Reason | Iterate? | Change | Timeline |
|---|---|---|---|
| Delivery failure | No | Different hook/visual/format | Immediate |
| Zero pixel leads | No | Completely different angle/format/message | 48h |
| Zero QLs | Partial | Same format, ICP-filtering pain point | 48h |
| QL rate < 40% | Yes | Add revenue figures, industry terms, ICP language | 48h |
| Cost > 1.5x TCPL | Yes | Same angle, new hook/format/visual/CTA | 48h |
| Fatigue critical | Yes | New hook + format + customer/color | Immediate |

Empty pipeline: redirect budget to proven ads; replacement live within 7 days max.

## 5. Creative Production Formula

```
Tests/month = Testing budget / (3 x TCPL)        Tests/week = /4
```

$30K/month total -> $6K testing -> ~4 tests/month at TCPL $500 (expect ~6-8 in practice from early delivery kills). Win rates: iterations on winners ~25%, new concepts ~10%, blended ~17% (1 in 6). Tests for X winners = X / 0.17.

**Production split 50/30/20** (what you BUILD, not budget): 50% iterations on top performers, 30% iterations on other performers, 20% new concepts. ~10 variations per proven ad over its life. New concepts launch image-first (cheap, fast validation) except video-native concepts (UGC, testimonials, demos).

```
Minimum proven ads = Monthly budget / $5,000
```

Each proven ad absorbs ~$5K/month before fatigue; above $6-8K performance degrades. $30K budget needs 6 proven ads = ~36 tests = ~8 months to build. **You cannot scale budget ahead of creative.**

## 6. Scaling Protocol

Scale when ALL true: proven ad count >= budget/$5K for next level, account frequency < 3.0, cost per QL <= TCPL for 2+ weeks, 3+ ready replacements in the pipeline, quality confirmed in CRM. Then: +20% every 5 days (never > 30% at once, resets learning). Rollback trigger: > 1.5x TCPL post-scale; cut 20-30% immediately, stabilize 2 weeks, resume at 10% every 7 days. When frequency > 3.5 walls you: expand lookalike 1% -> 2-3%, add seed lists, test broad with strong ICP creative, cross-channel UTM retargeting, reactivate remarketing.

## 7. Learning Phase

Meta needs 50 conversion events per ad set per week. Minimum daily budget = (target CPA x 50) / 7 (CPA here = the optimization event cost, usually pixel lead, not TCPL): $20 CPA -> $143/day, $50 -> $357, $100 -> $714. Resets learning: audience change, budget +>30%, creative change inside the ad set, optimization event change, bid strategy change. Does NOT reset: <10% budget tweaks, copy tweaks, pause <24h. Stuck: optimize an upper-funnel event, consolidate ad sets (1 x $500/day beats 5 x $100/day), verify Pixel + CAPI both firing (CAPI recovers 20-30% of conversions).

## 8. Weekly Cadence

- **Monday (decision day):** pull 14d data per ad; run Stage 2 on testing ads past Stage 1; fatigue-check scaling ads; execute swaps/graduations; flag warnings and start replacements; check CRM lead quality; name the top 3 ads and why.
- **Wednesday:** launch new tests; Stage 1 check on ads 7+ days old; learning-phase review; apply 50/30/20.
- **Friday:** scaling criteria check, +20% if met; rollback check; budget pacing; next week's pipeline.
- **Monthly:** creative library audit, pipeline health, TCPL review, frequency trends, CRM deep dive (MQL-to-SQL, cost per opp/closed-won), refresh audience lists, review offers.
- **Quarterly:** structure review, CAPI/Pixel EMQ health, competitive analysis, cross-channel budget reallocation, full creative refresh.

## 9. Problem Decision Trees

**CPA rising (20%+ above target 2+ days), check in order:** 1) Tracking (pixel? CAPI? attribution window 7-day click minimum). 2) Frequency/fatigue (> 3.5 cold? CTR -20%?). 3) Learning phase (changes in last 7 days? <50 conversions? budget +>30%? then wait). 4) Audience (overlap, saturation, Audience Network junk). 5) Landing page (>3s load loses 20% of clicks; message mismatch; bounce spike). 6) External (Q4 CPMs, new auction competitor, seasonality).

**CTR dropping 20%+:** creative fatigue (most common; B2B creative dies in 14-21 days; rotate, add 3-4 concepts) > audience exhaustion (expand or pause) > stale format (test video if all static: 9:16 vertical with audio lifts conversions; test static if all video) > generic messaging (add specificity, urgency, ICP callouts). Fix priority: creative refresh, then formats, then audience, then copy.

**Lead quality bad:** form (work email? Higher Intent? 1-3 questions? confirmation screen?), targeting (too broad? Advantage+ over-expanding? Audience Network on?), creative (mosquito repellent missing? offer too low-friction, move ebook -> calculator/assessment), optimization (send qualified events back via CAPI), placements (Feed beats Stories/Reels for quality). Nuclear option: the offer itself is wrong.

## 10. Kill / Optimize / Scale

- **KILL:** 0 conversions after 5-10x target CPA; frequency > 6.0 declining; relevance Below Average on all 3 diagnostics; ROI < -30% after 7 full days; failed to exit learning after 14 days.
- **OPTIMIZE:** CPA within 20-30% of target but inconsistent; CTR 0.8-1.5%; plateaued post-learning; frequency 2.5-4.0; mixed lead quality. Priority: creative > audience > bid/budget > landing page > offer.
- **SCALE:** all Section 6 criteria met.
- **80/20 rule:** 20% of campaigns yield 80% of results. Kill the rest entirely (pause, not "reduce"), reinvest in winners, test in controlled 20%-of-budget batches.

## Formula Quick Reference

| Formula | Calculation |
|---|---|
| TCPL | Demo cost x QL-to-demo rate (or trailing x 0.8) |
| Ad ceiling | (Daily budget x 14) / (2 x TCPL) |
| Delivery check (day 7) | (Daily budget / active ads / 2) x 7 |
| Delivery share threshold | (1/N)/2 |
| Ongoing delivery kill | >= TCPL lifetime AND 7d avg < $10/day |
| Data minimum | 3 x TCPL spend |
| Swap cost threshold | 1.5 x TCPL |
| Tests/week | (Budget x 0.20) / (3 x TCPL) / 4 |
| Min proven ads | Budget / $5,000 |
| Tests for X winners | X / 0.17 |
| Budget split | 80 scaling / 20 testing |
| Scale rate | +20% per 5 days, max 30% |
| Learning budget | (Target CPA x 50) / 7 |
