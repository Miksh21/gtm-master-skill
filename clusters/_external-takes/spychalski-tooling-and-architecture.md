# External takes — tooling & architecture (Patrick Spychalski video, UNREVIEWED)

> NOT a cluster take. This digest targets the top-level `reference/` docs, so the cluster-walk at
> `/creator-radar-review` will not pick it up automatically — promote it by hand into the target files
> named below. Kept here so its provenance and shelf-life live with the other Spychalski takes.

## GTM Engineering in 2026 — A Complete Walkthrough — youtu.be/3jIhI-joTMc · filed 2026-09-03
Source: https://youtu.be/3jIhI-joTMc (Patrick Spychalski, co-founder The Kiln; ex-Clay early employee)
Targets: reference/2026-tool-stack-and-mcps.md · reference/claude-code-gtm-architecture.md · reference/gtm-engineer-role.md
Shelf-life (stated by author): "only alpha for the next 4-8 months past September 2026" → re-verify by 2027-03. The author opens the video saying the tool verdicts specifically decay fastest; treat everything below as a dated snapshot.

### → reference/2026-tool-stack-and-mcps.md (tool verdicts, Sept 2026)
- 🆕 Claude / Claude Code — highest stay-power tool in GTM; agentic CLIs "not going anywhere." Anchor of the stack.
- 🆕 Clay — orchestration layer with infra you'd otherwise rebuild (concurrency at 100k+ rows, audiences, functions, native AI models, 100+ provider marketplace, MCP into Claude). Pricing is complex (action vs data credits) — scope the build before buying; use a credit calculator.
- 🆕 Deepline — "Clay's data marketplace as an MCP"; data backend for Claude-built workflows, strong waterfall coverage.
- 🆕 Blitz API — ~$500/mo unlimited LinkedIn data, quality on par with 5-6-figure SaaS data plans.
- 🆕 Serper (Google/Maps scraper), RB2B (website deanon), Store Leads (ecom DB), ZeroBounce (email validation).
- 🆕 Instantly / Smartlead — best automated-outbound send layer (warmup, provider matching, OOO + reply handling). Outreach / Salesloft / Apollo — send layer for human-in-the-loop rep motions. lemlist — favorite multichannel sequencer, with a LinkedIn-ban caveat.
- 🆕 CRMs are NOT being replaced by AI: Salesforce (enterprise depth, now ClaudeForce/Anthropic tie-up), Attio (most AI-forward, missing enterprise features), HubSpot (the in-between; The Kiln uses it). Good MCPs across all three.
- 🆕 Honorable mentions: Railway (host Claude-built projects that must run when the laptop is closed, e.g. auto pre-meeting prep), Centreion (job-signals, historical), n8n (complex actions outside Clay's purview, good MCP), Gong (enterprise sales intel), Fathom / Granola (note-takers; Granola is invisible-in-call, summary-only), Gamma (now mainly useful as a slide-deck API), Snowflake / BigQuery / Databricks (warehouses for product data). Asset generation: Claude Design (lowest effort, but a recognizable "AI design language"), a custom Claude skill + design MCPs (Hyperframes free for GIFs/short video, Higgsfield for images→full video, Recraft) for human-looking assets; Canva/Higgsfield/Recraft UIs for one-offs.
- Cut criteria the video implies match the file's existing rule set (not opened weekly → cut; a Claude skill+MCP replaces it → cut the standalone; no line to revenue → cut).

### → reference/claude-code-gtm-architecture.md (operating model)
- 🆕 **The plugin-for-the-sales-team pattern is the headline architectural take.** Don't leave each rep to build their own skills. On a Claude team plan, ship ONE plugin (a curated set of GTM skills: proposal drafting, pre-meeting prep, follow-up, CRM update, asset generation) controlled by someone who understands systems; a setup skill walks each rep through connecting their own MCPs. This is his "best current module for Claude in GTM."
- 🆕 **Every system has the same shape; only the reasoning layer is new.** Source → enrich/orchestrate → **reason (LLM inference over the aggregated data)** → output. The reasoning layer is the only structural change vs pre-LLM workflows and the reason systems became scalable.
- 🆕 The five build tenets: (1) build/buy for rapid tool+model churn — avoid 1-2yr contracts for features a model will absorb in months; (2) systems must be simple + spoon-fed to the end user or adoption dies ("builder syndrome"); (3) cutting-edge systems trend fully agentic (no point-and-click); (4) data quality still gates everything (waterfalls, coverage); (5) every system needs a direct line to closed-won — practice intense discernment on tool→revenue claims (worked skeptic example: AI SDRs look great in theory, disappoint in practice on data source + copy nuance).
- 🆕 Same-architecture skills the video specs out: pre-meeting prep (call-recorder + Slack + email MCPs + enrichment; host on Railway for auto-run), post-meeting CRM update (agent + human-in-loop button in Slack/Teams), proposal drafting (train on past proposals + Google Docs MCP), ABM asset generation (per-asset-type skills → team plugin).
- ⚠️ **Claude-Code-vs-Clay is not winner-take-all** (contradicts the "Claude Code replaces Clay" LinkedIn take, and tempers this file's run-everything-in-one-terminal framing). Split by job: Clay wins CRM (deterministic field-mapped pushes, run inspection, compliance) + a few moat providers (e.g. HD tech-stack) + native Clay AI models; Claude Code wins cheap flexible list-building / outbound / bespoke workflows and connects to everything (can mimic Clay's UI via Supabase + Google Sheets). Author discloses ex-Clay bias. (CRM-side companion: spychalski-revops.md.)

### → reference/gtm-engineer-role.md (where the role goes)
- 🆕 The GTM engineer's future job = **orchestrator of agents + tastemaker.** Agents will build, test, run, analyze and re-optimize workflows (incl., eventually, copy); the human edge is taste/discernment + prompting-as-craft. "So many companies will just become an MCP." Enterprise lags but trends the same way. Learning Claude Code / CLI tools framed as a must for anyone serious about modern GTM.
Review: contradicts
Status: holding
