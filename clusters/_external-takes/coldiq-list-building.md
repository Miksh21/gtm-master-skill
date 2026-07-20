# External takes — list-building (ColdIQ radar, UNREVIEWED)

## The List Architect (master) — sachacoldiq/ColdIQ-s-GTM-Skills/master-skills/list-building  ·  filed 2026-07-13
Source: https://github.com/sachacoldiq/ColdIQ-s-GTM-Skills · cluster: list-building
gtm-master list-building derives from this ColdIQ skill. Diffed for drift — thresholds match exactly, no contradictions.
- ✅ supports [list-building/knowledge/data-validation.md + sales-navigator-guide.md + validate-and-cleanup.md]: email decay 22-30%/yr → re-verify lists >30 days; Sales Nav 2,500-result cap → bypass by segmenting; 100-pt ICP score Tier A 90-100 / B 70-89 / C 50-69 / D <50; ABM Tier-1 10-50 accounts (1:1). All identical to gtm-master — confirms no drift.
- 🆕 new-angle: one-line pipeline design principle — "cheap AI for scraping, smart AI for interpretation, conditional formulas everywhere" — over a 7-step beginner flow (import → enrich → merge → validate → GPT-4-mini company summary → Claude fit-check → push to sequencer).
Status: holding

## Company Finder — l3mpire/claude-skills/company-finder  ·  filed 2026-07-20
Source: https://github.com/l3mpire/claude-skills · cluster: list-building
- 🆕 new-angle: explicit signal decay windows attached to each trigger, defining how long a signal stays actionable — funding raised 30-90 days, new hire in key role 30-60 days, M&A 1-3 months post-announcement. gtm-master's signals cluster scores and stacks signals but does not attach a per-signal freshness window at list-build time.
- 🆕 new-angle: throughput guidance of 20-50 accounts per WEEK for a signal-based motion (quality over volume). Note the unit mismatch before promoting: gtm-master's build-prospect-list pass criterion is Tier 1 ≥ 50 CONTACTS per list, so the two numbers are not directly comparable and should not be read as a conflict.
- 🆕 new-angle: firmographic heuristic — 50-200 employees as the Series A/B SaaS sweet spot, on the reasoning that funding stage predicts both budget existence and decision velocity (Series A = first real budget under GTM pressure).
- ✅ supports [list-building/tasks/build-prospect-list.md Phase 3 tiering]: the two-layer model — firmographics define the universe of possible accounts, signals identify which are ready to buy — is gtm-master's Tier 1 (fit + signal) / Tier 2 (fit, no signal) split stated as a targeting principle.
- ✅ supports [campaign-ops/tasks/tier-campaigns.md]: never mix industries in one campaign (pain context differs); run a SEPARATE campaign per signal with its own messaging angle rather than one blended list.
- ✅ supports [signals cluster]: competitor engagement and tech-stack change treated as active category-evaluation signals; geography filtering framed as a compliance/localisation decision (GDPR, language), not just a market cut.
Status: holding
