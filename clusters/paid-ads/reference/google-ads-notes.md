> Source: swan-gtm/gtm-skills (ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Google Ads for B2B (intent-first notes)

Google's job in B2B: **capture demand that already exists**, not create it. Demand creation belongs on LinkedIn/Meta/YouTube; Search harvests it. If the category has near-zero search volume, Search is a small play; say so instead of forcing keywords nobody types.

## The Intent Ladder (spend in this order; each rung opens after the one below converts)

1. **Brand** ("[brand]", "[brand] pricing"): cheapest CPL, highest CVR, always run (competitors will bid on it otherwise; exception: sole bidder + organic dominance, test pausing and watch TOTAL brand conversions).
2. **High-intent non-brand** ("cold email software", "ABM platform"): the profit center, most budget. One clean profitable Search campaign beats five half-built ones.
3. **Competitor** ("[competitor] alternative"): higher CPC, lower CVR, valuable pipeline; run selectively.
4. **Problem-aware** ("how to scale outbound"): longer payback, expand only after 1-2 work.
5. **Demand-gen/awareness** (broad, Display, YouTube): last, with spare budget and patience.

B2B realities: clicks close in 60-180 days, so in-platform last-click misleads; feed pipeline back via offline conversion import or you optimize for form fills. Low volume, high value: chase the right 40 clicks, not scale. Junk (students, job seekers, free-hunters) clicks constantly; negatives are not optional.

## Account Structure

Separate campaigns by intent with separate budgets: Brand / Non-brand high-intent / Competitor / Remarketing. Shared budgets let brand eat the cheap clicks and blind you. Ad groups: **themed, not SKAGs** (dead since broad match + Smart Bidding): 5-15 closely related keywords sharing one intent, one promise per ad group, split if two keywords need different pages. 2-3 RSAs per group. Naming: `Search - Brand - US`, `Search - NonBrand - Global`. Defaults Google sets against you: turn OFF Search Partners and Display Network on Search campaigns; location = "Presence" not "Presence or interest"; language targets the UI language, not the query language. Fragmentation rule: a campaign that cannot reach ~15-30 conversions/month starves Smart Bidding; consolidate.

## Keywords and Match Types

Exact = tightest (still matches close variants). Phrase = the B2B workhorse. Broad = only with Smart Bidding + solid conversion signal + tight negatives, in that order; otherwise it torches budget. Progression: start Phrase + Exact on money terms -> mine search terms weekly (winners to keywords, junk to negatives) -> introduce Broad after 30+ conversions/month. Research from buyer language ("stop leads going cold"), not product language ("lead lifecycle automation"); 50 searches/month with clear intent beats 5,000 mixed. Tag keywords by intent tier for ladder-level reporting. Never run the same keyword at the same match type in multiple places; route each query to one home with negatives.

## Negatives (half the job)

Universal junk list, day one, shared across non-brand campaigns: free, cheap, jobs, salary, hiring, career, intern, student, course, tutorial, training, certification, pdf, reddit, wiki, crack, torrent; research terms ("what is", "examples", "meaning") unless intentionally problem-aware; category-share words with different intent (selling "sales engagement" = negative "employee engagement"); brand terms as negatives in non-brand campaigns. Match types: negative broad requires ALL words present in any order ("free trial" does not block "free" alone); negative exact for context-dependent terms. Weekly ritual on the search terms report (the #1 lever): waste (spend, no conversions, 3+ clicks -> negative), winners (converting terms -> Exact/Phrase keywords), intent drift (tighten match or negative). Do not over-negative in low-volume B2B: cut the clearly wrong, let the uncertain run.

## Bidding by Conversion Volume

| Conversions/month | Strategy |
|---|---|
| 0-15 | Manual CPC or Maximize Conversions (no target) |
| 15-30 | Maximize Conversions |
| 30+ stable | tCPA, set near trailing 30-day actual |
| Revenue values tracked | tROAS (real deal values only) |

Move targets in 10-15% steps, wait 1-2 weeks between; aggressive-low tCPA chokes delivery. Expect a 1-2 week learning period after any big change; do not panic-edit inside it. The B2B trap: Smart Bidding optimizes to whatever you call a conversion; import offline conversions (SQL, opportunity, closed-won via GCLID) so it learns toward pipeline; value conversions differently (demo > ebook). A day can spend up to 2x daily budget (monthly balancing). Budget-capped converting campaigns: raising budget often LOWERS CPA. Brand needs little budget; cap it.

## RSAs and Landing Pages

8-12 genuinely different headlines (value prop, outcome, social proof, differentiator, offer, keyword theme), 3-4 descriptions. Pin sparingly: one critical headline at position 1 max; over-pinning kills optimization and Ad Strength. Write to query intent: brand = reassurance + direct CTA; high-intent = outcome + differentiator ("Book 3x more meetings. No data setup."); competitor = honest contrast, no trashing. Keyword theme in at least one headline (CTR + Quality Score). Landing pages are the fastest CPL win: message match (page headline echoes ad promise and query), one job per page (one offer, one CTA, kill nav-away links), speed (slow pages lose mobile clicks and drag Quality Score), proof above the fold, form length as intent gate (short = volume, long = quality; match funnel stage). Quality Score 1-10 = expected CTR + ad relevance + LP experience; fix the weak component before raising bids; low QS = higher CPC for the same slot.

## Performance Max

An amplifier AFTER Search works, never the foundation. Use with proven Search economics, real (ideally offline-imported) conversion signal, decent creative assets including video (Google auto-generates bad video otherwise). Skip as a first campaign, with weak tracking (it optimizes hard to junk), or on tiny budgets. Guardrails: account-level brand exclusions (stops cannibalizing brand Search), audience signals from best 1st-party data, the junk negative list applied, offline conversions before scaling, search themes to steer + insights monitoring for drift. Read PMax via the Insights tab, asset groups, and above all CRM lead quality by campaign; PMax leads converting at half the Search rate = cheap-looking expensive volume, cut or re-signal. Value order for most B2B SaaS: brand Search -> high-intent non-brand -> remarketing -> PMax -> broad demand gen.

## Measurement

Priorities: Search Impression Share (low IS on profitable terms = money on the table), Search Lost IS budget vs rank (different fixes), cost per SQL not per form fill, keyword Quality Score. Fix order: define conversions by quality; import offline conversions; assign values; report on pipeline and reconcile platform vs CRM monthly (CRM wins). Weekly scorecard: spend, leads, CPL, lead-to-SQL rate, SQLs, cost per SQL, Search IS, top wasted terms. Always create campaigns PAUSED; review before enabling spend.
