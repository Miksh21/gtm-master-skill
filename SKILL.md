---
name: gtm-master
description: Master GTM / B2B outbound knowledge base. Single source of truth for GTM philosophy + fundamentals (BIPSY framework, scale-top-performers, signal-based outreach economics, multi-channel coordination, channel/timing mindsets), cold email writing, follow-ups, subject lines, PS lines, sequence QA (stress-testing), spintax, personalization at scale, re-engagement, deliverability, email infrastructure (SPF/DKIM/DMARC, warmup), buying signals (intent data, signal scoring, multi-signal stacking, RB2B/Trigify/Common Room/Bombora/Koala/Warmly), list building (Sales Navigator, boolean search, ICP, account qualification, ABM), end-to-end Clay workflow building (qualification, table architecture, contact finding, email/phone waterfalls, Sending Gate, push to sequencer/CRM), Clay enrichment (Claygent, Clayscript, credit optimization, formula columns, table mechanics), Clay providers (Clay Find Companies, Apify, BuiltWith, Sumble, Crunchbase, SEMrush, HTTP API, Enrich Person, Professional Posts), Clay sequencer push (Instantly, HeyReach), Clay CRM push (HubSpot, Salesforce, Google Sheets), ICP definition + validation, buyer persona development, lead scoring + prioritization, sales objection handling, multi-channel sequence design (email + LinkedIn), LinkedIn outreach sequences, hypothesis matrices, TAM mapping, campaign tiering, A/B testing, weekly campaign reports, campaign naming, campaign platform setup (Instantly/PlusVibe/Smartlead), LinkedIn profile audit, CTA optimization, reply analysis, meeting intent scoring, second-brain setup, sales team training and diagnosis. Use for ANY GTM, outbound, sales engineering, RevOps, or B2B sales work. Triggers on "GTM philosophy", "GTM fundamentals", "BIPSY", "diagnose sales team", "train SDRs", "multi-channel coordination", "cold email", "outbound", "GTM", "buying signals", "intent data", "Clay", "Clay workflow", "Sending Gate", "Clay table architecture", "Clay Find Companies", "Apify", "BuiltWith", "Sumble", "Crunchbase", "SEMrush", "HeyReach", "ICP", "persona", "lead scoring", "list building", "Sales Navigator", "follow-up", "subject line", "deliverability", "warmup", "SPF/DKIM/DMARC", "Instantly", "Smartlead", "Lemlist", "Apollo", "PlusVibe", "RB2B", "Trigify", "Common Room", "Bombora", "objection", "sequence", "LinkedIn outreach", "hypothesis matrix", "TAM", "A/B test", "campaign report", "second brain". Do NOT use for marketing emails/newsletters, organic LinkedIn content (use linkedin-content skill), LinkedIn paid ads (use linkedin-ads skill), or executive comms framing (use game-pyramid skill).
---

## Setup (Run Once Per Session)

Before loading any cluster file, locate this skill's install directory:
1. Use Glob to search for `**/gtm-master/SKILL.md`
2. The directory containing this SKILL.md is `SKILL_BASE`
3. Cluster paths follow: `{SKILL_BASE}/clusters/<cluster-name>/{tasks,knowledge,reference}/...`

Always resolve SKILL_BASE dynamically — never hardcode.

# GTM Master — Single Entry Point for All Outbound Work

Master router for B2B GTM/outbound work. Knowledge is split into **10 clusters**, each with `tasks/` (runnable recipes), `knowledge/` (deep references — lazy-loaded), and `reference/` (quick lookups).

## How to use this skill

1. **Identify the user's intent** — match it to ONE of the 10 clusters via the cluster index below
2. **Match intent to a task** — each cluster has a task routing table; load the matching `tasks/<x>.md` file
3. **Tasks are self-contained** — they include inputs, process, output format, pass criteria. They reference `knowledge/` only when depth is needed.
4. **Multi-cluster workflows** chain tasks — typical chain: `icp/build-icp` → `signals/map-signals-to-icp` → `list-building/build-prospect-list` → `enrichment/run-email-waterfall` → `lead-scoring/score-and-prioritize` → `cold-email/write-first-email` → `cold-email/stress-test-sequence` → `campaign-ops/setup-campaign-platform`

## The 10 clusters — index

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

Knowledge index: 13 named copywriting frameworks, ATL/BTL messaging, ColdIQ playbook, e-commerce playbook, sequence theory, deliverability deep guide, email infra (3 files), personalization prompt library, campaign playbooks, email template library. See `{SKILL_BASE}/clusters/cold-email/SKILL_INDEX.md` for full knowledge map (or browse the directory).

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

## Top-level references

- **GTM philosophy** (BIPSY, multi-channel coordination, mindsets, benchmarks) → `{SKILL_BASE}/philosophy.md`
- **Funnel bottleneck diagnosis** (the 4-machine factory model — Demand Gen → Capture → Conversion → Closing; find and fix the slowest machine; business-model-fit filter) → `{SKILL_BASE}/reference/funnel-bottleneck-diagnosis.md`
- **2026 GTM tool stack + 8 sales MCPs for Claude Code** → `{SKILL_BASE}/reference/2026-tool-stack-and-mcps.md`
- **Claude Code GTM architecture** (the 4-layer operating model + 7-gate qualification + feedback loop + API stack — how to run GTM entirely inside one terminal) → `{SKILL_BASE}/reference/claude-code-gtm-architecture.md`
- **GTM Engineer role** (what 1 hire that replaces 5 actually does — 3 pillars, tool stack, hiring criteria, when NOT to hire one) → `{SKILL_BASE}/reference/gtm-engineer-role.md`
- **ColdIQ skills directory** (196 Claude Code skills for GTM, organized by category + GTM-relevance ranking + install commands) → `{SKILL_BASE}/reference/coldiq-skills-directory.md`
- **Case studies + benchmarks** (real published results from ColdIQ/Workflows.io/Earleads/Trigify campaigns — AirOps $3M, Aircall 3,655 accounts, Hemlane 5.5% reply rate, Workflows.io 25.4% — defensible numbers to cite) → `{SKILL_BASE}/reference/case-studies-and-benchmarks.md`
- **Visual library** (18 agent-readable Mermaid workflow diagrams: radial signal taxonomy, GTM flywheel infographic, ABM operating system, signal-class workflows etc.) → `{SKILL_BASE}/visual-library/INDEX.md`
- **lemlist dynamic personalization** (Liquid `{% if %}` conditionals, per-sender personalization, spintax — the rule: NEVER bake a sender-dependent value like a full salutation into the contact; store only sender-independent blocks and resolve the form at send time. Liquid > AI column for deterministic rules) → `{SKILL_BASE}/reference/lemlist-dynamic-personalization.md`

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
