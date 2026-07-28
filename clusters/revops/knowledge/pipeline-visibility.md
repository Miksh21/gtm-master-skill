> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Pipeline Visibility and Reporting

Visibility = seeing what's in the pipeline, trusting it, and acting before it's too late. Dashboards show numbers; visibility drives decisions. Most teams build the first two layers of the stack and wonder why the forecast is wrong.

## The Visibility Stack (4 Layers)

1. **Structure**: stages, meanings, required data per stage.
2. **Reporting**: dashboards showing pipeline state (where most teams stop).
3. **Hygiene**: automated systems keeping data clean, current, trustworthy (where accuracy comes from).
4. **Intelligence**: alerts and signals surfacing what needs attention NOW (where decisions come from).

## Layer 1: Stage Design

Principles: each stage has a verifiable exit criterion (not "rep feels good"); stages represent buyer actions, not seller activities; 5-8 stages max; probability increases monotonically (if not, stages are wrong).

Common B2B SaaS defaults (replace with your own history within 90 days):

| Stage | Probability | Meaning |
|---|---|---|
| Discovery | 10% | Initial meeting done; pain confirmed |
| Qualification | 20% | Budget, timeline, decision process, champion identified |
| Solution Design | 40% | Requirements documented; demo/POC delivered |
| Proposal | 60% | Proposal delivered; pricing discussed |
| Negotiation | 75% | Verbal yes; contract in legal |
| Closed Won / Lost | 100% / 0% | Signed / documented loss reason |

**Build your historical baseline:** query all deals closed in the past 12 months; per stage, compute deals closed-won from that stage ÷ deals that entered it; replace the defaults; update quarterly. Probability movements signal changes in execution or buyer behavior.

## Layer 2: Dashboards (One per Audience)

Design principles: one dashboard per audience; leading indicators first; exceptions over summaries; minimal click depth; consistent time frames.

**Executive** (CRO/VP/CEO, weekly, "will we hit the number?"): pipeline by forecast category (stacked bar), coverage ratio with RAG (green ≥3.5x, amber 2.5-3.4x, red <2.5x; calibrate to 1 ÷ win rate), win rate trend (rolling 3 months), ADS trend, forecast vs actual (current + prior 2 periods), top 10 deals (value, stage, next step, days in stage).

**Sales manager** (daily, "which deals need me today?"): team pipeline by rep × stage (heatmap), deals advancing vs stalling this week, activities per rep, stale deals table with days-stale, speed-to-lead SLA compliance, forecast accuracy by rep, pipeline created vs target.

**Rep** (daily, "what do I work on now?"): my pipeline by stage, deals closing this month/quarter sorted by close date, activities vs target, overdue tasks, quota attainment gauge.

**RevOps** (weekly, "is the system healthy?"): data quality score + trend, stage conversion funnel, velocity (avg days per stage), loss reason distribution, pipeline created vs target, enrichment coverage (% records with key fields).

## Layer 3: Hygiene Automation

Pipeline rots silently. A "€5M pipeline" may be worth €2M.

**Stale deal detection** (no logged activity past threshold; calibrate to your cycle: tighten for 30-day cycles, extend for 120+):

| Stage | Stale after | Action |
|---|---|---|
| Discovery | 7 days | Alert rep |
| Qualification | 10 days | Alert rep + manager |
| Solution Design | 14 days | Alert rep + manager |
| Proposal | 7 days | Alert manager (high urgency) |
| Negotiation | 5 days | Alert manager + VP |

Automation: daily job flags deals past threshold → notify owner + manager → create task → still stale at 2x threshold → escalate to VP + RevOps.

**Overdue close dates** are the single biggest source of forecast error. Daily job: open deals with close date < today → auto-push to end of current month → task "close date was overdue; confirm new timeline" → flag for next pipeline review → increment a Close_Date_Push_Count field. Dashboard metric: % of pipeline with overdue close dates, target <5%.

**Pipeline quality score** (composite per deal, informed by Gong 300+ signal model and Ebsta Deal Score research):

| Dimension | Evidence |
|---|---|
| Engagement / activity velocity | Frequency + recency of buyer interactions |
| Multi-threading | Single-threaded deals win ~8%; 3+ contacts = 2.4x higher close rates (Ebsta) |
| Decision-maker access | Early EB involvement boosts win rate 55% (Ebsta) |
| Time in stage / deal age | Deals closed within 50 days win 47%; beyond 50 days ≤20% |
| Next step clarity | Specific agreed next action with date |
| Trend direction | Engagement trajectory positive vs negative |

Track the trend, not just the score. Deals declining on 2+ dimensions simultaneously = immediate deal review. (Weighted scoring recipe: knowledge/deal-desk-and-velocity.md.)

**Big deal alerts**: trigger on value above threshold (configure to your ACV tiers), advance past Qualification, value +25%, or close date moving into current quarter. Content: name, value, stage, owner, next step, days in stage, close date. Recipients: VP Sales, CRO, RevOps. Channel: chat + email.

## Layer 4: Intelligence Signals

| Signal | Indicates | Action |
|---|---|---|
| No activity >7 days at Proposal+ | Deal at risk | Manager intervention; check with champion |
| Close date pushed 3+ times | Timeline not real | Honest conversation about buyer readiness |
| Single-threaded | Fragile deal | Multi-threading campaign |
| Amount decreased | Scope shrink or competitive pressure | Win strategy review |
| New competitor in notes | Competitive threat | Positioning resources |
| Stage regression | Qualification lost | Re-qualify or close |
| Champion went dark | Org change or lost interest | Executive sponsor outreach |
| Buyer activity spike | Evaluation intensifying | Accelerate; provide resources |

## The Weekly Pipeline Waterfall

The single most powerful visibility tool. Review weekly:

```
Starting pipeline  €4.2M
 + Created         +€800K
 + Advanced        €1.1M moved forward
 − Pushed          −€300K to next quarter
 − Lost            −€450K
 − Won             −€600K
 = Ending pipeline €4.45M
```

Movement types to watch: Created (pace vs target), Advanced (velocity), Stalled (hygiene), Pushed (forecast risk), Pulled In (verify it's real), Lost (loss reason analysis), Won (capture learnings).

## Forecast Snapshot Tracking

Capture weekly (or per forecast call): period, snapshot date, rep, Commit value, Best Case value, Pipeline value, actual closed (after period end), accuracy formula. Enables "how does accuracy change as the period end approaches" and the miss-pattern diagnosis in knowledge/forecasting.md.

## Essential Reports Checklist

| Report | Grouping / logic | Purpose |
|---|---|---|
| Pipeline by stage | Summary by stage, open, current FY | Pipeline health |
| Pipeline by close date | By month, next 2 quarters | Timing distribution |
| Win rate | Won ÷ (Won + Lost), closed this quarter | Conversion |
| Sales cycle | Avg days creation → close, closed won | Velocity |
| Conversion funnel | Count by stage, created-in-cohort | Drop-off analysis |
| Stale deals | Open, no activity > threshold | Hygiene |
| Loss analysis | By reason, last 90 days | Pattern detection |
| Pipeline coverage | Open ÷ remaining target | Forecast risk |
| Rep scorecard | Rep × metrics matrix, current quarter | Individual performance |
| Pipeline created | By week | Leading indicator |

## Operating Notes

- Refresh cadence: near-real-time for Proposal/Negotiation stages, daily for earlier stages, weekly batch for historical analysis.
- Async pattern for distributed teams: automated deal summaries posted to dedicated channels (#deals-at-risk, #close-forecast) with drill-down links; comments async; the weekly sync handles only escalations and coaching.
- Warehouse-native pattern: canonical pipeline truth in the warehouse, computed scores synced back to CRM via reverse ETL; reduces "1 in 4 GTM leaders distrust real-time CRM data". Routing and scoring misfire on 10%+ of records when any critical field falls below 90% population; audit field completion first.
- Human-in-the-loop beats set-and-forget for AI deal scoring; deploy one agent per scoring use case with human review, never autonomous deal closure.
- Managed pipeline health pays: teams actively managing these metrics see 18% higher win rates and 28% more accurate forecasts (Salesforce research).
