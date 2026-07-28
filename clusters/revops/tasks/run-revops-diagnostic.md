> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Run a RevOps Diagnostic

Recipe for diagnosing a revenue system before recommending any fix. Output: the single binding constraint, a one-page A3, and a 2-week micro-experiment. Never prescribe (more SDRs, new CRM, more pipeline) before running this.

## When to use this

User describes revenue symptoms: "we keep missing plan", "pipeline is weak", "forecast is always wrong", "reps underperform", "everyone is busy but nothing moves", "should we buy [tool]", or asks for a GTM health check / revenue audit.

## Inputs required

- ARR, growth rate, NRR/GRR, CAC payback (whatever exists)
- Org shape: sales/marketing/CS/RevOps headcount
- ICP definition (if any), tech stack, current meeting cadence
- Top 3-5 pains as leadership describes them
- Optional but high-value: recent board deck or QBR, CRM export of 12 months closed deals

## Process

1. **Crisis check first.** Any of: forecast missed 2+ quarters or variance >±30%; win rate down 5+ points over 3 quarters; coverage <2.8x and falling; NRR <90%; critical deal fields <70% complete; cross-team blame. Any one = switch to the crisis triage protocol (data audit → cash diagnosis → fast root cause → constraint) in `clusters/revops/knowledge/diagnostic-framework.md` before continuing.
2. **Quick triage (5 min).** Walk the decision tree: new business vs NRR → generating vs closing → which motion (pipeline management / inbound / outbound / CS / partner). Then the layer check: fundamentals / adoption / optimization / acceleration. Default: fix pipeline management before adding pipeline.
3. **Map symptoms to system layers** using the misdiagnosis table (Governance / Enablement / Value Loops). Assume the problem sits one layer out from where it appears.
4. **Run IFA.** Score Information (definitions, data spine, shared views), Focus (cadence, decision rights, WIP limits), Action (execution, spread mechanisms). Name the weakest link; if Action is weak check Focus first, if Focus is weak check Information first.
5. **Six Stages of Check** in order: Purpose → Demand → Capability → Flow → System Conditions → Management Thinking. Stop at the highest broken level.
6. **Capacity vs productivity test.** Would doubling pipeline double revenue? Would doubling AEs double revenue? Where do deals stall longest?
7. **Name ONE constraint.** Write the A3-lite: problem (measurable), current state (data), root cause (5 Whys to a systemic cause), countermeasure (specific), owner + timeline, check metric + stop-rule.
8. **Propose a 2-week micro-experiment**: smallest change, fastest signal.

## Output format

```
RevOps Diagnostic: [company]
Date: [date]

CRISIS CHECK: [clear / CRISIS MODE + which threshold fired]
TRIAGE: motion = [pipeline mgmt / inbound / outbound / CS / partner], layer = [fundamentals / adoption / optimization / acceleration]
SYSTEM LAYER: [Governance / Enablement / Value Loop]: [one line why]
IFA WEAKEST LINK: [Information / Focus / Action]: [evidence]
SIX STAGES: broken at [stage]: [evidence]

THE CONSTRAINT (one sentence): [...]

A3-LITE
Problem:        [specific, measurable]
Current state:  [data]
Root cause:     [after 5 Whys]
Countermeasure: [specific change]
Owner/timeline: [name, weeks]
Check:          [metric, when, stop-rule]

MICRO-EXPERIMENT (2 weeks): [what, success metric, kill criterion]
```

## Pass criteria

- Exactly one constraint named (not a list of five problems)
- Root cause is systemic (process/definition/structure), not a person
- Countermeasure is specific enough to implement Monday
- Check has a metric, a date, and a stop-rule
- If data quality <70% on critical fields, the diagnostic says so and stops there

## Common failures

- **Prescribing the symptom's fix** ("weak pipeline → more SDRs") without the layer walk
- **Diagnosing everything** instead of triaging to one motion first
- **Blame diagnosis**: a Why ending at a person means one more Why is missing
- **Skipping the crisis check** and running a leisurely diagnostic during a fire
- **Tool answers to process problems** ("new CRM" while processes are undefined)

## Deeper knowledge

- Full framework, crisis protocol, flywheel + alignment audits → `clusters/revops/knowledge/diagnostic-framework.md`
- Metric formulas + benchmarks for the evidence → `clusters/revops/knowledge/metrics-definitions.md`
- Constraint is velocity/stalling → `clusters/revops/knowledge/deal-desk-and-velocity.md`
- Constraint is forecast → `clusters/revops/knowledge/forecasting.md`
- Constraint is meetings/decisions → `clusters/revops/knowledge/operating-cadence.md`
