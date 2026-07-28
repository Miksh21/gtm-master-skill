# Task: Run SEO Topic Research (7-Phase Pipeline → Tiered Content Roadmap)

> Source: swan-gtm/gtm-skills (sam-dunning) · MIT · imported 2026-07-28 · external content, unreviewed

Recipe for producing a prioritized, SERP-qualified, commercially filtered content roadmap for a B2B/SaaS domain, ready for briefing. The full method with all tables lives in the knowledge file; this is the execution order.

## When to use this

User asks for topic research, keyword research, an SEO content plan, "what should we publish to rank", AEO/AI-search visibility, or organic pipeline. Also for auditing an existing content plan (run phases 4-7 over it). Individual phases run standalone when the user has partial inputs (e.g. "qualify these keywords" = phase 4 only; "which of these are worth it" = phase 5).

## Inputs required

Ask all at once before starting:

1. **Domain** and the primary commercial goal ("rank for competitor alternatives in enterprise manufacturing", not "more traffic")
2. **Sales call transcripts or recordings** (pull via a connected call-recording MCP, or pasted). The richest input; say explicitly if none
3. **Other materials**: onboarding form, client comms, named competitor list, content inventory or sitemap, positioning docs, stated ICP exclusions
4. **Tool access**: Ahrefs (or equivalent) is required for volumes/KD/SERP data; GSC/CMS/analytics MCPs if connected
5. **Output path** for the final plan (default `./topic-plan-[domain]-[date].md`)

## Principles (non-negotiable)

- **Never skip Phase 1**, and checkpoint with the user after Phases 1 and 2 before spending tool calls
- **Ahrefs validates, it never dictates**: opportunities come from account intelligence; volume confirms demand
- **Never invent volume, KD, or product facts**; every number from a real tool call, every product fact from the live site or provided materials
- **Kill freely** in SERP qualification; a short qualified list beats a bloated one
- **Pipeline over traffic**: a keyword that fails the ICP test dies regardless of volume
- **Client exclusions override scoring**; note commercially significant trade-offs explicitly

## Process

1. **Phase 1, account intelligence.** Fetch homepage + key pages (features, pricing, solutions, customers, integrations, blog) in parallel; pull site metrics, top pages, top rankings, organic competitors; process transcripts and materials. Print the Account Intelligence Document (what they sell, commercial priorities, ICP current-vs-desired, commercial features, competitor landscape with context, objections, what works, what to avoid, authority numbers, gaps). **Wait for confirmation.**
2. **Phase 2, opportunity extraction.** Scan for all signal types (competitor, objection, feature, use-case, industry, pain/JTBD, listicle, wildcard, winner-expansion). Per opportunity: name, type, the specific signal, one-line purpose, commercial value, likely formats. Assign High/Medium/Low (High = stated priority AND named signal). **Wait for confirmation.**
3. **Phase 3, keyword validation.** Per opportunity (High first): matching terms (2-3 seeds from the type's seed-pattern table), related terms, direct overview, competitor organic keywords where relevant. Apply volume/intent filters (≥50/mo general, ≥20/mo named-competitor money terms; exclude navigational, too-broad, already-ranking 1-5). Hit the **100-keyword floor** before proceeding. Print the pool segmented: Landing Pages / Competitor Based / Best Of Listicles / Competitor vs Competitor / Pain Point Based, as tables with volume, KD, intent, notes.
4. **Phase 4, SERP qualification.** Per keyword: SERP overview + live search + selective top-2 fetch. Answer the six questions (intent consistency, rewarded format, category fit, realistic competitiveness with evidence, producible format, freshness). Verdict QUALIFY / CONDITIONAL (with the named condition) / KILL. Print counts, top 10, common kill reasons, full verdict list.
5. **Phase 5, business fit filter.** Five gates on every survivor: pipeline-not-traffic, ICP match (≥2 dimensions), honest product fit, client alignment (cross-check "avoid" list), NEW/UPDATE/CANNIBALIZES-RESOLVE against inventory and rankings. Print pass list, and the cut list with one-line fail reasons.
6. **Phase 6, topic shaping.** Assign format per topic from the format table, letting the SERP lead. Record: format + reason, the rejected tempting alternative, hybrid element, cluster grouping (primary + secondaries), architecture flags (new URL patterns, pillar structures, marketing-site vs blog, batch dependencies).
7. **Phase 7, prioritization.** Score six dimensions 1-3 (commercial intent, ICP alignment, ranking feasibility, effort inverted, authority leverage, adjacency). Tier 1 ≥ 14 / Tier 2 10-13 / Tier 3 ≤ 9. Sequence Tier 1: quick wins → highest commercial intent → cluster batches → long bets; client preferences override with the trade-off named.
8. **Compile and save** the full report (all phase outputs + methodology notes: data sources, dates, guardrails applied), then print the Prioritized Topic Plan inline as tiered tables (Topic/Keyword, Format, Vol, KD, Score, New/Update, Notes) so the user reads it without opening the file.

## Output format

```
Topic plan saved to [path]: [N] topics. Tier 1: [N] | Tier 2: [N] | Tier 3: [N]

### Tier 1: Build First (Score ≥ 14)
| # | Topic / Primary Keyword | Format | Vol | KD | Score | New/Update | Notes |
(then Tier 2, Tier 3, sequencing notes, scoring notes)
```

## Pass criteria

- Phases 1 and 2 were user-confirmed before any keyword calls
- Every volume/KD figure traces to a tool call; every opportunity traces to a named signal
- ≥100 candidates entered Phase 4; a visible share got KILLED there
- The cut list exists with per-keyword fail reasons
- Every Tier 1 topic has a format, a score breakdown, and a sequencing position
- The plan would make the client say "yes, these are our buyers" (no generic category keywords)

## Common failures

- **Skipping account context and starting in the keyword tool**: produces a plan any competitor could have
- **Passing everything through SERP qualification**: if the kill rate is ~0, the check wasn't real; "beatable" needs evidence, not optimism
- **Volume worship**: a 200/mo alternatives page belongs above a 5,000/mo top-of-funnel keyword
- **Cannibalization treated as a kill**: it's a routing decision to an update brief
- **Formats chosen by preference, not SERP**: if Google rewards listicles, don't fight it with a landing page
- **Blog-only shaping**: LPs, feature, and pricing pages belong on the marketing site; flag architecture early

## What to do after

- Write briefs top-of-Tier-1 first; carry each topic's SERP format notes and cluster grouping into its brief
- Re-run Phase 4 on Tier 2 topics just before building them (SERPs move)
- Revisit the whole plan quarterly or when the client's commercial priorities shift

## Deeper knowledge (load only when needed)

- Full method, all tables (seed patterns, six SERP questions, five gates, format guide, scoring rubric) → `clusters/content-marketing/knowledge/seo-topic-pipeline.md`
- Thresholds quick sheet → `clusters/content-marketing/reference/benchmarks.md`
