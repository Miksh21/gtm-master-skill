# External takes — personas (ColdIQ radar, UNREVIEWED)

## Persona Definer — l3mpire/claude-skills/persona-definer  ·  filed 2026-07-13
Source: https://github.com/l3mpire/claude-skills · cluster: personas
- 🆕 new-angle: price → target-seniority heuristic — <$5K/yr → IC/Manager; $5-50K → Director; $50-250K → VP; $250K+ → C-suite/buying committee. Sets WHO to target from deal size. Not in gtm-master personas.
- 🆕 new-angle: persona scoring matrix (0-5 each, max 20) — pain intensity, decision power, reachability, timing/trigger. Score-and-rank, then fully develop the top 2 only.
- 🆕 new-angle: apply the ICP "narrowness test" at PERSONA level — a good persona yields 500-5,000 buildable contacts (too few = over-narrow, millions = too broad).
- ✅ supports [personas/knowledge/buying-committee-5-roles.md]: classify each persona as economic buyer / champion / influencer / blocker; use exact titles not departments; map PERSONAL pain ("what gets them in trouble with their boss") + individual KPIs, not company-wide issues.
Review: additive
Status: holding

## Pain Identifier — l3mpire/claude-skills/pain-identifier  ·  filed 2026-08-10
Source: https://github.com/l3mpire/claude-skills · cluster: personas
- 🆕 new-angle: weighted pain scoring model — Severity 30% / Evidence strength 25% / Solution fit 25% / Urgency 20%, each 1–5, and only pains scoring >3.5 may be led with in outreach. gtm-master has no pain-scoring or pain-ranking model anywhere (grep across all 15 clusters returns nothing); `personas/tasks/build-persona.md` captures a single "biggest pain" with no ranking or evidence weighting.
- 🆕 new-angle: stage→pain lookup as a prior before any research — Pre-Seed/Seed (1–25) everything manual, no processes; Series A (25–75) scaling GTM, first sales team, process chaos; Series B (75–200) efficiency gaps, data silos, tooling; Series C+ (200–500) complex ops, security/compliance, enterprise motion; Mature (500+) technical debt, integrations, change management. Framed as "pain points are predictable, not random."
- 🆕 new-angle: mandatory confidence tiering on the output — High (direct evidence) / Medium (stage-or-industry pattern inference) / Low (educated guess, must be flagged as a hypothesis to test in discovery). Pairs with the quality bar "every pain linked to a specific observable signal" and "flagged what's certain vs inferred".
- 🆕 new-angle: absence-of-tool as a pain signal, not just presence — "has Salesforce but no SEP → manual outreach pain", "no data enrichment tool → manual research". gtm-master's `signals/knowledge/buying-signals.md` tech-stack signal reads adoptions and changes, not gaps.
- ✅ supports [`personas/tasks/build-persona.md` "what makes them look bad" — flagged there as the most important field]: pain-identifier splits every pain into **Business impact** (cost/lost revenue, quantified) and **Personal impact for [role]** (job/bonus/career), operationalising the same fear-over-hope premise at account level rather than role level.
Review: additive
Status: holding

## Persona Insights Analysis — l3mpire/claude-skills/persona-insights-analysis  ·  filed 2026-08-10
Source: https://github.com/l3mpire/claude-skills · cluster: personas
- ⚠️ contradicts [`personas/tasks/build-persona.md` Process step 1–3 + Pass criteria]: the evidence base for a persona differs, and gtm-master has no evidence-sufficiency gate. Both sides — gtm-master: build the persona from 5–10 LinkedIn profiles, their posts, and job descriptions, and ship it once the 6 role-profile fields are specific (no confidence statement required, no minimum evidence declared); persona-insights-analysis: build it from recorded sales-call transcripts, and make confidence a declared function of n (1–2 = Low, "directional only", must carry an explicit disclaimer; 3–5 Medium; 6–9 High; 10+ Very High), stated at the top of every report alongside data gaps. The substantive claim is that public profile language is self-branding while call verbatims are what the buyer actually said while buying — gtm-master currently has no transcript path into `personas` at all.
- 🆕 new-angle: pain taxonomy tagging — every pain tagged **Functional** (process/tool) / **Emotional** (feeling) / **Social** (perception by others), captured with the most visceral verbatim rather than a summary.
- 🆕 new-angle: verbatim handling rules — quote exactly, never paraphrase or clean up grammar; attribute as `"[quote]" — [title], [company size]`; minimum 5 verbatims per persona for goals/pains, 3 for objections, 3 for feature requests; maximum 8 per section (curate, don't dump); mark `[low confidence]` when transcript quality was poor or summarised.
- 🆕 new-angle: rate the rep's objection handling Effective / Neutral / Missed per instance, and rank objections by % of calls — turns transcripts into a frequency-ordered objection queue. Direct feed into the `objections` cluster, which today has no frequency-ranking input.
- 🆕 new-angle: "messaging gaps" as an output — topics the prospect raised that the rep never addressed, plus rep-vs-prospect vocabulary mismatches. Also Red Flags & Disqualifiers (vague pain, no trigger, DM absent, no budget) as a named negative-signal set.
- ✅ supports [`personas/tasks/build-persona.md` step 2 "capture the words THEY use" + Pass criterion "power phrases … not invented"]: section 4.8 makes persona vocabulary a first-class extracted dimension ("what they call the problem you solve", never your product's words) and routes it straight into copy.
Review: contradicts
Status: holding
