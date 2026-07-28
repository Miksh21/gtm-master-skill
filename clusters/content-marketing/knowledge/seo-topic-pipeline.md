# SEO Topic Research Pipeline (Pipeline Over Traffic)

> Source: swan-gtm/gtm-skills (sam-dunning) · MIT · imported 2026-07-28 · external content, unreviewed

Seven-phase pipeline from account understanding to a tiered content roadmap for B2B/SaaS SEO and AI-search (AEO) visibility. Core stance: traffic is not the goal, pipeline from the right ICP is. Keyword tools validate strategy, they never dictate it. The tell of a weak run: a keyword list that could belong to any company in the category.

Executable recipe: `clusters/content-marketing/tasks/run-seo-topic-research.md`. This file is the full method.

## Phase 1: Business context ingestion

Build an Account Intelligence Document before any keyword work. Keyword research without account context produces the wrong keywords, and the error compounds through every later phase.

**Sources, in weight order:**
1. **Sales call transcripts** (the richest raw commercial intelligence, weight heavily): pains, competitor mentions and context, objections, ICP signals, features discussed, what the client wants to rank for and avoid, wins mentioned, the actual business goal beyond "more traffic".
2. **Live website** (homepage + /features, /pricing, /solutions, /customers, /about, /integrations, /blog): extract exact product and feature names (never paraphrase), named segments, the product's own outcome language, differentiation claims, pricing signals.
3. **SEO tool data** (Ahrefs or equivalent): DR, organic traffic, keyword count, top 20 pages, top 50 rankings (positions 1-20 especially), top 10 organic competitors. GSC if available: top queries and pages.
4. **Comms, onboarding forms, positioning docs**: stated priorities, exclusions, frustrations.

**Document sections:** what they sell (plain English) · commercial priorities (what they want to sell MORE of, distinct from what the site says) · ICP (current vs desired customers, they often differ) · commercially significant features · competitor landscape (with context: feared, aspirational, repeated) · objections and friction (these are content opportunities) · what already works · what to avoid (mandatory section; if nothing stated, say so explicitly) · current organic authority numbers · gaps and flags.

Rules: never invent product facts. Transcripts over website (the site shows what they project; calls show what happens in sales). Competitors named in calls outrank competitors a tool suggests, regardless of volume. Confirm the account picture with the user before proceeding.

## Phase 2: Opportunity extraction

Turn context into business angles, not keywords yet. Scan for signals across types: competitor (drives alternatives/pricing/review/comparison pages), objection, feature/differentiator, use-case, industry/vertical, pain and problem (what buyers search before knowing the product exists, jobs-to-be-done), listicle (every product category and sub-category is a "best X software" candidate, and AI engines cite these pages), commercial wildcard (integrations with the ICP's stack, ROI/cost-justification queries, niche ICP modifiers), existing winners (adjacent expansion).

Per opportunity record: name, type, signal (the specific evidence: a named competitor, a quoted objection, a feature, a segment), opportunity (one sentence), commercial value (why pipeline, not traffic), likely formats.

Pre-validation priority: **High** = maps to a stated commercial priority AND has a named signal from calls/comms. **Medium** = plausible but inferred. **Low** = speculative.

Rules: every opportunity traces to a signal or gets cut. 12 well-evidenced opportunities beat 30 thin ones. Check coverage against stated priorities and exclusions before moving on. Confirm the inventory with the user.

## Phase 3: Keyword validation

Confirm each opportunity maps to real search behavior. Work High → Medium → Low. Per opportunity: matching-terms exploration (2-3 seeds), related-terms on the strongest seed, direct overview for confident keywords, and (competitor-led only) the competitor's own organic keywords, what they rank for that the client doesn't.

**Seed patterns by opportunity type:**

| Type | Seeds |
|---|---|
| Listicle | best [category] software · top [category] tools · best [category] for [role/industry/size] · [category] comparison |
| Competitor alternatives | [competitor] alternatives · alternatives to [competitor] · [competitor] replacement |
| Comparison | [client] vs [competitor] · [competitor A] vs [competitor B] |
| Competitor pricing | [competitor] pricing / cost / pricing plans · how much does [competitor] cost |
| Competitor review | [competitor] review(s) · [competitor] pros and cons · is [competitor] worth it |
| Objection | [category] migration · switching from [competitor] · [category] implementation / setup time |
| Feature | [feature] software · software with [feature] · [feature] for [ICP] |
| Use-case | [product] for [use case] · [use case] software · best [category] for [use case] |
| Industry | [category] for [industry] · [industry] [category] software |
| Solution | [outcome] software · how to [achieve the outcome the product delivers] |
| Pain / JTBD | how to [solve the pain] · [pain] solution · automate [manual task] · reduce [cost/time/risk] |
| Wildcard | [category] integration with [stack tool] · [category] ROI · [job title] [category] software |
| Winner expansion | [existing top keyword] + [adjacent modifier] |

**Filters.** Include: global volume ≥ 50/mo (≥ 20/mo for named-competitor alternatives, pricing, reviews: high intent at any volume); commercial/transactional intent, or informational on the buyer journey. Exclude: zero volume, navigational, too broad for the ICP, client already ranks 1-5 (that's a win, not an opportunity). Flag: zero-volume but strategic (new competitor, emerging feature term); KD 70+ but commercially critical.

**Keyword floor: 100 candidates** before SERP qualification; widen the thinnest opportunity types until met. Segment the pool into five groups: Landing Pages · Competitor Based · Best Of Listicles · Competitor vs Competitor · Pain Point Based.

Rules: never invent volume figures; every number from a real tool call. Weak volume isn't automatically death (an 80/mo comparison with strong commercial signal is worth it; zero volume across multiple seeds is a real signal). Global volume by default; country-level only when the client targets one market. Validate ALL opportunities, don't stop at the first high-volume wins.

## Phase 4: SERP qualification

Check what actually ranks. Many topics die here; that's the point. Per keyword: SERP overview (top 10, DR, URL type, traffic), a live search (dominant SERP feature, result types, top 3 titles), and selectively fetch #1-2 (H1/H2 structure, format, depth; skip when obvious from titles).

Six questions per keyword:
1. Intent clear and consistent, or mixed? (A mixed SERP = Google unsure = unstable rankings.)
2. What format does Google reward? (listicle, alternatives, comparison, LP, docs, guide, category page)
3. Does the client's product category fit the SERP? Wrong-category dominance = misleading volume.
4. Realistic competitiveness: avg DR of top 5, any ranking page with DR below the client's (beatable targets), review aggregators (G2/Capterra) locking positions, exact-match domain at #1, any format/authority gap.
5. Does the rewarded format match what the client can produce?
6. Freshness: rankings stable 2+ years with no updates = an opening; everything updated in the last 6 months = escalating competition.

Verdicts: **QUALIFY** (clear intent, beatable, format fits, category fits) / **CONDITIONAL** (one named concern; if it can't be resolved, reclassify KILL) / **KILL** (mixed intent, wrong category dominates, ultra-high-DR lock with no gaps).

Rules: never verdict from tool data alone, read the live SERP. "Beatable" requires evidence (a lower-DR ranking page, a page serving intent badly, a visible gap); optimism is not evidence. Record the format signal for every QUALIFY, it feeds Phase 6.

## Phase 5: Business fit filter (the commercial gate)

Five gates on every surviving keyword. Harsh by design: traffic for the wrong audience is a cost.

1. **Pipeline, not traffic.** Would any of these readers plausibly convert? Fail: audience the product doesn't serve, no purchase path, traffic from geographies the client doesn't sell into, purely informational with no path to evaluation.
2. **ICP match.** The implied searcher matches the priority ICP on at least 2 of: role, industry, company size, problem type. Fail: SMB query for an enterprise product (or reverse), excluded industries, non-decision-maker roles.
3. **Product fit.** The product genuinely solves the implied problem, no stretching, no claims it can't honestly support. Forced fits create bad-fit traffic and burn trust on arrival.
4. **Client alignment.** Cross-reference "what to avoid". Client exclusions override scoring; note commercially significant trade-offs explicitly instead of burying them.
5. **Net-new vs update vs cannibalization.** Check existing inventory and current rankings. Assign NEW / UPDATE (page exists but decaying, thin, outdated) / CANNIBALIZES-RESOLVE (a performing page exists; a second page splits signals; route to an update brief, not a kill).

Document every cut with the failing gate; the cut list prompts important ICP/roadmap/positioning conversations.

## Phase 6: Topic shaping (format assignment)

Format drives structure, CTA, design, and ranking mechanics. Let the SERP lead: if Google rewards listicles, don't fight it with a landing page; match the format, differentiate within it.

| Format | When |
|---|---|
| Alternatives page | "[competitor] alternatives". Buyer unhappy and shopping. Highest-intent format in B2B SaaS SEO |
| Comparison page | "[A] vs [B]". Shortlisted, deciding. Conversion-heavy |
| Category landing page | "best [category]". Shortlist-building. High AEO citation value |
| Vertical landing page | "[category] for [industry]". ICP-targeted entry points |
| Feature page | "[feature] software". Capability-aware buyer |
| Use case page | "[product] for [use case]". JTBD framing, mid-funnel |
| Pricing page | "[competitor] pricing". Deep-funnel |
| Integration page | "[A] [B] integration". Stack-aware buyer |
| Pain-solution article | Problem described without a product. ICP-qualified top-of-funnel |
| Implementation/migration guide | "switching from X". Objection-led, removes a sales barrier |
| Comparison hub | Pillar connecting individual comparisons; category authority |
| Blog post/guide | Only when the SERP rewards editorial and no commercial format fits |
| Update existing | Keyword designated UPDATE in Phase 5 |

Per topic: chosen format + one-sentence reason, the tempting-but-wrong alternative and why it fails, hybrid element if any, cluster grouping (primary + secondary keywords one page targets; near-identical intent and same format only, two keywords with different intent stay separate), architecture flags (new URL pattern like /alternatives/[competitor], pillar+cluster structures, marketing-site vs blog placement, batch-build dependencies). Architecture decisions belong here, not mid-brief.

## Phase 7: Prioritization

Six dimensions, 1-3 each. Priority Score = sum (6-18).

| Dimension | 3 | 2 | 1 |
|---|---|---|---|
| Commercial intent | Evaluation/decision mode (alternatives, comparison, pricing, feature) | Mid-funnel (use case, pain-solution, implementation) | Top-of-funnel/editorial |
| ICP alignment | Exact priority-segment match | Broad category match | Adjacency needing assumptions |
| Ranking feasibility | KD ≤ 40 AND a visible beatable gap | KD 41-65, or competitive with a real angle advantage | KD 66+, or locked SERP |
| Content effort (inverted) | Update or LP under 1,200 w | New page 1,200-2,500 w | New long-form 2,500+ w |
| Existing authority | Already ranks in this cluster | Related content, no strong signals | New territory |
| Adjacency to wins | Direct expansion of a winning page | Same broad category, different cluster | Standalone |

Tiers: **Tier 1 build first ≥ 14 · Tier 2 next 10-13 · Tier 3 backlog ≤ 9.**

Sequencing within Tier 1: (1) quick wins (low KD + existing authority) to prove the strategy, (2) highest commercial intent (alternatives/comparisons for the most-named competitors), (3) cluster batches built together for compound internal linking, (4) long bets last. Client-stated sequencing preferences override score order; name the trade-off.

Rules: score honestly (a topic that scores 8 scores 8). Volume is NOT a scoring dimension; a 200/mo alternatives page beats a 5,000/mo top-of-funnel keyword because it drives pipeline. Sequencing is a separate decision from scoring. Show score breakdowns so recommendations are defensible. Add scoring notes where the model misses reality (a strategic low-volume competitor page can move up).

## Pipeline invariants

- Never skip Phase 1; checkpoint Phases 1 and 2 with the user before spending tool calls.
- Kill freely in Phase 4; a short qualified list beats a bloated one that passes everything.
- Never invent volume, KD, or product facts. Label every data source and date.
- A great plan makes the client say "yes, these are our buyers".
