---
name: gtm-master
description: Master GTM / B2B outbound knowledge base. Single source of truth for GTM philosophy + fundamentals (BIPSY framework, scale-top-performers, signal-based outreach economics, multi-channel coordination, channel/timing mindsets), cold email writing, follow-ups, subject lines, PS lines, sequence QA (stress-testing), spintax, personalization at scale, re-engagement, deliverability, email infrastructure (SPF/DKIM/DMARC, warmup), buying signals (intent data, signal scoring, multi-signal stacking, RB2B/Trigify/Common Room/Bombora/Koala/Warmly), list building (Sales Navigator, boolean search, ICP, account qualification, ABM), end-to-end Clay workflow building (qualification, table architecture, contact finding, email/phone waterfalls, Sending Gate, push to sequencer/CRM), Clay enrichment (Claygent, Clayscript, credit optimization, formula columns, table mechanics), Clay providers (Clay Find Companies, Apify, BuiltWith, Sumble, Crunchbase, SEMrush, HTTP API, Enrich Person, Professional Posts), Clay sequencer push (Instantly, HeyReach), Clay CRM push (HubSpot, Salesforce, Google Sheets), ICP definition + validation, buyer persona development, lead scoring + prioritization, sales objection handling, multi-channel sequence design (email + LinkedIn), LinkedIn outreach sequences, hypothesis matrices, TAM mapping, campaign tiering, A/B testing, weekly campaign reports, campaign naming, campaign platform setup (Instantly/PlusVibe/Smartlead), LinkedIn profile audit, CTA optimization, reply analysis, meeting intent scoring, second-brain setup, sales team training and diagnosis, RevOps operations (revenue diagnostics, forecasting, pipeline visibility, metrics definitions, lead routing, handoffs, data governance, operating cadence, revenue planning, deal desk, deal velocity, CRM migration, AI/data product pricing), B2B paid ads (Meta/Facebook for B2B, LinkedIn ABM ads incl. 1:1, Google Ads, ad creative testing, creative fatigue, retargeting, ads-as-outbound-signal, CAPI/pixel tracking, ads account audits), AEO / AI-engine visibility (audits, citation mining, visibility tracking) + Reddit GTM (subreddit research, account warmup + safety, campaigns, mention triage), and content marketing (newsletter systems, SEO topic research pipeline, creator-led growth, creator deal pricing, B2B affiliate programs). Use for ANY GTM, outbound, sales engineering, RevOps, or B2B sales work. Triggers on "GTM philosophy", "GTM fundamentals", "BIPSY", "diagnose sales team", "train SDRs", "multi-channel coordination", "cold email", "outbound", "GTM", "buying signals", "intent data", "Clay", "Clay workflow", "Sending Gate", "Clay table architecture", "Clay Find Companies", "Apify", "BuiltWith", "Sumble", "Crunchbase", "SEMrush", "HeyReach", "ICP", "persona", "lead scoring", "list building", "Sales Navigator", "follow-up", "subject line", "deliverability", "warmup", "SPF/DKIM/DMARC", "Instantly", "Smartlead", "Lemlist", "Apollo", "PlusVibe", "RB2B", "Trigify", "Common Room", "Bombora", "objection", "sequence", "LinkedIn outreach", "hypothesis matrix", "TAM", "A/B test", "campaign report", "second brain", "RevOps", "forecast", "pipeline coverage", "lead routing", "CRM migration", "deal desk", "Meta ads", "Facebook ads", "LinkedIn ABM", "Google Ads", "ads audit", "retargeting", "AEO", "AI visibility", "GEO", "Reddit", "subreddit", "newsletter", "SEO topics", "creator marketing", "influencer", "affiliate program", "AI pricing", "credit pricing", "reverse ETL". Do NOT use for organic LinkedIn deep-dive content strategy (use linkedin-content skill; the linkedin-organic cluster here covers quick recipes), general LinkedIn ads fundamentals (use linkedin-ads skill; the paid-ads cluster here owns Meta B2B, ABM ads math, and ads-as-signal), or executive comms framing (use game-pyramid skill).
---

## Setup (Run Once Per Session)

Before loading any cluster file, locate this skill's install directory:
1. Use Glob to search for `**/gtm-master/SKILL.md`
2. The directory containing this SKILL.md is `SKILL_BASE`
3. Cluster paths follow: `{SKILL_BASE}/clusters/<cluster-name>/{tasks,knowledge,reference}/...`

Always resolve SKILL_BASE dynamically — never hardcode.

# GTM Master — Single Entry Point for All Outbound Work

Master router for B2B GTM/outbound work. Knowledge is split into **15 clusters**, each with `tasks/` (runnable recipes), `knowledge/` (deep references — lazy-loaded), and `reference/` (quick lookups).

## How to use this skill

1. **Identify the user's intent** — match it to ONE of the 15 clusters via the cluster index below
2. **Match intent to a task** — each cluster has a task routing table; load the matching `tasks/<x>.md` file
3. **Tasks are self-contained** — they include inputs, process, output format, pass criteria. They reference `knowledge/` only when depth is needed.
4. **Multi-cluster workflows** chain tasks — typical chain: `icp/build-icp` → `signals/map-signals-to-icp` → `list-building/build-prospect-list` → `enrichment/run-email-waterfall` → `lead-scoring/score-and-prioritize` → `cold-email/write-first-email` → `cold-email/stress-test-sequence` → `campaign-ops/setup-campaign-platform`

## The 15 clusters — index

| Cluster | Owns triggers like | Primary tasks |
|---|---|---|
| **cold-email** | "write a cold email", "follow-up", "subject line", "PS line", "stress test", "spintax", "deliverability", "warmup", "SPF/DKIM/DMARC", "Instantly", "Smartlead" | 8 tasks (write-first-email, write-followup, write-subject-lines, write-ps-line, stress-test-sequence, add-spintax, personalize-at-scale, re-engage-cold-leads) |
| **signals** | "buying signals", "intent data", "RB2B", "Trigify", "signal scoring", "multi-signal stacking", "hiring signals", "funding signals", "job change tracking" | 3 tasks (detect-signals-from-list, map-signals-to-icp, score-multi-signal) |
| **list-building** | "build a list", "Sales Navigator", "boolean search", "find prospects", "data validation", "list hygiene", "Evaboot", "PhantomBuster" | 2 tasks (build-prospect-list, validate-and-cleanup) |
| **enrichment** | "Clay", "Clay workflow", "Sending Gate", "table architecture", "waterfall enrichment", "find emails", "Claygent", "Clayscript", "Clay credits", "Clay HubSpot/Salesforce", "Instantly Clay push", "HeyReach Clay push", "Clay Find Companies", "Apify", "BuiltWith", "Sumble", "Crunchbase", "SEMrush" | 5 tasks (build-clay-workflow, build-table-architecture, design-sending-gate, push-to-sequencer, run-email-waterfall) |
| **icp** | "build ICP", "define ICP", "ideal customer profile", "validate against ICP", "score company fit" | 2 tasks (build-icp, validate-against-icp) |
| **personas** | "build persona", "buyer persona", "JTBD", "buying committee", "messaging guide for [role]" | 1 task (build-persona) |
| **lead-scoring** | "score leads", "prioritize list", "ICP scoring", "lead tiering", "who to contact first" | 1 task (score-and-prioritize) |
| **objections** | "handle objection", "not interested reply", "send more info reply", "wrong person reply", "objection playbook" | 1 task (handle-objection) |
| **sequences** | "multi-channel sequence", "LinkedIn outreach", "LinkedIn sequence", "email + LinkedIn flow", "connection request", "InMail" | 2 tasks (design-multi-channel, write-linkedin-sequence) |
| **campaign-ops** | "TAM", "hypothesis matrix", "name campaigns", "set up campaign", "second brain", "deliverability audit", "LinkedIn profile audit", "CTA optimization", "analyze replies", "score meeting intent", "A/B test", "weekly report", "tier campaigns" | 13 tasks |
| **linkedin-organic** | "write a LinkedIn post", "hook", "carousel", "CTA", "repurpose", "viral post analysis", "swipe file", "trending topics", "niche", "content pillars", "content calendar", "audience persona", "smart comment", "connection request", "DM opener", "profile optimizer", "post analytics" | 21 skills across content / research / strategy / engagement / networking / analytics |
| **revops** | "diagnose revenue system", "forecast", "pipeline coverage", "pipeline visibility", "lead routing", "handoffs", "data governance", "operating cadence", "revenue planning", "deal desk", "deal velocity", "CRM migration", "AI pricing" | 2 tasks (run-revops-diagnostic, plan-crm-migration) + 9 knowledge files |
| **paid-ads** | "Meta ads", "Facebook B2B", "LinkedIn ABM ads", "1:1 ABM", "Google Ads", "ad creative", "creative fatigue", "retargeting", "CAPI", "ads audit", "ads report", "ad engagement signals" | 3 tasks (plan-abm-ads-campaign, audit-ads-account, monthly-ads-report) + 9 knowledge files |
| **aeo-reddit** | "AEO", "AI visibility", "AI citations", "show up in ChatGPT/Perplexity", "Reddit", "subreddit", "karma", "Reddit warmup", "brand mentions" | 3 tasks (run-aeo-audit, launch-reddit-campaign, research-subreddits) |
| **content-marketing** | "newsletter", "welcome sequence", "SEO topics", "keyword research", "creator marketing", "influencer", "sponsored post", "creator rates", "affiliate program" | 3 tasks (launch-newsletter, run-seo-topic-research, launch-creator-campaign) |

## Routing logic

0. **Diagnose the bottleneck FIRST** (for any strategy / "what should I do / where do I invest" request). Map the funnel as four machines — Demand Gen → Capture → Conversion → Closing — and find the slowest. Route to the cluster that fixes THAT machine; don't optimize a non-bottleneck. See `{SKILL_BASE}/reference/funnel-bottleneck-diagnosis.md`. Skip for single-task/tactical requests where the bottleneck is already known.

1. **Single-task request** → match to a cluster, load that task file. Done.
2. **Cross-cluster workflow** → identify the most upstream task, load it, follow its "what to do after" pointers.
3. **Theory question** ("how does X work?") → skip tasks, load the matching `knowledge/` file directly.
4. **Quick lookup** (tool name, benchmark, threshold) → use the inline tables below first.
5. **Philosophy / fundamentals / sales team diagnosis** ("how should I think about X", "BIPSY", "train my team", "scale what works", "multi-channel mindset", "lead with pain") → load `{SKILL_BASE}/philosophy.md`. This is foundational theory that informs every cluster.
6. **Master architectural designs** (full outbound motion / full ABM motion / inbound zero-leakage pipeline / attribution architecture / signal activation architecture / tool stack + MCPs) → load the corresponding file in `{SKILL_BASE}/clusters/campaign-ops/knowledge/` or `{SKILL_BASE}/clusters/signals/knowledge/` or `{SKILL_BASE}/reference/`. See the "Top-level references" + cluster knowledge indexes below.

---

## Cluster: cold-email

**Trigger:** anything email-writing, follow-up, deliverability, infrastructure, sequencing-tool related.

| Intent | Load |
|---|---|
| Write the first/opening email | `{SKILL_BASE}/clusters/cold-email/tasks/write-first-email.md` |
| Write a follow-up email | `{SKILL_BASE}/clusters/cold-email/tasks/write-followup.md` |
| Generate / rank subject lines | `{SKILL_BASE}/clusters/cold-email/tasks/write-subject-lines.md` |
| Write a PS line | `{SKILL_BASE}/clusters/cold-email/tasks/write-ps-line.md` |
| Stress-test a sequence pre-launch | `{SKILL_BASE}/clusters/cold-email/tasks/stress-test-sequence.md` |
| Add spintax | `{SKILL_BASE}/clusters/cold-email/tasks/add-spintax.md` |
| Personalize at scale (Clay/AI prompts) | `{SKILL_BASE}/clusters/cold-email/tasks/personalize-at-scale.md` |
| Re-engage cold/closed-lost leads | `{SKILL_BASE}/clusters/cold-email/tasks/re-engage-cold-leads.md` |

Knowledge index: 13 named copywriting frameworks, ATL/BTL messaging, ColdIQ playbook, e-commerce playbook, sequence theory, deliverability deep guide, email infra (3 files), personalization prompt library, campaign playbooks, email template library. Browse `{SKILL_BASE}/clusters/cold-email/knowledge/` for the full map.

---

## Cluster: signals

**Trigger:** anything intent data, buying signals, signal scoring, signal-tool selection, signal-driven GTM.

| Intent | Load |
|---|---|
| Scan a company list for signals | `{SKILL_BASE}/clusters/signals/tasks/detect-signals-from-list.md` |
| Map signals to a specific ICP | `{SKILL_BASE}/clusters/signals/tasks/map-signals-to-icp.md` |
| Score multi-signal stacks (Cool→Warm→Hot) | `{SKILL_BASE}/clusters/signals/tasks/score-multi-signal.md` |
| Run the Customer Alumni play (3-5× reply rate) | `{SKILL_BASE}/clusters/signals/tasks/customer-alumni-play.md` |

Knowledge index: 6 core buying signals + benchmarks, 137-trigger taxonomy, 30-trigger detection-tools matrix, signal scoring framework, tool setup (RB2B/Trigify/Common Room/Bombora/Koala/Warmly/6sense/BuiltWith), 11 executable GTM plays, job-change tracking. Plus: **signal activation architecture** (13-step capture→…→track→enablement pipeline + 5-field metadata schema + rep-routing table) → `{SKILL_BASE}/clusters/signals/knowledge/signal-activation-architecture.md`. Plus: **engagement-on-external-content signal class** (competitor followers / brand mentions / influencer engagement / keyword listening / own-content engagement / employee LinkedIn — 6 surfaces) → `{SKILL_BASE}/clusters/signals/knowledge/engagement-on-external-content.md`. Plus: **intent signal tools 2026 catalog** (18 signal categories × 50+ specific vendor recommendations, organized by 1st/2nd/3rd party) → `{SKILL_BASE}/clusters/signals/knowledge/intent-signal-tools-2026.md`. **Visual:** see `{SKILL_BASE}/visual-library/the-signal-playbook.md` — radial 3-ring diagram showing 1st/2nd/3rd party signals with 16+ signal types around the perimeter. Plus: **go-to-market alpha** (the signal-originality test — "can a competitor buy this exact signal off the shelf?"; Canva / Mercado / recruitment-client ex-employer + job-posting worked examples) → `{SKILL_BASE}/clusters/signals/knowledge/go-to-market-alpha.md`. Browse `{SKILL_BASE}/clusters/signals/knowledge/`.

---

## Cluster: list-building

**Trigger:** anything list-building, prospecting, Sales Nav, ICP search, list hygiene.

| Intent | Load |
|---|---|
| Build a prospect list end-to-end | `{SKILL_BASE}/clusters/list-building/tasks/build-prospect-list.md` |
| Validate / clean up an existing list | `{SKILL_BASE}/clusters/list-building/tasks/validate-and-cleanup.md` |

Knowledge index: Sales Navigator guide, lead sources guide, data validation, beginner Clay workflow, qualification workflow, ABM account-selection framework, persona-mapping framework, 62+ underused data sources, 100+ industry directories, 8-phase quality framework. Browse `{SKILL_BASE}/clusters/list-building/knowledge/`.

---

## Cluster: enrichment

**Trigger:** anything Clay, end-to-end Clay workflow building, table architecture, Sending Gate, waterfall enrichment, finding emails/phones, Claygent, Clayscript, credit optimization, Clay providers (Clay Find Companies, Apify, BuiltWith, Sumble, Crunchbase, SEMrush), Clay sequencer/CRM push (Instantly, HeyReach, HubSpot, Salesforce).

| Intent | Load |
|---|---|
| Build a Clay workflow end-to-end (orchestrates 6 phases) | `{SKILL_BASE}/clusters/enrichment/tasks/build-clay-workflow.md` |
| Design Clay table architecture (Table A/B, multi-segment, dedupe) | `{SKILL_BASE}/clusters/enrichment/tasks/build-table-architecture.md` |
| Build the Sending Gate formula column (gate before any export) | `{SKILL_BASE}/clusters/enrichment/tasks/design-sending-gate.md` |
| Push Clay output to Instantly / HeyReach | `{SKILL_BASE}/clusters/enrichment/tasks/push-to-sequencer.md` |
| Run an email waterfall | `{SKILL_BASE}/clusters/enrichment/tasks/run-email-waterfall.md` |

Knowledge index — gtm-master native: core Clay concepts, waterfall enrichment deep guide, workflow patterns, Clayscript formulas, copy-paste formulas, Claygent (5-step prompt-writing process + Eric Noski's 8 rules + production prompt library), **qualification prompt framework** (the copy-paste EXCLUDE-first/QUALIFY/HYBRID website-qualification template for TAM builds → `{SKILL_BASE}/clusters/enrichment/knowledge/prompts/qualification-prompt-framework.md`), credit optimization, Clay operations guide, enrichment templates, CRM sync (HubSpot/Salesforce/Pipedrive), Eric Noski expert tips, HTTP API column patterns (Clay → n8n). Plus: **2 copy-paste Clay templates** — Instantly-reply→enrichment→HubSpot+Slack pipeline at `{SKILL_BASE}/clusters/enrichment/knowledge/templates/reply-enrichment-clay-template.md`; Warmly/RB2B/Albacross→deanon→enrichment→tier-route at `{SKILL_BASE}/clusters/enrichment/knowledge/templates/website-deanon-clay-template.md`. Browse `{SKILL_BASE}/clusters/enrichment/knowledge/`.

Knowledge index — clay-engineer (operational reference, lazy-loaded):
- Master rules + FETE framework + Standard Workflow Order → `{SKILL_BASE}/clusters/enrichment/clay-engineer/clay-engineer-master.md`
- 6 phases (discovery → list-building → qualification → table-architecture → enrichment → export) → `{SKILL_BASE}/clusters/enrichment/clay-engineer/phases/`
- Platform: formula-syntax, table-mechanics → `{SKILL_BASE}/clusters/enrichment/clay-engineer/platform/`
- Providers (13 files): databases (Clay Find Companies), contact-finding (email-waterfall, phone), enrichments (Apify, BuiltWith+Sumble, Crunchbase, Enrich Person, HTTP API, Professional Posts, SEMrush), sequencers (Instantly, HeyReach), crm (HubSpot, Salesforce), other (Google Sheets) → `{SKILL_BASE}/clusters/enrichment/clay-engineer/providers/`

---

## Cluster: icp

**Trigger:** anything ICP definition, validation, scoring fit.

| Intent | Load |
|---|---|
| Build an ICP from scratch | `{SKILL_BASE}/clusters/icp/tasks/build-icp.md` |
| Validate a company against ICP | `{SKILL_BASE}/clusters/icp/tasks/validate-against-icp.md` |

Knowledge index: ICP scoring deep theory lives in `clusters/list-building/knowledge/templates/qualification-workflow.md` and `clusters/list-building/knowledge/abm/account-selection-framework.md`. The build-icp task now includes a **backtest validation step** ("do wins cluster in Tier 1 and losses cluster in Tier 3?") — this is what separates predictive ICPs from aspirational ones.

---

## Cluster: personas

**Trigger:** anything buyer persona, JTBD, role-specific messaging.

| Intent | Load |
|---|---|
| Build a persona | `{SKILL_BASE}/clusters/personas/tasks/build-persona.md` |

Knowledge index: **5-role buying committee + per-role messaging strategy** (Exec / Ops / Tech / Finance / End-User — Gartner says 6-10 stakeholders per B2B deal) → `{SKILL_BASE}/clusters/personas/knowledge/buying-committee-5-roles.md`. Buying-committee/persona-mapping framework lives in `clusters/list-building/knowledge/abm/persona-mapping-framework.md`. ATL/BTL messaging in `clusters/cold-email/knowledge/atl-btl-messaging.md`.

---

## Cluster: lead-scoring

**Trigger:** anything lead scoring, prioritization, tier-ranking, "who to contact first".

| Intent | Load |
|---|---|
| Score and prioritize leads | `{SKILL_BASE}/clusters/lead-scoring/tasks/score-and-prioritize.md` |

Knowledge index: detailed scoring framework + weights + SLAs lives in `clusters/signals/knowledge/signal-scoring.md`. Plus: **awareness-stage model** — 5-stage state framework (Identified → Aware → Interested → Considering → Selecting) with HubSpot-specific OR-criteria filter mechanics + priority-branch workflow → `{SKILL_BASE}/clusters/lead-scoring/knowledge/awareness-stage-model.md`. Score = number; stage = state with a play attached. Use both.

---

## Cluster: objections

**Trigger:** anything objection handling, "not interested" reply, sales pushback responses.

| Intent | Load |
|---|---|
| Handle a sales objection | `{SKILL_BASE}/clusters/objections/tasks/handle-objection.md` |

---

## Cluster: sequences

**Trigger:** anything multi-channel sequence design, LinkedIn outreach, channel-mix planning.

| Intent | Load |
|---|---|
| Design a multi-channel email + LinkedIn sequence | `{SKILL_BASE}/clusters/sequences/tasks/design-multi-channel.md` |
| Write a LinkedIn outreach sequence | `{SKILL_BASE}/clusters/sequences/tasks/write-linkedin-sequence.md` |

Knowledge index: **Tiered routing template** — canonical 3-tier pattern (Tier 1 multichannel from C-level email + AE LinkedIn + supporting connection requests + Slack alert; Tier 2/3 automated) plus 4 variations by signal type (own-content engagement → cold call; website deanon → stakeholder expansion; inbound signup → multi-thread; customer alumni → 1:1 AE-led) → `{SKILL_BASE}/clusters/sequences/knowledge/tiered-routing-template.md`.

---

## Cluster: campaign-ops

**Trigger:** anything campaign management, planning, audits, analytics, ops.

| Intent | Load |
|---|---|
| Map total addressable market | `{SKILL_BASE}/clusters/campaign-ops/tasks/map-tam.md` |
| Build a hypothesis matrix | `{SKILL_BASE}/clusters/campaign-ops/tasks/build-hypothesis-matrix.md` |
| Name campaigns consistently | `{SKILL_BASE}/clusters/campaign-ops/tasks/name-campaigns.md` |
| Set up a campaign on the platform | `{SKILL_BASE}/clusters/campaign-ops/tasks/setup-campaign-platform.md` |
| Set up a second brain for a client | `{SKILL_BASE}/clusters/campaign-ops/tasks/setup-second-brain.md` |
| Audit deliverability infrastructure | `{SKILL_BASE}/clusters/campaign-ops/tasks/audit-deliverability.md` |
| Audit a LinkedIn profile | `{SKILL_BASE}/clusters/campaign-ops/tasks/audit-linkedin-profile.md` |
| Optimize a CTA | `{SKILL_BASE}/clusters/campaign-ops/tasks/optimize-cta.md` |
| Analyze replies in inbox | `{SKILL_BASE}/clusters/campaign-ops/tasks/analyze-replies.md` |
| Score a reply for meeting intent | `{SKILL_BASE}/clusters/campaign-ops/tasks/score-meeting-intent.md` |
| Analyze A/B test results | `{SKILL_BASE}/clusters/campaign-ops/tasks/run-ab-test.md` |
| Generate weekly campaign report | `{SKILL_BASE}/clusters/campaign-ops/tasks/weekly-report.md` |
| Tier active campaigns (scale/optimize/kill) | `{SKILL_BASE}/clusters/campaign-ops/tasks/tier-campaigns.md` |
| Enable sales to run a campaign ("campaign in a box") | `{SKILL_BASE}/clusters/campaign-ops/tasks/enable-sales.md` |

Knowledge index — strategic-architectural references (load when designing or auditing a full motion, not for single-task questions):
- **Outbound master system** — 7-step framework (ICP → TAM → research → scoring → contact sourcing → message-market fit → scale-only-when-3-gates-pass) → `{SKILL_BASE}/clusters/campaign-ops/knowledge/outbound-master-system.md`. Visual: `{SKILL_BASE}/visual-library/complete-outbound-playbook.md`
- **ABM operating system 2026** — 11-step pipeline + Tier × Awareness × Signal-strength matrix + bi-directional CRM↔Slack feedback loop → `{SKILL_BASE}/clusters/campaign-ops/knowledge/abm-operating-system-2026.md`. Visual: `{SKILL_BASE}/visual-library/gtm-flywheel-playbook.md` (6-stage flywheel infographic)
- **ABM engine implementation** (the hands-on build companion) — when-ABM gate (ACV $50k+ / TAM <20k), 90%+ TAM coverage via 4 provider types, Claude Code merge-dedupe + Clay back-testing split, 30+ custom CRM properties + $2k cost math, evergreen CRM enrichment conversion, tier-classification HubSpot workflow, 1:1 + 1:many channel lessons, the 6 ICP pipeline progression reports → `{SKILL_BASE}/clusters/campaign-ops/knowledge/abm-engine-implementation.md`
- **Outbound attribution** — 2-property HubSpot pattern capturing "hidden" influence (silent conversions, LinkedIn effect, delayed signups) → `{SKILL_BASE}/clusters/campaign-ops/knowledge/outbound-attribution.md`. Visual: `{SKILL_BASE}/visual-library/outbound-attribution-playbook.md` (traditional-vs-complete workflow)
- **Inbound orchestration** — zero-leakage form → enrichment → CRM → meeting prep pipeline (2-field Webflow form, HeyReach pre-meeting warmup, Slack-as-CRM approval) → `{SKILL_BASE}/clusters/campaign-ops/knowledge/inbound-orchestration.md`. Visual: `{SKILL_BASE}/visual-library/inbound-orchestration.md`
- **Ad spend management via Claude Code** — 12 skills (4 per platform) managing $300K/mo Google + Meta + LinkedIn ads at consistent 4× ROAS+. Operational rhythm + setup. Worth $3K-$8K/mo recovery per $50K Google Ads account → `{SKILL_BASE}/clusters/campaign-ops/knowledge/ad-spend-management-claude-code.md`

---

## Cluster: linkedin-organic

**Trigger:** anything LinkedIn ORGANIC content and growth — writing posts, hooks, carousels, CTAs, repurposing, viral-post teardown, niche / persona / pillars / calendar strategy, comment + DM + connection engagement, profile optimization, post analytics. Sourced from Taplio's LinkedIn Claude Skills. NOTE: overlaps the standalone `linkedin-content` skill — prefer whichever the user names; these are the quick single-shot recipes, `linkedin-content` holds the deeper engagement data + ColdIQ voice guide.

Organized by category (not the usual `tasks/` layout). Load the matching file:

**content**
| Intent | Load |
|---|---|
| Write a post from a raw idea (3 variants) | `{SKILL_BASE}/clusters/linkedin-organic/content/post-writer.md` |
| Generate scroll-stopping hooks | `{SKILL_BASE}/clusters/linkedin-organic/content/hook-generator.md` |
| Build a carousel from content | `{SKILL_BASE}/clusters/linkedin-organic/content/carousel-builder.md` |
| Optimize the CTA | `{SKILL_BASE}/clusters/linkedin-organic/content/cta-optimizer.md` |
| Repurpose one piece into many | `{SKILL_BASE}/clusters/linkedin-organic/content/repurposer.md` |
| Extract a story from raw experience | `{SKILL_BASE}/clusters/linkedin-organic/content/story-extractor.md` |

**research**
| Intent | Load |
|---|---|
| Reverse-engineer a viral post | `{SKILL_BASE}/clusters/linkedin-organic/research/viral-post-analyzer.md` |
| Build a swipe file | `{SKILL_BASE}/clusters/linkedin-organic/research/swipe-file-builder.md` |
| Scan trending topics | `{SKILL_BASE}/clusters/linkedin-organic/research/trending-topics-scanner.md` |
| Find niche creators to learn from | `{SKILL_BASE}/clusters/linkedin-organic/research/niche-creator-finder.md` |

**strategy**
| Intent | Load |
|---|---|
| Define your niche | `{SKILL_BASE}/clusters/linkedin-organic/strategy/niche-definer.md` |
| Build content pillars | `{SKILL_BASE}/clusters/linkedin-organic/strategy/content-pillars-builder.md` |
| Plan a content calendar | `{SKILL_BASE}/clusters/linkedin-organic/strategy/content-calendar-planner.md` |
| Build an audience persona | `{SKILL_BASE}/clusters/linkedin-organic/strategy/audience-persona-builder.md` |

**engagement**
| Intent | Load |
|---|---|
| Find comment opportunities | `{SKILL_BASE}/clusters/linkedin-organic/engagement/comment-opportunity-finder.md` |
| Write a smart comment | `{SKILL_BASE}/clusters/linkedin-organic/engagement/smart-comment-writer.md` |

**networking**
| Intent | Load |
|---|---|
| Write a connection-request hook | `{SKILL_BASE}/clusters/linkedin-organic/networking/connection-request-hook.md` |
| Write a DM opener | `{SKILL_BASE}/clusters/linkedin-organic/networking/dm-opener.md` |
| Optimize your profile | `{SKILL_BASE}/clusters/linkedin-organic/networking/profile-optimizer.md` |

**analytics**
| Intent | Load |
|---|---|
| Interpret your account analytics | `{SKILL_BASE}/clusters/linkedin-organic/analytics/analytics-interpreter.md` |
| Critique a post's performance | `{SKILL_BASE}/clusters/linkedin-organic/analytics/post-performance-critic.md` |

---

## Cluster: revops

**Trigger:** anything revenue operations: diagnosing revenue problems, forecasting, pipeline visibility/hygiene, revenue metrics + benchmarks, lead routing + speed-to-lead, handoffs (marketing→sales→CS→expansion), data governance/CRM data quality, operating cadence + board reporting, annual revenue planning + capacity, deal desk + discount governance, deal velocity/stalled deals, CRM migration or consolidation.

| Intent | Load |
|---|---|
| Diagnose a revenue system ("we keep missing plan") | `{SKILL_BASE}/clusters/revops/tasks/run-revops-diagnostic.md` |
| Plan a CRM migration or consolidation | `{SKILL_BASE}/clusters/revops/tasks/plan-crm-migration.md` |
| Build or fix a forecast (categories, coverage, accuracy, breach rules) | `{SKILL_BASE}/clusters/revops/knowledge/forecasting.md` |
| Define metrics / benchmark performance (funnel, unit economics, NRR, deal health) | `{SKILL_BASE}/clusters/revops/knowledge/metrics-definitions.md` |
| Design pipeline dashboards, hygiene automation, quality scores | `{SKILL_BASE}/clusters/revops/knowledge/pipeline-visibility.md` |
| Fix slow/stalling deals; design deal desk, discount governance | `{SKILL_BASE}/clusters/revops/knowledge/deal-desk-and-velocity.md` |
| Design lead routing, SLAs, handoffs, expansion handback | `{SKILL_BASE}/clusters/revops/knowledge/handoffs-and-lead-routing.md` |
| Fix CRM data quality, field governance, integrations, warehouse architecture | `{SKILL_BASE}/clusters/revops/knowledge/data-governance.md` |
| Design meeting cadence, forecast calls, QBR/board decks | `{SKILL_BASE}/clusters/revops/knowledge/operating-cadence.md` |
| Build annual plan, capacity model, territories, org ratios | `{SKILL_BASE}/clusters/revops/knowledge/revenue-planning.md` |
| Price an AI/data product (model picker, credits, ROI receipts, billing ops) | `{SKILL_BASE}/clusters/revops/reference/ai-pricing-and-packaging.md` |

Knowledge index: full diagnostic framework (3-layer system, IFA, Six Stages, triage tree, crisis 4-week protocol + 30-60-90) in `{SKILL_BASE}/clusters/revops/knowledge/diagnostic-framework.md`. Portable CRM principles (lifecycle vs deal stage vs lead status, time-in-stage workarounds, HubSpot-vs-Salesforce decision table) → `{SKILL_BASE}/clusters/revops/reference/crm-platform-portable-principles.md`. ICP/scoring deltas ONLY (ECP customer-count thresholds, 7-dimension ICP audit, account-level ABM engagement scoring with decay + buying-group handover gate) → `{SKILL_BASE}/clusters/revops/reference/icp-and-scoring-notes.md`; the `icp` and `lead-scoring` clusters own that canon.

---

## Cluster: paid-ads

**Trigger:** anything paid advertising: Meta/Facebook/Instagram for B2B, LinkedIn ABM ads (1:1, 1:few, 1:many), Google Ads, ad budget math, ad creative testing/fatigue, retargeting, ad-engagement-as-signal for outbound, CAPI/pixel tracking, ad account audits, monthly ads reports.

| Intent | Load |
|---|---|
| Plan a LinkedIn ABM campaign (budget/audience/ad-count math) | `{SKILL_BASE}/clusters/paid-ads/tasks/plan-abm-ads-campaign.md` |
| Audit a live ads account (graded fix list) | `{SKILL_BASE}/clusters/paid-ads/tasks/audit-ads-account.md` |
| Write a monthly stakeholder ads report | `{SKILL_BASE}/clusters/paid-ads/tasks/monthly-ads-report.md` |
| Turn ad engagement into outbound (signals, CTR loop, BDR triggers) | `{SKILL_BASE}/clusters/paid-ads/knowledge/ads-outbound-interplay.md` |
| Run/fix a Meta B2B account (any pause/scale/graduate decision) | `{SKILL_BASE}/clusters/paid-ads/knowledge/meta-operating-system.md` |
| Set up Meta for B2B (audiences, phases, offers, Advantage+, qualified pipeline) | `{SKILL_BASE}/clusters/paid-ads/knowledge/meta-b2b-system.md` |
| Write ad copy / TLAs / headlines | `{SKILL_BASE}/clusters/paid-ads/knowledge/ad-copywriting.md` |
| Build/iterate ad creative, diagnose fatigue | `{SKILL_BASE}/clusters/paid-ads/knowledge/creative-system.md` |
| LinkedIn ABM mechanics (lists, 1:1 whale play, sizing, targeting gotchas) | `{SKILL_BASE}/clusters/paid-ads/knowledge/linkedin-abm-ads.md` |
| Select/score/stage ABM accounts, retargeting orchestration | `{SKILL_BASE}/clusters/paid-ads/knowledge/abm-orchestration.md` |
| Measure/attribute paid programs, pause rules, experiments | `{SKILL_BASE}/clusters/paid-ads/knowledge/measurement-attribution.md` |

Reference: all benchmarks in one file → `{SKILL_BASE}/clusters/paid-ads/reference/benchmarks.md`; Meta tracking/CAPI setup + audit → `{SKILL_BASE}/clusters/paid-ads/reference/meta-tracking-capi.md`; Google Ads intent-first notes → `{SKILL_BASE}/clusters/paid-ads/reference/google-ads-notes.md`; demand lifecycle + channel selection + budget splits → `{SKILL_BASE}/clusters/paid-ads/knowledge/budget-channels-demand.md`. Note: general LinkedIn ads strategy (funnel architecture, bidding, formats) stays in the standalone `linkedin-ads` skill; this cluster holds what it does not.

---

## Cluster: aeo-reddit

**Trigger:** anything AEO/GEO measurement (AI-engine visibility, AEO score, AI citations, "do we show up in ChatGPT/Perplexity answers", citation mining) and anything Reddit GTM (subreddit research, Reddit campaigns, advocate comments, account warmup, karma, bans, brand mentions on Reddit, Reddit attribution).

| Intent | Load |
|---|---|
| Run an AEO audit (baseline, or "why did the score move") | `{SKILL_BASE}/clusters/aeo-reddit/tasks/run-aeo-audit.md` |
| Find / vet subreddits for a product | `{SKILL_BASE}/clusters/aeo-reddit/tasks/research-subreddits.md` |
| Launch or run a Reddit campaign, review drafts | `{SKILL_BASE}/clusters/aeo-reddit/tasks/launch-reddit-campaign.md` |
| Fix off-brand or wrong-fact advocate drafts | `{SKILL_BASE}/clusters/aeo-reddit/reference/advocate-voice-tuning.md` |

Knowledge index: **AEO measurement system** (visibility tracking, three-step score audit, three-level citation drill-down, hit-list method) → `{SKILL_BASE}/clusters/aeo-reddit/knowledge/aeo-measurement-system.md`. **Reddit GTM system** (campaign model, advocate personas, approval loop, mention triage, UTM attribution) → `{SKILL_BASE}/clusters/aeo-reddit/knowledge/reddit-gtm-system.md`. **Reddit account safety** (karma warmup ladder, ban/removal/rule-note signals, six-point comment check, four-check pre-post gate) → `{SKILL_BASE}/clusters/aeo-reddit/knowledge/reddit-account-safety.md`; this file is BLOCKING before any Reddit posting work. For the supply side (llms.txt, markdown endpoints, comparison pages, build gates) and market context, still load `{SKILL_BASE}/reference/aeo-and-ai-buyer-discovery.md` alongside the AEO knowledge file; the cluster covers the demand/measurement side and cross-references it.

---

## Cluster: content-marketing

**Trigger:** anything newsletter (positioning, landing page, welcome sequence, subject lines for a subscriber list, roundup/announcement emails), SEO topic/keyword research and content roadmaps (incl. AEO/AI-search), creator/influencer marketing (sourcing, pricing, briefs, sponsored posts, ROI), or B2B affiliate programs. NOT LinkedIn organic posting strategy (use linkedin-organic) and NOT paid ads (use the paid-ads cluster).

| Intent | Load |
|---|---|
| Launch or reposition a newsletter (value prop → landing page → welcome flow) | `{SKILL_BASE}/clusters/content-marketing/tasks/launch-newsletter.md` |
| Run SEO topic research end-to-end (7 phases → tiered roadmap) | `{SKILL_BASE}/clusters/content-marketing/tasks/run-seo-topic-research.md` |
| Launch a creator campaign / brief a creator / write or review a sponsored post | `{SKILL_BASE}/clusters/content-marketing/tasks/launch-creator-campaign.md` |

Knowledge index: **newsletter system** (analysis-format 8 steps, value-prop formula, 40-60% opt-in landing page, 6-step welcome email with the deliverability reply ask, 5-email welcome sequence) → `{SKILL_BASE}/clusters/content-marketing/knowledge/newsletter-system.md`. **SEO topic pipeline** (account intelligence → opportunities → keyword validation → SERP verdicts → 5 commercial gates → format assignment → 6-dimension scoring into Tier 1/2/3; pipeline over traffic) → `{SKILL_BASE}/clusters/content-marketing/knowledge/seo-topic-pipeline.md`. **Creator-led growth** (expertise curve, 60/30/10 portfolio, 4-axis vetting, founder-vs-employees-vs-creators fork, 90-day program, 14-30 day attribution) → `{SKILL_BASE}/clusters/content-marketing/knowledge/creator-led-growth.md`. **Creator deal economics** (flat vs CPC decision rule, qualified click = tracked + ≥30s, rate bands, weighted-engagement rate model, 3-option negotiation, pipeline forecast, Scale/Adjust/Stop QBR) → `{SKILL_BASE}/clusters/content-marketing/knowledge/creator-deal-economics.md`. **Affiliate program** (Allowable CAC commission math, 90-day cookie floor, gated applications, 4-email onboarding, no coupon sites ever) → `{SKILL_BASE}/clusters/content-marketing/knowledge/affiliate-program.md`. Reference: **newsletter copy patterns** (100 subject-line formulas by trigger, 10 optimizer rules, Pain-Is-The-Pitch rewrites, roundup/announcement/repurpose templates, 52-format idea bank) → `{SKILL_BASE}/clusters/content-marketing/reference/newsletter-copy-patterns.md`; **benchmarks** (Beehiiv click-to-open trap + report formulas, creator rate and conversion tables, SEO thresholds, affiliate numbers) → `{SKILL_BASE}/clusters/content-marketing/reference/benchmarks.md`. Boundary: the newsletter↔LinkedIn repurposing bridge lives here and cross-references `clusters/linkedin-organic/content/repurposer.md`; creator sourcing cross-references `clusters/linkedin-organic/research/niche-creator-finder.md`.

---

## Top-level references

- **GTM philosophy** (BIPSY, multi-channel coordination, mindsets, benchmarks) → `{SKILL_BASE}/philosophy.md`
- **Funnel bottleneck diagnosis** (the 4-machine factory model — Demand Gen → Capture → Conversion → Closing; find and fix the slowest machine; business-model-fit filter) → `{SKILL_BASE}/reference/funnel-bottleneck-diagnosis.md`
- **2026 GTM tool stack + 8 sales MCPs for Claude Code** → `{SKILL_BASE}/reference/2026-tool-stack-and-mcps.md`
- **Claude Code GTM architecture** (the 4-layer operating model + 7-gate qualification + feedback loop + API stack — how to run GTM entirely inside one terminal) → `{SKILL_BASE}/reference/claude-code-gtm-architecture.md`
- **GTM Engineer role** (what 1 hire that replaces 5 actually does — 3 pillars, tool stack, hiring criteria, when NOT to hire one) → `{SKILL_BASE}/reference/gtm-engineer-role.md`
- **ColdIQ skills directory** (196 Claude Code skills for GTM, organized by category + GTM-relevance ranking + install commands) → `{SKILL_BASE}/reference/coldiq-skills-directory.md`
- **Swan GTM skills repo** (github.com/swan-gtm/gtm-skills — ~220 skills / 30 authors, MIT; fully imported 2026-07-28: revops + paid-ads + aeo-reddit + content-marketing clusters distilled from it, overlap authors filed as takes in `clusters/_external-takes/swan-*.md`; weekly drift watch via the `swan-radar-collect` scheduled task)
- **Case studies + benchmarks** (real published results from ColdIQ/Workflows.io/Earleads/Trigify campaigns — AirOps $3M, Aircall 3,655 accounts, Hemlane 5.5% reply rate, Workflows.io 25.4% — defensible numbers to cite) → `{SKILL_BASE}/reference/case-studies-and-benchmarks.md`
- **Visual library** (18 agent-readable Mermaid workflow diagrams: radial signal taxonomy, GTM flywheel infographic, ABM operating system, signal-class workflows etc.) → `{SKILL_BASE}/visual-library/INDEX.md`
- **lemlist dynamic personalization** (Liquid `{% if %}` conditionals, per-sender personalization, spintax — the rule: NEVER bake a sender-dependent value like a full salutation into the contact; store only sender-independent blocks and resolve the form at send time. Liquid > AI column for deterministic rules) → `{SKILL_BASE}/reference/lemlist-dynamic-personalization.md`
- **Czech declension engine** (ALL CZ/SK declension work — vocatives, gender detection, declining injected job titles. Never regex; engine order: sklonovani-jmen.cz API for commercial production, MorphoDiTa for testing/QA only (models are CC BY-NC-SA non-commercial), LLM per-row for the ambiguous/multi-word tail) → `{SKILL_BASE}/reference/czech-declension-engine.md`

---

## Cross-cluster benchmarks (no file load needed — quick reference)

### Reply rate benchmarks
| Approach | Reply rate |
|---|---|
| Cold (no signal) | 6-8% |
| Single signal | 18-22% |
| Multi-signal (3+) | 35-40% |
| Job change response lift | 3x baseline |
| Website visitor signal | 25-30% |
| Multi-channel ABM meeting rate | 36% |

### Signal heat tiers + SLA
| Score | Heat | Action | SLA |
|---|---|---|---|
| 150+ | 🔥 Red Hot | AE manual outreach | < 1 hour |
| 100-149 | Hot | SDR personalized sequence | < 24 hours |
| 50-99 | Warm | Automated nurture + SDR monitoring | < 72 hours |
| 20-49 | Cool | Marketing nurture | This week |
| 0-19 | Cold | Monitor for signal changes | Ongoing |

### Lead scoring tiers (max 100)
| Score | Tier | Action |
|---|---|---|
| 70-100 | 1 | Priority sequence + manual review, send within 48h |
| 40-69 | 2 | Standard sequence, send within 1 week |
| < 40 | 3 | Hold or discard |

### Campaign performance tiers (interest rate)
| Interest rate | Tier | Action |
|---|---|---|
| > 30% | 1 — Scale | Add LinkedIn, increase volume, expand list |
| 17-30% | 2 — Optimize | Tweak copy / subject / CTA, don't kill |
| < 17% | Kill | Pause, document failure mode, don't restart same hypothesis |

### Deliverability hard limits
- 30 emails/day max per new mailbox; 50 ceiling for established
- 3-5 outreach domains (NEVER cold from main domain)
- 14-day warmup minimum before first cold send
- Bounce rate < 2% (above this, sender reputation drops fast)
- Email decay: 22-30% annual = re-verify lists older than 30 days
- Cold sending Mon-Thu only

### Stress test pass threshold
- Every step ≥ 8.1/10 across 5 dimensions (catchy / engaging / logical / easy to read / points to problem)
- Below 8.1 = do not launch

---

## Sequencing tool quick reference

| Tool | Best for |
|---|---|
| SmartLead | High volume, AI warmup |
| Instantly | Ease of use, good deliverability |
| Lemlist | Multi-channel, images |
| Apollo | All-in-one (data + sending) |
| HeyReach | LinkedIn automation |
| PlusVibe | EU-friendly, MCP support |

For deep tool comparison → `{SKILL_BASE}/clusters/cold-email/reference/sequencing-tools.md`

---

## Decision tree

```
GTM request
├─ Strategy / planning?
│  ├─ Define ICP            → clusters/icp/tasks/build-icp.md
│  ├─ Map TAM               → clusters/campaign-ops/tasks/map-tam.md
│  ├─ Build hypotheses      → clusters/campaign-ops/tasks/build-hypothesis-matrix.md
│  ├─ Build personas        → clusters/personas/tasks/build-persona.md
│  ├─ Map signals           → clusters/signals/tasks/map-signals-to-icp.md
│  └─ Set up second brain   → clusters/campaign-ops/tasks/setup-second-brain.md
│
├─ List + enrichment?
│  ├─ Build list end-to-end → clusters/list-building/tasks/build-prospect-list.md
│  ├─ Validate / dedupe     → clusters/list-building/tasks/validate-and-cleanup.md
│  ├─ Build Clay workflow   → clusters/enrichment/tasks/build-clay-workflow.md
│  ├─ Clay table arch.      → clusters/enrichment/tasks/build-table-architecture.md
│  ├─ Sending Gate column   → clusters/enrichment/tasks/design-sending-gate.md
│  ├─ Push to Instantly/HR  → clusters/enrichment/tasks/push-to-sequencer.md
│  ├─ Find emails           → clusters/enrichment/tasks/run-email-waterfall.md
│  ├─ Validate against ICP  → clusters/icp/tasks/validate-against-icp.md
│  ├─ Detect signals        → clusters/signals/tasks/detect-signals-from-list.md
│  ├─ Score signals         → clusters/signals/tasks/score-multi-signal.md
│  └─ Score & prioritize    → clusters/lead-scoring/tasks/score-and-prioritize.md
│
├─ Copy + sequences?
│  ├─ Email Step 1          → clusters/cold-email/tasks/write-first-email.md
│  ├─ Email follow-ups      → clusters/cold-email/tasks/write-followup.md
│  ├─ Subject lines         → clusters/cold-email/tasks/write-subject-lines.md
│  ├─ PS lines              → clusters/cold-email/tasks/write-ps-line.md
│  ├─ Re-engagement         → clusters/cold-email/tasks/re-engage-cold-leads.md
│  ├─ LinkedIn sequence     → clusters/sequences/tasks/write-linkedin-sequence.md
│  ├─ Multi-channel design  → clusters/sequences/tasks/design-multi-channel.md
│  ├─ Personalize at scale  → clusters/cold-email/tasks/personalize-at-scale.md
│  └─ Optimize CTA          → clusters/campaign-ops/tasks/optimize-cta.md
│
├─ QA + launch?
│  ├─ Stress-test sequence  → clusters/cold-email/tasks/stress-test-sequence.md
│  ├─ Add spintax           → clusters/cold-email/tasks/add-spintax.md
│  ├─ Audit deliverability  → clusters/campaign-ops/tasks/audit-deliverability.md
│  ├─ Audit LinkedIn profile→ clusters/campaign-ops/tasks/audit-linkedin-profile.md
│  ├─ Name campaigns        → clusters/campaign-ops/tasks/name-campaigns.md
│  └─ Set up platform       → clusters/campaign-ops/tasks/setup-campaign-platform.md
│
├─ Inbox + replies?
│  ├─ Analyze replies       → clusters/campaign-ops/tasks/analyze-replies.md
│  ├─ Score meeting intent  → clusters/campaign-ops/tasks/score-meeting-intent.md
│  └─ Handle objection      → clusters/objections/tasks/handle-objection.md
│
├─ RevOps / revenue system?
│  ├─ Diagnose revenue system → clusters/revops/tasks/run-revops-diagnostic.md
│  ├─ Plan CRM migration      → clusters/revops/tasks/plan-crm-migration.md
│  └─ Forecast / pipeline / routing / cadence / planning → clusters/revops/knowledge/ (see cluster section)
│
├─ Paid ads?
│  ├─ Plan ABM ads campaign   → clusters/paid-ads/tasks/plan-abm-ads-campaign.md
│  ├─ Audit ads account       → clusters/paid-ads/tasks/audit-ads-account.md
│  ├─ Monthly ads report      → clusters/paid-ads/tasks/monthly-ads-report.md
│  └─ Ad engagement → outbound → clusters/paid-ads/knowledge/ads-outbound-interplay.md
│
├─ AEO / Reddit?
│  ├─ AEO audit               → clusters/aeo-reddit/tasks/run-aeo-audit.md
│  ├─ Research subreddits     → clusters/aeo-reddit/tasks/research-subreddits.md
│  └─ Launch Reddit campaign  → clusters/aeo-reddit/tasks/launch-reddit-campaign.md
│
├─ Content marketing?
│  ├─ Launch newsletter       → clusters/content-marketing/tasks/launch-newsletter.md
│  ├─ SEO topic research      → clusters/content-marketing/tasks/run-seo-topic-research.md
│  └─ Creator campaign / sponsored post → clusters/content-marketing/tasks/launch-creator-campaign.md
│
└─ Performance / ops?
   ├─ Tier campaigns        → clusters/campaign-ops/tasks/tier-campaigns.md
   ├─ Enable sales (box)    → clusters/campaign-ops/tasks/enable-sales.md
   ├─ A/B test analysis     → clusters/campaign-ops/tasks/run-ab-test.md
   └─ Weekly report         → clusters/campaign-ops/tasks/weekly-report.md
```

## Examples

**Example 1: "Build me a list of HubSpot agencies hiring SDRs and write the cold email"**
→ Multi-task workflow:
1. `clusters/icp/tasks/build-icp.md` (if no ICP defined)
2. `clusters/signals/tasks/map-signals-to-icp.md` (confirm "hiring SDRs" is a tracked signal)
3. `clusters/list-building/tasks/build-prospect-list.md` (build the list)
4. `clusters/signals/tasks/detect-signals-from-list.md` (filter for hiring signal active)
5. `clusters/lead-scoring/tasks/score-and-prioritize.md` (rank)
6. `clusters/cold-email/tasks/write-first-email.md` (write Step 1 with signal-led copy)

**Example 2: "Score this reply"**
→ Single task: `clusters/campaign-ops/tasks/score-meeting-intent.md`. If reply is an objection, branch to `clusters/objections/tasks/handle-objection.md`.

**Example 3: "Why are my open rates dropping?"**
→ Diagnostic. Check inline deliverability rules. If subject lines look fine, run `clusters/campaign-ops/tasks/audit-deliverability.md`. Likely root causes: blacklist hit, warmup paused, send volume spike.

**Example 4: "Write a LinkedIn sequence"**
→ Single task: `clusters/sequences/tasks/write-linkedin-sequence.md`. Recommend running `clusters/campaign-ops/tasks/audit-linkedin-profile.md` first if you haven't lately.

**Example 5: "Stress-test this sequence"**
→ Single task: `clusters/cold-email/tasks/stress-test-sequence.md`. Apply 5-dimension rubric, return per-step scores, flag any below 8.1.

**Example 6: "How do I personalize 500 emails using Clay?"**
→ Single task: `clusters/cold-email/tasks/personalize-at-scale.md`. Outputs prompt + 5-lead sample + quality gate.

**Example 7: "Build me a Clay workflow from this CSV of 500 SaaS domains into Instantly"**
→ Multi-task workflow:
1. `clusters/enrichment/tasks/build-clay-workflow.md` (orchestrates discovery → list-building → qualification → table architecture → enrichment → export)
2. `clusters/enrichment/tasks/build-table-architecture.md` (Table A/B + segment split decisions)
3. `clusters/enrichment/tasks/run-email-waterfall.md` (email step within phase 05)
4. `clusters/enrichment/tasks/design-sending-gate.md` (Ready to Send formula column)
5. `clusters/enrichment/tasks/push-to-sequencer.md` (Instantly Add Lead step gated on Ready to Send = TRUE)
6. Optional: `clusters/cold-email/tasks/write-first-email.md` if copy isn't already written
