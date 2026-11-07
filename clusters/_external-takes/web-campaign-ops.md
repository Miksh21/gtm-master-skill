# External takes — campaign-ops (Web radar, UNREVIEWED)

## Automated Outbound Reply Management System — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/automated-outbound-reply-management-system (2026-09-04) · cluster: campaign-ops
- ✅ supports [campaign-ops/tasks/analyze-replies.md:15]: reply categories including out of office.
- 🆕 new-angle: production pipeline: Instantly and HeyReach webhooks → n8n single intake → Supabase + Clay → BetterContact waterfall (20+ providers) and People Data Labs for phones → LLM strips HTML, signatures, footers and irrelevant URLs → classify into interested / neutral / not interested / out of office.
- 🆕 new-angle: out-of-office replies auto re-enrolled into the sending campaign; sentiment tags written back into Instantly and HeyReach; prompt revised if classification error exceeds 5%.
- 🆕 new-angle: Slack card per reply with one-click buttons (LinkedIn profile, company page, website, open conversation in Instantly or HeyReach, CRM record, mark sentiment as wrong); channel picked via an Airtable lookup.
Review: additive
Status: holding

## Inbound Orchestration (2026-09 rewrite) — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/inbound-orchestration (2026-09-15) · cluster: campaign-ops
- ✅ supports [campaign-ops/knowledge/inbound-orchestration.md:34]: approved leads get a pre-frame sequence.
- 🆕 new-angle: pre-frame specified as 6 emails over 3 days, plus newsletter enrolment (Beehiiv), HeyReach connection request and ongoing LinkedIn posts in their feed before the call.
- 🆕 new-angle: application form saves partial submissions; qualified sees Cal.com immediately, partial or unqualified triggers a Slack review; post-meeting Ergo writes notes, drafts the follow-up, updates stage and properties; Qwilr auto-generates proposals.
Review: additive
Status: holding

## GTM Stack Architecture: the 3-layer model — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/blog/gtm-stack-architecture-in-2026-the-3-layer-model (2026-08-07, Pari Tomar) · cluster: campaign-ops
- 🆕 new-angle: classify tools by job, not category: data layer (company DB, contact DB, enrichment, data infra), execution layer (CRM, marketing automation, sequencers, dialers, routing, deal rooms, LinkedIn content and ads), intelligence layer (orchestration, visitor ID, scraping, ABM orchestration, attribution, agents); most teams over-invest in execution.
- 🆕 new-angle: rough healthy core ≈ 3 data + 5 execution + 3 intelligence tools; audit quarterly.
- 🆕 new-angle: intelligence-layer test: trace a closed-won deal from the last 90 days back to its first signal; over 10 minutes or impossible = the layer is missing pieces.
Review: additive
Status: holding

## The AI-Native Operations Playbook — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/the-ai-native-operations-playbook (2026-07-28) · cluster: campaign-ops
- 🆕 new-angle: map every process first (people, tools, automations and agents, SOPs) before automating; then 25+ MCPs plus CLIs where no MCP works, each tested before team rollout.
- 🆕 new-angle: SOP → Claude Code skill that gets a task 80%+ done; ~20 core skills inside a 50+ library; root layout CLAUDE.md, /wiki, /clients, /raw-context, /.claude; wiki updated through commits; strict hooks and guardrails; team access through the CLI in Cursor or custom Vercel frontends.
- 🆕 new-angle: humans own strategy, review and every mistake; every deliverable reviewed before it reaches a client.
Review: additive
Status: holding

## SEO-Led Outbound + SEO/AEO Playbook — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/seo-led-outbound (2026-10-23) + https://www.workflows.io/workflows/the-seo-aeo-playbook (2026-09-04) · cluster: campaign-ops
- 🆕 new-angle: keyword order BoFU first (pricing, reviews, brand vs competitor), then MoFU and ToFU to pass authority up; drafts in AirOps, optimisation in Clearscope; track rankings in Google, Bing, ChatGPT, Perplexity, Gemini and AI Overviews.
- 🆕 new-angle: each long-form article becomes 5-10 distribution assets (LinkedIn posts, newsletter sections, carousels, guest articles), and in reverse a LinkedIn post that performs gets expanded into a blog article for search.
- 🆕 new-angle: non-converting visitors de-anonymised (RB2B) and run through either a Clay path or a Claude Code CLI path (CRM lookup, Clay or Firecrawl qualification, BetterContact or Findymail MCP), then tier routing.
Review: additive
Status: holding

## The CRM Cleanup Playbook — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/workflows/the-crm-cleanup-playbook (2026-07-21) · cluster: campaign-ops
- 🆕 new-angle: segment custom fields by fill rate (empty, under 5%, 5-49%, 50%+) and flag legacy migration fields; lock every field feeding sequencing, signals, awareness scoring or attribution on an explicit exclude list before deleting anything.
- 🆕 new-angle: delete 0%-fill and under-5% fields with zero usages, legacy fields under 50% with no workflow dependency; 5-49% case by case (integration filling it? active workflow?).
- 🆕 new-angle: company dedupe: exact domain pairs merged in bulk, primary record = most deals, then most contacts, then highest fill, then oldest; same name with different domain kept separate and linked via parent company when city, address, phone or location-in-domain differ; field-creation governance doc and quarterly audit.
Review: additive
Status: holding

## GTM Engine / 2026 GTM Funnel / GTM Roadmap — workflows.io  ·  filed 2026-11-07
Source: https://www.workflows.io/blog/how-to-build-a-b2b-gtm-engine-in-2026 (2026-07-16) + https://www.workflows.io/workflows/the-2026-gtm-funnel-playbook (2026-07-29) + https://www.workflows.io/workflows/gtm-roadmap-2026 (2026-07-07) · cluster: campaign-ops
- 🆕 new-angle: seven stages (traffic, capture, nurture, data routing, qualification, sales-led conversion, close/retention/expansion); run at least two traffic channels in parallel so one algorithm change cannot take the system down.
- 🆕 new-angle: data routing (stage 4) named the most common break point: leads not syncing to CRM cause missed timing, double touches and broken attribution.
- 🆕 new-angle: after closed-won run four separate pipelines: leads, deals, renewals, expansion; T1 accounts deserve ~10x the effort of T3.
- 🆕 new-angle: flywheel mechanics: engagers from yesterday's post get today's email; best organic post becomes the ad (example: 100k impressions, $5k boost).
Review: additive
Status: holding


## Meeting Prep and Follow-Up (Play 43) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/meeting-prep-and-follow-up · cluster: campaign-ops
- 🆕 new-angle: daily run reads tomorrow's external meetings, matches company and deal with explicit fallbacks (attendee email, contact, deal) stated in the brief; research with an absolute date window, attendee role and tenure, CRM history and past call notes; brief to Slack tagged to the owner, says so when research is thin.
- 🆕 new-angle: transcript webhook, poll until sentences exist, dedupe twice (meeting id and client+title+date, because several recorders create several ids), alert on failed fetches; action items routed to the person who committed; follow-up drafted in Gmail and sent by a human only. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## Automated Reply Enrichment (Play 23) — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/plays/automated-reply-enrichment · cluster: campaign-ops
- ✅ supports [campaign-ops/tasks/analyze-replies.md:15]: categorize every reply.
- 🆕 new-angle: reply webhook (no polling) into Clay, one AI call routes 4 ways (interested, neutral, not interested, OOO), only interested gets paid enrichment (direct phone, firmographics), CRM sync matches email then domain and updates instead of duplicating, Slack alert carries the full profile and links so a rep acts in under a minute. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## Sales Workflow Automation: 8 workflows and 6 mistakes — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/blog/sales-workflow-automation · cluster: campaign-ops
- ✅ supports [campaign-ops/knowledge/sequence-and-system-hygiene.md:50]: one suppression source synced to every sending tool.
- 🆕 new-angle: failure list: overlapping workflows (allow one active sequence per contact, check CRM before enrolling), enrichment overwriting rep-edited fields (fill empty only), quarterly review of live workflows, irrelevant personalization (let the model skip when no relevant detail), alert fatigue (thresholds so an alert means act today, review alert-to-action rate monthly). Build order: map and time today's workflow, one workflow and one segment, define fields before tools, decide where a human reviews, measure against baseline. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding

## Claude Code for GTM: folder brain and campaign feedback loop — frontal.so  ·  filed 2026-11-07
Source: https://frontal.so/blog/claude-code-for-gtm · cluster: campaign-ops
- ✅ supports [campaign-ops/tasks/setup-second-brain.md]: persistent files (brain.md, copy-frameworks.md, scoring-criteria.md) make each campaign build on the last.
- 🆕 new-angle: feedback-loop play: pull sequencer analytics via API plus transcripts of booked meetings, find which messages drove replies and which objections came up, write it back into copy-frameworks.md so the next campaign inherits it. Provenance: Frontal = former ColdIQ Agency (same operators as the coldiq-* holding files), so agreement with coldiq takes is NOT independent corroboration.
Review: additive
Status: holding
