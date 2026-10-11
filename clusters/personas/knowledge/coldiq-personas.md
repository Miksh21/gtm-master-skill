# ColdIQ takes: personas

Source: ColdIQ radar (third-party GTM skills listed on coldiq.com/skills). Promoted from `_external-takes/coldiq-personas.md` at /creator-radar-review 2026-10-11.

## Unvalidated — external, not yet run by Jan
> Filed by the ColdIQ radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Choosing and ranking personas
- Deal size sets target seniority: <$5K/yr -> IC/Manager; $5-50K -> Director; $50-250K -> VP; $250K+ -> C-suite / buying committee. [l3mpire/persona-definer]
- Score candidate personas on pain intensity, decision power, reachability, timing/trigger (0-5 each, max 20); fully develop only the top 2. [l3mpire/persona-definer]
- Apply the buildability test per persona: 500-5,000 reachable contacts; fewer = over-narrow, millions = too broad. [l3mpire/persona-definer]

### Pain ranking
- Weighted pain score: Severity 30% / Evidence strength 25% / Solution fit 25% / Urgency 20%, each 1-5; only pains scoring >3.5 may lead outreach. [l3mpire/pain-identifier]
- Every pain carries a confidence tier: High = direct evidence; Medium = inferred from stage/industry pattern (prior: Seed = no processes, Series A = first sales team and process chaos, Series B = data silos and tooling gaps, Series C+ = security/compliance and enterprise motion, 500+ = tech debt and change management); Low = guess, framed as a discovery hypothesis, never asserted in copy. [l3mpire/pain-identifier]
- Read tech-stack gaps as pain signals, not only adoptions: CRM without a sequencer -> manual outreach pain; no enrichment tool -> manual research pain. [l3mpire/pain-identifier]

### Per-account profile (between scoring and copy)
- Instantiate the persona per account: one row per company with profile summary, talking points, pain points, recommended approach. The archetype answers who we sell to; this answers what to say to this account, a step the chain currently skips. [janskuba/prospect-profiler]
- Carry a data_quality field (HIGH/MEDIUM/LOW) on every profile so downstream copy knows how far to trust it. [janskuba/prospect-profiler]
- Compress recommended approach to a machine-readable routing string `channel | message_type | timing` (email/linkedin/phone/multi · direct/educational/social-proof/challenge · immediate/this week/next month/event-triggered) for the sequence router, which today routes on tier alone. [janskuba/prospect-profiler]
- Research depth scales with tier: Tier 1-2 get full analysis, Tier 3-4 short but complete profiles. [janskuba/prospect-profiler]
