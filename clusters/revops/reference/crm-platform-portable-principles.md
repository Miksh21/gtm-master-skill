> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# CRM Platform Principles (Portable)

Distilled from HubSpot- and Salesforce-specific implementation skills. Platform click-paths dropped; these principles port to any CRM (including Pipedrive). Platform-specific notes kept only where they change a migration or integration decision.

## Portable Architecture Principles

1. **Design for reporting first.** Before creating any field, name the decision it feeds and the report it appears in. Can't name it = don't create it.
2. **Lifecycle stage is the spine.** Every contact has a stage reflecting position in the revenue journey. Distribution should look like a funnel; if 40% of contacts sit in "Lead" and 2% in "MQL", something is broken. More than 5% in "Other" = stage definitions need work.
3. **Separate three tracking mechanisms**; don't overload one with the others' jobs:
   - Lifecycle stage = where the CONTACT is in the journey (marketing's view)
   - Deal stage = where the OPPORTUNITY is in the sales process (sales' view)
   - Lead status = follow-up state for sales development (SDR's view)
4. **Automate enforcement, not judgment.** Automate formatting, required fields, objective stage transitions (score crosses threshold → MQL; deal created → Opportunity; deal won → Customer). Keep MQL → SQL manual: a human accepting the lead is the most important quality gate in the funnel.
5. **Optimize for the rep, not the admin.** Every field is friction. 15 required fields to advance a deal = skipped fields or CRM avoidance. Minimal rep-facing surface; complexity in background automations.
6. **One pipeline per sales motion.** New business and expansion have different stages, cycle times, conversion rates, owners. Mixing them produces reports that describe neither. Same for SMB vs enterprise motions.
7. **Stamp every transition.** Workflow writes a date property on each lifecycle/stage change. This enables velocity reporting (days Lead→MQL→SQL), one of the highest-value diagnostics.
8. **Override default stage probabilities with your own history.** Pull 12 months of won/lost, compute actual win rate per stage, set those; review quarterly.
9. **Minimum viable required fields on every deal**: close date, amount, owner. Plus a DROPDOWN closed-lost reason (Lost to Competitor / No Decision / Budget / Timing / Disqualified), never free text.

## Universal Workaround Patterns (needed on most platforms)

- **Time-in-stage tracking**: most CRMs can't natively trigger on "time in current stage". Pattern: date property `last_stage_change_date` set by workflow on every stage change; second workflow fires when it exceeds N days on an open deal → task + alert.
- **Required-fields-at-creation gap**: required fields on the FIRST stage often don't apply during record creation. Pattern: workflow checks critical fields within 24 h of creation and tasks the owner.
- **Speed-to-lead measurement**: create `routed_at` and `first_touched_at` timestamps plus a computed SLA field; almost no CRM ships this natively.
- **Stale-deal detection**: daily scheduled query for open deals with no activity past the threshold → flag, notify, escalate at 2x threshold (thresholds per stage in clusters/revops/knowledge/pipeline-visibility.md).

## HubSpot vs Salesforce: Decision-Relevant Differences

| Aspect | Salesforce | HubSpot |
|---|---|---|
| Data model | Account-centric (Account → Contact → Opportunity) | Person-centric (contact-first, company association) |
| Leads | Separate Lead object; conversion creates Account + Contact + Opportunity | No Lead object; contacts + lifecycle stages |
| Custom objects | Full relational (lookups, master-detail, junctions, roll-ups) | Simpler, fewer relational capabilities |
| Automation | Flow (record-triggered, scheduled, platform events); Workflow Rules and Process Builder are deprecated: anything still on them is migration debt | Workflows, simpler branching |
| Forecasting | Collaborative multi-level rollup, manager overrides, splits | Basic (top tier only) |
| Territory management | Enterprise Territory Management hierarchies | Basic assignment rules |
| Opportunity splits | Native | Workaround via custom objects |

Choose Salesforce for: complex team selling, splits, deep account hierarchies, heavy customization, advanced territories. Choose HubSpot for: marketing + CRM in one, simpler motions, speed-to-value, budget. (Pipedrive sits nearer HubSpot's shape: person/deal-centric, simple automations, one pipeline per motion still applies; note Pipedrive has no conditional/dependent fields, so stage-gating relies on required-fields-per-stage plus workflow checks.)

Salesforce-portable conventions worth stealing on any platform: max ~3 automation flows per object (before-save, after-save, scheduled) to avoid trigger spaghetti; automation naming `[Object]_[Trigger]_[Purpose]_v[N]`; feature flags in config (enable/disable logic without redeploying); multi-pipeline via record types = keep motions separate even inside one object.

The lead-object question is the most consequential migration mapping: moving between a lead-object platform and a lifecycle-stage platform requires an explicit decision of which model the merged org uses, then mapping both old models into it (see clusters/revops/tasks/plan-crm-migration.md).

## Healthy Funnel Reference (practice-based)

Subscriber→Lead ~40%, Lead→MQL ~30%, MQL→SQL ~20%, SQL→Opportunity ~25-30%. Consistently lower = definitions or qualification broken; higher = upstream too lenient.
