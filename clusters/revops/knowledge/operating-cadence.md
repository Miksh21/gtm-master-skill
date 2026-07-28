> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Revenue Operating Cadence

The difference between scaling and stalling is operating rhythm, not forecasting accuracy. The cadence is the calendar that turns strategy into decisions into deals. The #1 differentiator between top and average performers using AI is not tooling, it is operating discipline; the one play to run if you can only run one: "incredibly disciplined weekly deal reviews" (Donovan, Insight Partners). Fix the cadence before buying any AI.

## The Data Pyramid

```
BOARD (quarterly, narrative + KPIs)
  ↑ LEADERSHIP (monthly/QBR, trends + decisions)
    ↑ TEAM (weekly, pipeline + forecast)
      ↑ ACTIVITY (daily, calls/deals/logs)
```
If activity data is garbage → pipeline data lies → forecasts fail → board gets surprised. Audit the CRM base monthly: who logs? are stage changes real? The loop must also flow DOWN: board decisions → strategy adjustments → manager coaching priorities → rep behavior change. Coaching happens DURING reviews, not separately; the cadence IS the coaching system.

## The 7-Question Gate for Every Meeting

| Element | Bad answer | Good answer |
|---|---|---|
| Purpose | "Check on things" | "Lock forecast by Friday noon" |
| Frequency | "Weekly because we always have" | "Weekly for accountability, monthly for trends" |
| Participants | "The whole team" | "Sales managers + CRO only; RevOps async" |
| Inputs | People wing it | Pre-built forecast model + deal aging report, 24 h before |
| Agenda | Meandering | 15 min data, 30 min decisions, 5 min actions |
| Outputs | "We'll figure it out" | Logged forecast, deal actions with owners |
| Accountability | Nobody | Action log: owner + due date, reviewed next meeting |

Rule: a meeting that produces no decisions or logged actions should be an email. The 5P version of the same gate (Purpose, Product, People, Process, Proof) adds: the Product is a tangible artifact (3 logged decisions, an A3 draft, a changed scorecard tile), and a healthy cadence CANCELS 5-15% of scheduled meetings for failing the gate; a 0% cancel rate means the gate isn't enforced, >20% means the calendar is overloaded.

## Core Ceremonies

**Daily: pipeline pulse (15 min, team).** Surface blockers, coordinate same-day wins. RevOps not in the room; pre-built CRM views make it self-serve.

**Weekly: pipeline review (45 min, manager + team).** Pre-packet from RevOps: stage movement last 7 days, deal aging (red flag >14 days without movement), forecast accuracy vs prior week, win/loss summary. Agenda: 5 min context → 30 min deals >7 days old + red flags → 5 min commit vs best case → 5 min logged actions. Questions: which deals moved and why, what's stalled and what's the blocker, gap to plan, who's at risk of slipping.

**Weekly: forecast roll-up (30 min, CRO + managers + RevOps).** Pre-work: consolidated forecast, variance to plan, confidence by stage, top 10 at-risk deals. 10 min forecast vs target (RevOps) → 15 min gap-closing actions (CRO + managers) → 5 min decisions logged. Output: locked company forecast + action log.

**Bi-weekly: funnel review (60 min, Marketing + Sales + CS + RevOps).** Pre-work: stage conversion vs baseline, lead-to-opp velocity, MQL quality, bottleneck analysis, win rate by segment. 15 min MQL quality + lead flow → 10 min lead-to-opp → 15 min velocity + close rates → 10 min retention + expansion → 10 min cross-functional actions.

**Monthly: business review (90 min, leadership + RevOps + Finance).** Deck of 8-10 slides max, 1 chart per slide: revenue vs plan, pipeline health, efficiency (CAC/payback/LTV:CAC), retention (NRR/GRR/churn), GTM performance, risks, asks. Output: documented priorities, resource decisions, escalations.

**Quarterly: QBR (half-day).** Morning: revenue health, GTM performance, pipeline confidence, customer/retention, working vs broken, steers + reallocation (30 min each). Afternoon: board deck dry-run, narratives, asks. Questions: on track for annual? double down where? kill what? missing capabilities?

**Quarterly: board meeting (2-3 h).** Deck: 1 exec summary + asks ("if you read nothing else"), 2-3 revenue vs plan (ARR waterfall, variance story), 4-5 pipeline + forecast (coverage, velocity, win rate by segment, confidence), 6 efficiency (CAC, payback, LTV:CAC, burn multiple, Rule of 40, trends), 7 retention (NRR/GRR, cohort churn, top reasons + actions), 8 GTM update (working/broken/competitive), 9 strategic initiatives (status, risks, needs), 10 asks + decisions. Golden rules: lead with narrative, trends not snapshots, risks and asks up front, max 3 metrics per slide, every number connects to strategy. RevOps builds the data foundation; CEO/CRO owns the narrative.

**The 10-minute board defence** (alternative to the 40-slide deck): 1) Are we on track? one number, one trend line, no spin. 2) Why? win rate by segment and motion, top 3 loss reasons. 3) What changed? actions taken with measured impact, not plans. 4) What do we need? asks with projected ROI tied to specific conversion gaps. 5) What's the risk? top 3, specific. 30 minutes to prepare, trust compounds.

## Signal-Based Decision Rules

The cadence becomes a control system when signals route to rituals. Install after the calendar is stable: choose 8-12 signals, set thresholds from ~6 months of history, route each trigger to a named ritual. Examples: coverage <2.5x for 3 weeks → marketing demand loop; win rate drops >5pp → open A3 in pipeline review; decision latency >14 days → strategy review; forecast breach rules from knowledge/forecasting.md → weekly dashboard ritual. No new meetings; clearer escalation.

## Cadence Health KPIs (review monthly, tune only quarterly)

1. Decision latency: signal → logged decision → live countermeasure. Target <7 days.
2. 5P cancel rate: 5-15% healthy.
3. SLA hit rate on key handovers (lead → first touch, MQL → SQL): >80% of weeks.
4. Data freshness attainment: >95% of weekly checks pass.
5. Forecast accuracy: actuals within bands >70% of periods.
6. Experiment kill rate: 20%+ per quarter killed by stop-rule; <10% means stop-rules aren't real.
7. Coaching uptake: >80% of agreed coaching actions completed on time.

## Operating Rhythm Assessment (run before any cadence redesign or AI investment)

| Dimension | 1 (weak) | 3 (adequate) | 5 (strong) |
|---|---|---|---|
| Deal review frequency | Ad-hoc or monthly | Weekly, inconsistent | Weekly, never missed, structured |
| Pre-meeting data | None | Pulled manually | Automated packet 24 h before |
| Decision logging | Nothing recorded | Noted, not tracked | Logged, owned, reviewed next meeting |
| Forecast accuracy | ±25%+ | ±15-20% | ±5-10% |
| Cross-functional sync | Teams don't talk | Monthly alignment | Bi-weekly funnel review, shared metrics |
| Coaching integration | Separate from reviews | Some in reviews | Pipeline review IS the coaching system |

Score 24-30 = ready for AI investment. 15-23 = fix cadence first. <15 = cadence rebuild before anything else.

## Anti-Patterns

| Anti-pattern | Fix |
|---|---|
| Meetings without pre-read | Slides delivered 24 h before; questions answered on slide 2 get sent back |
| Reviews without actions | Log owner + due date + success metric; review at next meeting start |
| Forecast as negotiation | Commit/best case/at-risk are data, not emotion |
| Dashboard theater (40 metrics, 5 matter) | Max 3-5 metrics per meeting, each connected to a decision |
| Cadence without accountability | Name the owner, publish the date, escalate if not done |
| Activity data not validated | Monthly CRM audit |

## Async-First Variant (distributed teams)

Daily standup → chat thread (wins, blockers, one forecast line; no meeting). Weekly pipeline review → RevOps posts the packet Monday 9am, team comments on risky deals inline, optional 30-min Friday sync for decisions only. Weekly forecast → compressed 15-min sync after async comments. Monthly review → 1 h async pre-read + 60-min decisions-only meeting. QBR stays sync with mandatory pre-reads. Decision logging via a chat workflow: decision | owner | due date | success metric | status; pin last week's log at the top of each review thread and start by checking completions. Convert to sync when >20% of the team hasn't contributed by deadline; deal escalations always get a 24 h sync slot, never parked overnight.

## Installing a Cadence (90-day program)

Weeks 1-2 assess: map existing meetings, run the 7-question/5P audit, find decision gaps and data readiness, interview CRO/CEO/CMO/VP Sales/CS ("what decisions are you struggling to make? which meetings feel like waste?"). Weeks 3-6 launch: run the weekly rituals, enforce the gate strictly, log decisions, build the pre-work packets. Weeks 7-10 hand off: the operating owner (CRO or RevOps lead) runs everything; install signal-based decision rules (weeks 8-10). Weeks 11-12 certify: team runs without support, health KPIs live, cadence changes allowed only at the quarterly reset. Design rules throughout: no meeting longer than 75-90 min, all rituals feed one shared dashboard, reduce before adding (cancel one meeting for each added), decision sessions early in the week.

The predictability prerequisite (Datarails pattern: forecast within 5% in 3 of 4 quarters): directors/VPs own predictable models with conversion rates + capacity constraints + cost per output; growth owns top-of-funnel math; RevOps owns instrumentation; sales knows exactly how many meetings they're getting and what they must convert. If the cadence doesn't reliably generate those numbers, the cadence is broken, not the forecast methodology.
