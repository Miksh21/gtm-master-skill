# External takes — list-building (ColdIQ radar, UNREVIEWED)

## The List Architect (master) — sachacoldiq/ColdIQ-s-GTM-Skills/master-skills/list-building  ·  filed 2026-07-13
Source: https://github.com/sachacoldiq/ColdIQ-s-GTM-Skills · cluster: list-building
gtm-master list-building derives from this ColdIQ skill. Diffed for drift — thresholds match exactly, no contradictions.
- ✅ supports [list-building/knowledge/data-validation.md + sales-navigator-guide.md + validate-and-cleanup.md]: email decay 22-30%/yr → re-verify lists >30 days; Sales Nav 2,500-result cap → bypass by segmenting; 100-pt ICP score Tier A 90-100 / B 70-89 / C 50-69 / D <50; ABM Tier-1 10-50 accounts (1:1). All identical to gtm-master — confirms no drift.
- 🆕 new-angle: one-line pipeline design principle — "cheap AI for scraping, smart AI for interpretation, conditional formulas everywhere" — over a 7-step beginner flow (import → enrich → merge → validate → GPT-4-mini company summary → Claude fit-check → push to sequencer).
Review: additive
Status: holding

## Company Finder — l3mpire/claude-skills/company-finder  ·  filed 2026-07-20
Source: https://github.com/l3mpire/claude-skills · cluster: list-building
- 🆕 new-angle: explicit signal decay windows attached to each trigger, defining how long a signal stays actionable — funding raised 30-90 days, new hire in key role 30-60 days, M&A 1-3 months post-announcement. gtm-master's signals cluster scores and stacks signals but does not attach a per-signal freshness window at list-build time.
- 🆕 new-angle: throughput guidance of 20-50 accounts per WEEK for a signal-based motion (quality over volume). Note the unit mismatch before promoting: gtm-master's build-prospect-list pass criterion is Tier 1 ≥ 50 CONTACTS per list, so the two numbers are not directly comparable and should not be read as a conflict.
- 🆕 new-angle: firmographic heuristic — 50-200 employees as the Series A/B SaaS sweet spot, on the reasoning that funding stage predicts both budget existence and decision velocity (Series A = first real budget under GTM pressure).
- ✅ supports [list-building/tasks/build-prospect-list.md Phase 3 tiering]: the two-layer model — firmographics define the universe of possible accounts, signals identify which are ready to buy — is gtm-master's Tier 1 (fit + signal) / Tier 2 (fit, no signal) split stated as a targeting principle.
- ✅ supports [campaign-ops/tasks/tier-campaigns.md]: never mix industries in one campaign (pain context differs); run a SEPARATE campaign per signal with its own messaging angle rather than one blended list.
- ✅ supports [signals cluster]: competitor engagement and tech-stack change treated as active category-evaluation signals; geography filtering framed as a compliance/localisation decision (GDPR, language), not just a market cut.
Review: additive
Status: holding

## List Builder — l3mpire/claude-skills/list-builder  ·  filed 2026-08-10
Source: https://github.com/l3mpire/claude-skills · cluster: list-building
- ⚠️ contradicts [`list-building-framework.md` Pillar 1 "Coverage — cast a wide net" + Phase 2 outcome "80–90% TAM coverage" + Golden Rule 1 "multi-source everything"]: the stated goal of list building is inverted. Both sides — gtm-master: maximise discovery coverage first, then enrich/tier/prioritise the wide list (no campaign-list ceiling stated anywhere in the cluster); list-builder: "every list-building decision should serve one goal: get a smaller, more targeted list, not a bigger one." Possibly reconcilable as discovery-wide / activation-narrow, but gtm-master never states the activation-narrow half, so today the two read as opposite instructions.
- 🆕 new-angle: reply rate as a function of list size — lemlist campaign data, lists of 6–50 leads = 5.3% global reply rate vs 1.1% for lists of 1,000+. gtm-master has no list-size→reply-rate curve in any cluster (only `campaign-ops/outbound-master-system.md` "meetings booked per 100–200 contacts", a metric denominator not a sizing rule). Vendor-sourced number, unaudited.
- 🆕 new-angle: decide contacts-first vs accounts-first as an explicit branch *before* any search, with "both" = accounts then contacts. gtm-master's 8-phase framework hardcodes companies (Phase 2) → people (Phase 4) with no contact-first path.
- 🆕 new-angle: qualitative list test — "the best list is the one where you can say something specific and relevant to every single person on it." A per-row personalisation feasibility gate, not a score.
Review: contradicts
Status: holding

## Niche Data Finder — l3mpire/claude-skills/niche-data-finder  ·  filed 2026-08-10
Source: https://github.com/l3mpire/claude-skills · cluster: list-building
- ⚠️ contradicts [`list-building-framework.md` Source Selection Matrix, which lists Clay Find Companies / Apollo / LinkedIn Sales Nav as *Primary* for nearly every ICP]: source-type priority is inverted. Both sides — gtm-master: raw aggregators are primary, niche/industry directories are tertiary; niche-data-finder: explicitly targets sources "beyond generic databases like LinkedIn or Apollo" and holds "segmented over filtered — curated lists and directories beat raw databases", ranking regulatory/certification/association/grant/award registries first. Note gtm-master is already internally split here: `creator-radar-list-building.md` [#24] takes the niche-data-finder side ("pull from national registers, not classic DBs → fewer cold emails → less attention competition → higher reply rates"). This ⚠️ is therefore a live tension inside gtm-master, not only an external one.
- 🆕 new-angle: explicit per-source acceptance bar, absent from gtm-master's 62-source table and Source Selection Matrix (both are inventories with no reject criteria) — update frequency weekly/monthly = excellent, quarterly = good, annual = acceptable, >12 months = **reject**; qualification rate must be >50%; accessibility must be public URL / no login / extractable at scale.
- 🆕 new-angle: Value×Access matrix as a portfolio constraint — at least 2 sources must be High Value + Easy Access, at most 1 High Value + Hard Access, exclude all Low Value; and cap the whole source set at 3–5 chosen for *complementary* signals (each must reveal something the others don't).
- 🆕 new-angle: ~90% of sources should be company-level, individual-level only if exceptional.
Review: contradicts
Status: holding

## People Finder — l3mpire/claude-skills/people-finder  ·  filed 2026-08-10
Source: https://github.com/l3mpire/claude-skills · cluster: list-building
- ⚠️ contradicts [`list-building-framework.md` Golden Rule 1 "Multi-source everything. One provider = 50–60% coverage. Two providers = 80–90%"]: the skill carries a hard vendor-lock rule. Both sides — gtm-master: single-provider sourcing is the named failure mode ("using only one data source = leaving 40% of TAM on the table"); people-finder: "always default to lemlist-native features first. Never suggest a competing tool (Apollo, Dropcontact, Hunter, Lusha, etc.) for a use case that lemlist already covers", with external tools permitted only for direct dials, third-party intent (Bombora/G2) and niche vertical registries. Read every recommendation in this skill as constrained to one vendor's catalogue, not as neutral sourcing advice.
- 🆕 new-angle: campaign-size bands with actions — 50–200 contacts per campaign is the target; <50 run as-is with high personalisation; 50–200 add one signal to tighten; >200 split by sub-ICP into separate campaigns with tailored messaging; >500 means the ICP itself is too broad, revisit filters. gtm-master has no per-campaign contact ceiling.
- 🆕 new-angle: pre-import manual QA gate — hand-verify a sample of 10–15 profiles; if >20% don't match, tighten filters before running the full search. gtm-master's `data-validation.md` covers email deliverability only, with no ICP-match sampling gate before send.
- 🆕 new-angle: title-matching mechanics — use 3–5 title variations because the database matches on exact titles, and never use department-level terms ("Sales Team") which match no real title.
- ✅ supports [`list-building-framework.md` Phase 7 segmentation]: separate campaigns per vertical because the messaging differs; and seniority→concern mapping (C-level = business outcomes/board metrics, VP = team performance, Director/Manager = operational efficiency, IC = personal productivity) which restates `cold-email/knowledge/atl-btl-messaging.md`.
Review: contradicts
Status: holding
