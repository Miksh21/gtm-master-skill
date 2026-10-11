# Creator-Radar Enrichment — 2026 Cost & Architecture Tactics

## When to load
Cutting enrichment cost, building reusable data assets, picking 2026 enrichment tools, ordering email waterfalls, going direct-to-source, normalizing vendor schemas. Triggers: "Clay too expensive", "Claygent alternative", "data cache", "email waterfall order", "direct data vendor", "dbt for GTM data", "2026 enrichment stack".

## Cut Clay/agent cost
- **Route bulk AI enrichment off-Clay.** Clay's 1-action-per-Claygent pricing makes bulk runs expensive — run AI research through a BYOK agent (DiscoLike's Discogen) and pipe only the final data back to Clay for QA/visualization. Keeps Clay's data-provider access, kills per-action agent cost at scale. [#26]
- **Free crawl > paid scrape for simple jobs.** Open-source HTML-to-text + deterministic keyword matching beats paid scraping APIs + LLMs for plain text extraction. Decision rule: *every paid API and every AI call must justify why a free deterministic step couldn't do it first.* [#82]
  - Evidence (2026-10-11): zero-API-cost SMB qualification and owner extraction: HTML2Text scrapes the homepage, local Gemma 4 12B via Ollama reads it for ICP fit or owner name, OpenWebNinja only as fallback. Fits local SMBs absent from LinkedIn databases. [#320]
- **browser-fetch (Browser Use)** converts any URL → markdown/JSON for free, bypasses JS/Cloudflare/bot walls via built-in proxies, no rate limits — removes the main web-scraping friction for prospect research and Clay enrichment. [#83]

## Reusable data asset (cache once, pull forever)
- **Build an internal enrichment cache.** A 15M-company Supabase + TypeSense store (~$200 of credits to build) makes repeat/overlapping list pulls cost $0 vs re-enriching. Turns prior enrichment spend into a permanent queryable asset across clients/campaigns. [#76]
- **dbt modeling layer early.** Normalize disparate vendor schemas into standard company/person/event tables with dedup + primary-key enforcement. Without it you're using scheduled ETL as a hammer for everything; dbt enforces schema contracts and keeps pipelines maintainable at scale. [#189]

## Email waterfall order
- **Stack:** QuickEnrich → BlitzAPI → Prospeo → Icypeas → SIGNALIZ → Smartlead, all gated by LeadMagic validation. Ordering rationale per layer = speed, then credit efficiency, then hard-to-find coverage. Concrete template to replicate/benchmark. [#78]
- **Double-layer verification (e.g. LeadMagic then Bounceban):** when choosing a validator, prefer the one that passes fewer emails; stricter criteria mean the passed set bounces less. [#1630]

## Go direct to source
- **Skip reseller margin for non-email data.** For professional-network/company data go direct to upstream vendors — CoreSignal, MixRank, Metrix, PDL/5x5. Original sources have better APIs, higher rate limits, substantially lower cost; resellers add margin without always adding quality on raw LinkedIn/company data. [#191]

## 2026 tool intel
- **Octave GTM intelligence layer** auto-pushes ICP/messaging/intent context (call transcripts, competitor positioning, intent) into every downstream GTM system, solving the gated-knowledge problem and compounding over time. Airbyte 2x'd SDR email-to-meeting rate using it. [#158]
- **2026 category winners (lesser-known):** Sumble (dept-level technographics), AI Ark (verified stakeholder maps / contacts), DiscoLike (companies with no LinkedIn presence), BetterContact (phone). Genuine new options vs commonly-cited incumbents. [#27]
- **Clay CLI for coding agents (2026-10):** Claude Code / Codex can drive Clay directly. Bootstrap: have the agent read your recent tables, infer your build decisions (providers, models, prompts) and save them as a rulebook skill it follows on new builds. [#312]
- **BlitzAPI unlimited people enrichment** now includes full past work history, so historical-employer overlays (customer alumni, ex-competitor staff) become affordable across a whole TAM instead of sampled lists. [#1495]

## Data-as-product / pricing
- **"Selling sawdust" cross-subsidy:** monetize one data asset across 3 business lines and sell contact data at near-free ($27/mo unlimited) as a *distribution* strategy. Cross-subsidized pricing undercuts category incumbents; founder brand + UGC is the real moat. Repeatable architecture for data-adjacent products. [#110]
- **Rebuild-and-undercut data products:** use AI to identify expensive SaaS data incumbents, recreate the dataset with open/cheap tools (Claude Code + open scrapers), and sell at ~10% of incumbent price. Dual-monetization (sell the dataset + sell the how-to content) compounds into a moat. [#104]

## Agent research & classifier hygiene
- **Route per row: research, classify, then write.** Claygent researches, a cheap typed classifier (Jev) decides, the LLM writes only for rows that cleared the threshold. Paid enrichment and copy never run on rows that would be filtered anyway. [#1671]
- **Jev (TypeSafe) typed classifier:** $0.042 per M input tokens, 70-500ms, returns a confidence; a 586-page linking job cost $0.21 vs $1.43 on Opus 5 but declined 139 pages. Callable from a Clay HTTP API column. [#1977]
- **Classifier hygiene** (backs expert-tips-eric-noski.md Rule 3 "purple" fallback + Rule 4 examples): always include an unclear option, keep state short, test 50 rows and hand-label 20, fix criteria before adding context. If the right answer lands second at ~0.35, criteria overlap; more context often lowers accuracy. [#1673]
- **Evidence packs:** compile each person's profile and posts once (code sets still-at-company and role flags, buyer rules from calls, no name or photo), then ask several probability questions per call against the pack. [#1690]
- **Quote contract** (backs swan-enrichment.md "every claim cites its source inline"): the judge must copy one sentence from the source; a script checks it is an exact substring; on failure the field ships blank. Fabricated evidence cannot pass downstream. [#1847]
- **Re-ask narrower before trusting an empty answer:** naming the document types found sources for 783 of 1,728 apparent dead ends for $9.40. Much "nothing found" is the query's fault. [#1902]
- **Agent finds, code verifies:** pay the agent to find where data lives, use free code to verify what it is; agent labels matched byte-level checks only 70.5% of the time. [#1903]

## Creator-radar 2026-10-11
- **No-tools staleness check:** open 20 profiles and read the dated current role, not the stored job title. A role entry is a maintained dated record; a CRM title was typed once and hides buyers. [#1916]
- **PLG signups on GitHub or personal email:** resolve the account by the majority email domain across all workspace members, not by direct CRM field match. [#1301]

## Source
creator-radar 2026-06; card ids in [#26 #82 #83 #76 #189 #78 #191 #158 #27 #110 #104].
creator-radar review 2026-10-11, cards from Supabase insight_cards: [#320 #1630 #312 #1495 #1671 #1977 #1673 #1690 #1847 #1902 #1903 #1916 #1301].
