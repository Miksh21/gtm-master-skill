> Source: swan-gtm/gtm-skills (ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Measurement and Attribution for Paid Programs

ABM measurement tracks **accounts through a journey**, not leads through a funnel. Demand gen asks "how many leads"; ABM asks "how many target accounts progressed through buying stages". Measuring ABM with lead metrics is doing it wrong.

## The ABM Measurement Funnel

| Stage | Definition | Primary metrics |
|---|---|---|
| Coverage | % of targets you can reach | Match rate, reachable accounts |
| Awareness | Seen the brand | Accounts with 50+ impressions, reach, frequency |
| Engagement | Actively interacting | Accounts with 5+ clicks or 10+ engagements |
| Pipeline | Open opportunities | Influenced pipeline $, accounts in pipeline |
| Revenue | Closed-won | $, win rate, deal size, cycle length |

**Stage-level targets:** match rate > 70% (cannot influence unreachable accounts); persona coverage > 3 personas/account (multi-threading lifts win rate); data completeness > 80%. Account reach > 55% of list at 50+ impressions; average impressions per account 100-200 (below 50 too little, above 300 diminishing); frequency 3-7x; awareness velocity < 14 days to 50 impressions. Engaged accounts > 30% of Aware; account CTR > 0.5%; engagement depth > 10; multi-persona engagement > 40% (committee mobilizing). Pipeline per $ spent > $10; Engaged-to-pipeline velocity < 45 days. ABM win rate > 40%; ABM ROAS > 2x.

**Stage conversion benchmarks:** Identified -> Aware 55% (good 60, excellent 70+); Aware -> Engaged 30% (38 / 45+); Engaged -> Pipeline 20% (22 / 28+); Pipeline -> Closed-won 25%+ (35 / 45+). Net: ~2.5% of targeted accounts reach pipeline, ~0.6% close.

**Time to impact:** first engaged accounts week 2-3; statistically meaningful data week 4-6; first pipeline week 6-10; honest ROI read week 10-12; compounding month 6-12.

## Attribution

| Model | Works for ABM? |
|---|---|
| First-touch only | No (ignores the nurture journey) |
| Last-touch only | No (over-credits sales; Meta/retargeting steal credit) |
| Lead-based MQL attribution | No (ABM is account-level) |
| Account-based multi-touch | Yes |
| W-shaped (30% first touch / 30% lead creation / 30% opp creation / 10% rest) | Yes, cycles > 60 days, multi-stakeholder |
| Hybrid (multiple models in parallel) | Yes |

Account-based multi-touch: track ALL touchpoints at account level, distribute credit across marketing touches before opportunity creation. Weighting when scoring touches: BDR meeting 2x, content download 1.5x, ad click 1x, ad impression 0.5x, email open 0.25x. Hybrid usage: first-touch answers "which channels create awareness", last-touch-before-opp answers "which content converts", linear for optimization, W-shaped for exec reporting. B2B attribution windows: 7-day click minimum (28 if available); Meta touches buyers early and last-click erases it; send closed-won back via CAPI; use self-reported attribution ("how did you hear about us") beside impression-based to catch dark social (the CMO who never clicked but sent the ad to the team).

## ROI Formulas

```
ABM ROI            = (revenue - total cost) / total cost x 100
Pipeline ROI       = pipeline generated / spend          (healthy: $10+ per $1)
Cost per engaged account   = spend / engaged accounts    (LinkedIn ABM norm $150-300 at the 5-click threshold)
Cost per pipeline account  = spend / accounts in pipeline
Pipeline velocity  = (#opps x win rate x avg deal) / sales cycle days
ABM CAC            = total ABM cost / new customers
LTV:CAC            = target > 3:1; ABM programs often 5:1+ (better-fit accounts)
```

## Metric -> Decision Table

| Trend | Meaning | Action |
|---|---|---|
| Match rate < 60% | List/data quality | Clean list, other data sources |
| Awareness < 40% | Budget or targeting too narrow | Raise budget or widen |
| High awareness, low engagement | Message not resonating | New creative/messaging |
| High engagement, low pipeline | Sales handoff broken | Fix BDR process and timing |
| High pipeline, low win rate | Wrong accounts in pipeline | Refine ICP scoring |
| Long cycles | Committee not aligned | Multi-persona campaigns |
| Engagement declining over time | Creative fatigue | Refresh, new angles |

Lead with leading indicators for the first 90 days (engagement velocity, multi-persona engagement, stage progression, BDR response rates); they predict pipeline 6-8 weeks out. Lagging: revenue, win rate, cycle, deal size.

## Measurement Scorecard (self-audit, score 1-3 each)

1. One dashboard for blended (paid + organic) pipeline performance? (1 none / 2 limited / 3 reliable and used)
2. Channel dashboards (spend, pacing, conversions)?
3. Conversion tracking from ad channels? (1 none / 2 pixel / 3 offline conversions)
4. Web analytics implemented and used?
5. Documented, team-agreed attribution process? (1 no / 2 informal / 3 documented, no bias)

Score < 6: below average, consider pausing spend until visibility exists. 6-13: average. 13-15: strong. Fix the lowest scores first.

**Dashboard build (Google Sheets pattern):** one tab per channel with date + total cost (Dataslayer ~$99/mo or Supermetrics auto-refresh); CRM tab with create date + lead source + lead source detail (Salesforce Connector free, or HubSpot workflow push); SUMIFS/COUNTIFS per channel through the full lifecycle (leads, SQOs, pipeline, closed-won); dynamic date range; blended cost per opportunity as the program health number. Lead Source Detail values must match the formula names exactly.

## Reading Performance Like an Operator

1. Lead with the outcome metric, never vanity: CPL and lead volume headline; impressions/reach/CPM are context.
2. Separate leading from lagging: CTR and CPM move first, CPL confirms. Rising CPM with flat CPL is fine; rising CPL is the alarm.
3. Read at the right altitude: account -> campaign -> ad set -> ad; find where money leaks before prescribing.
4. Tie every number to an action: "CPL up 40% WoW, retargeting fatigued (frequency 4.2): rotate creative, cap frequency", never "CPL went up".
5. Never fabricate a benchmark; label reference ranges as such when account history is missing.

## Optimization Signals and Testing Rules

Leading signals (< month) optimize quickly; lagging (> month) are directional truth. By demand stage: Create = CTR/engagement rate leading, blended inbound leads lagging; Capture = CPL/CPMQL leading, pipe-to-spend and cost-per-opp lagging; Accelerate = accounts reached leading, time-to-close and influenced revenue lagging. B2B cycles run 2-24 months; you cannot wait for lagging truth to optimize.

```
Breakeven CPL = average deal size x lead-to-close rate     ($3,000 x 10% = $300)
Breakeven CPC = CPL target x landing page conversion rate  ($300 x 5% = $15)
```

Two repeatable pause rules (not statistically significant, but they prevent emotional decisions):
- **Non-performer rule (always on):** pause an ad at 2-3x target CPL spent with 0 conversions.
- **Maintenance rule (after 7-14 days):** pause an ad running 1.5-2x over target CPL.

Proxy metrics: "% of [users] who do at least [threshold action] by [time]"; must be measurable, moveable, not an average, correlated to the lagging metric, not gameable. Experiment library: backlog + sprint views; hypothesis "If we do [X], I believe [Y], measured by [Z]"; prioritize by RICE (reach, impact, confidence, effort 1-5); document result + spend + learnings per experiment; avoid the activity trap (testing without learning).

## Incrementality (holdout testing)

Split the target list 80% exposed / 20% holdout; compare engagement, opportunity creation, win rate, deal velocity; never evaluate before 21+ days. Automated by Primer, 6sense, Demandbase. Win-rate lift +10-30% and cycle -10-20% are the classic acceleration-campaign reads.
