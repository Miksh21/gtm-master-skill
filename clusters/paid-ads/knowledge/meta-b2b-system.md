> Source: swan-gtm/gtm-skills (ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Meta for B2B: The Complete System

Meta (Facebook/Instagram) works for B2B SaaS, including $30K+ ACV, when two conditions hold: you bring your own high-quality audience data, and your creative does the targeting work. Meta's native B2B targeting (no job title, seniority, company filters) is weak. Done right, Meta delivers roughly 50% lower cost per lead than LinkedIn and lower cost per qualified opportunity. Validate in your own account before scaling.

## Meta vs LinkedIn

| Dimension | LinkedIn | Meta |
|---|---|---|
| Targeting precision | Highest: title, seniority, company | Low natively; data + creative filter |
| Average CPC | $8-22 | $2-8 |
| Average CPM | $33-65 | $8-25 |
| Average CPL (B2B SaaS) | $50-200 | $25-100 |
| Algorithm strength | Weaker, targeting-driven | Strongest, creative-driven |
| Creative testing velocity | Slow (expensive impressions) | Fast (cheap impressions) |
| Lead form quality | Higher by default (work email auto-fill) | Needs friction management (social amnesia) |
| Best for | Enterprise, ABM, precise ICP | Large TAM, SMB/mid-market, remarketing, acceleration |

They are complementary: LinkedIn for precision prospecting and ABM, Meta for cheap remarketing and reach. Bridge them with UTM-based cross-channel retargeting.

## The Algorithm: Andromeda + Gem

- **Andromeda** (ad processing): ML model that processes copy, images, video transcripts, carousels and predicts which creatives will perform. Post-2024 it is reported ~10,000x more powerful at finding converters. It needs creative VOLUME: 4-6+ unique concepts, not micro-variations. Three headline tweaks on one image are NOT three concepts; UGC vs before/after vs meme vs product demo are.
- **Gem** (user matching): analyzes each user's behavior and matches them to the concepts Andromeda selected.

Implication by TAM: large TAM (SMB) = feed creative volume, lean on automation. Medium TAM ($30-100K ACV) = CRM lookalikes + third-party data as seeds, algorithm optimizes delivery. Small TAM (enterprise, niche) = the algorithm cannot find 500 target companies alone; supply explicit audience data.

**Creative IS targeting.** The algorithm reaches more of whoever engages. Specific creative ("For B2B SaaS teams with 50+ employees") acts as mosquito repellent for non-ICP. Test: would someone outside the ICP scroll past immediately? If yes, it is working.

## The Data Hierarchy (audiences, in priority order)

**Tier 1: First-party CRM data.** Seed = customers who paid the most, bought quickest, stayed longest (your top 5% of buyers). Upload as Custom Audience, build a 1% lookalike, validate quality, then expand to 2%. Feed only the cream; closed-won + late-stage pipeline is fine, early-stage leads dilute.

**The match-rate problem:** Meta matches poorly on business emails (often <5%). Enrich the list with personal emails + mobile numbers before upload; that is what Meta actually matches on (MAIDs are a minor assist post-ATT). Tools: Clay/Freckle for enrich + auto-sync, ZoomInfo/Clearbit for appends.

**Tier 2: Third-party data.** Primer, Metadata.io (MetaMatch, ~40% match, 1.5B email graph). Define firmographic/technographic criteria, tool matches against its identity graph, uploads matched contacts as a Custom Audience. Gives LinkedIn-like precision ("VP Marketing at SaaS 200-500 using Salesforce") at Meta costs. Also the way to extend LinkedIn ABM lists onto Meta.

**Tier 3: Broad targeting.** Only when ALL true: not ABM, large TAM (SMB/lower mid-market), highly specific creative, and Tiers 1-2 already tested. For niche B2B, data-driven targeting still beats broad on lead quality.

**Audience minimums:** lookalike seed 500 accounts (1,000+ optimal); broad prospecting 500K people (1-2M optimal); ABM custom audience 1,000 accounts minimum.

## Audience Validation (before scaling anything)

ABO campaign, one ad set per audience source (1% CRM lookalike / third-party / interests+titles / broad), SAME 3-4 ads in every ad set, equal budgets, 2-4 weeks. Turn OFF Advantage+ audience expansion ("Further limit reach"). Validate in CRM, not Ads Manager: job title match, company match, lead-to-MQL rate, cost per qualified lead, pipeline rate, sales quality scores. Kill cheap-but-junk ad sets. Simpler low-budget variant: broad vs interest-based, two ad sets.

## Campaign Phases and Account Architecture

| Phase | Structure | Purpose | Transition |
|---|---|---|---|
| 1: Audience validation | ABO, 1 campaign | Find which audiences produce quality | Winning audience found (2-4 weeks) |
| 2: Creative scaling | CBO, 2 campaigns | Scale via creative testing | 50+ conversions/week consistently |
| 3: Automated scaling | Advantage+ | Max scale | Ongoing |

Most B2B accounts live in Phase 2 long-term. Full-funnel architecture: Campaign 1 Remarketing (month 1, $20-50/day, website visitors 30/90/180d + video viewers 50%+ + cross-channel UTM), Campaign 2 Prospecting-ABO (months 2-3), Campaign 3 Prospecting-CBO or Advantage+ (month 3+, main budget), Campaign 4 ABM (month 4+, ABO per tier), Campaign 5 Acceleration on open pipeline (month 4+, Awareness objective).

**Build order: Remarketing first.** Lowest risk, highest ROI, proves Meta works for the brand, creates "they're everywhere" perception on a tiny budget. Then prospecting, then ABM/acceleration. Month 12+: the top 5% of in-market buyers is exhausted; expand with story-based ads for colder audiences ("here's what companies like yours are doing").

**Cross-channel UTM retargeting:** build Meta Custom Audiences from website visitors where URL contains `utm_source=linkedin` (or google&cpc). Retarget LinkedIn-validated traffic on Meta at 50-70% lower CPM. Requires enough traffic volume to build the audience.

**Exclusions everywhere:** closed-won customers, recent converters (7-30d), employees, CRM-disqualified accounts.

## Offers by Funnel Stage and ACV

You cannot sell a $30K contract from a cold ad. Sell the click; the page sells the next step. Demo requests fail on cold traffic (intent mismatch, commitment too high, step-10 ask at step 1, too little volume for optimization). Demos work only for retargeting, SMB/low ACV, or hot signals (pricing-page visitors).

| Segment | ACV | Cold offer | Warm offer | Hot offer | Meta's role |
|---|---|---|---|---|---|
| SMB | $5-15K | Free trial, quick guide | Product tour, case study | Demo, signup | Full funnel |
| Mid-market | $15-50K | Benchmark report, calculator, webinar | Comparison guide, workshop | Strategy session, assessment | Education + retargeting |
| Enterprise | $50-250K+ | Industry report, exec briefing | Case studies, product tours | Custom ROI analysis, pilot | Awareness + remarketing only |

No-brainer offer tests: would they pay for it; can it be Googled; tied to the problem your product solves; specific ("Fix pipeline leakage in 60 days" not "improve marketing"); value within 24h; 4 form fields max. Cold-to-close timeline at $30K+: 3-9 months total.

## Lead Forms: Engineered Friction

Social amnesia ("I don't remember signing up") is the #1 B2B lead form problem: auto-fill lets people submit in 2 seconds. Fix with intentional friction:

1. **Higher Intent form type** (adds review step). More Volume only for fast audience validation.
2. **Require work email** (kills auto-fill, filters consumers).
3. **1-3 custom qualification questions**, multiple choice, easiest first: budget, company size, role, timeline, biggest challenge. Above 3 questions abandonment spikes.
4. **Confirmation message** stating exactly what happens next.

Friction levels: low (validation, More Volume, 0-1 questions), medium (Higher Intent + work email + 1-2), high (max quality: + budget/timeline questions). Lead form vs landing page: LP when it converts 5%+ or for demo/trial; lead form when starting out, LP <2%, webinars/downloads, or ABM acceleration.

## Placements

Feed (FB primary, IG secondary) is the B2B workhorse: engagement, long copy. Audience Network: often junk for B2B, exclude if quality drops. Stories/Reels only with dedicated 9:16 creative. Cold prospecting and brand: Advantage+ auto placements OK, review report after 7 days. Retargeting and ABM: manual Feed.

## Advantage+

Four layers: Audience (your lists become suggestions, Meta expands beyond them, cannot be locked), Placements (auto), Creative (auto-variations, watch quality), Campaigns (full automation; Advantage+ Leads launched Feb 2025 with work email validation, SMS verification, lead filtering, ~10% lower CPL in Meta's early tests).

Use Advantage+ when: 50+ conversions/week, $5K+/month, Pixel + CAPI firing, proven offer + audience, 3-5+ creatives, aggregate reporting OK. Use manual when testing, under 50/week, or strict ABM. **Advantage+ for ABM: mostly no.** It expands beyond any list. True ABM = manual campaigns; Advantage+ = broad prospecting. Hybrid is the recommended default: manual ABO "where you learn" (validation, new concepts, ABM), Advantage+ CBO "where you earn" (scaling proven offers).

"Further Limit Reach": only with data proving a segment never converts, or compliance. Default B2B: location + age 25-65, let creative filter. Campaign Score 70+ means you follow Meta's recommendations; a 60 with good lead quality beats a 90 with junk. Advantage+ setup: Leads objective, CBO, budget >= (Target CPA x 50)/7 per day, audiences as suggestions, Higher Intent form + work email + SMS verification, monitor after 7 days.

## Scaling Qualified Pipeline (the 6-step spine)

Meta finds exactly what you ask for. Optimize for "Lead" with no other signal and it delivers the cheapest form-fills. Change what you ask for:

1. **Map the market.** Tier TAM companies 1-4 by fit, pull contacts, enrich for personal email + mobile, push as custom audience.
2. **Structure audiences.** Three audiences: full Tier 1-4 contact list, lookalike of it, lookalike of closed-won contacts. One campaign per audience, one ad set per creative angle, CBO with a 30% minimum spend per ad set while validating angles (sparingly; the two-campaign testing/scaling split is the alternative, pick one deliberately). Tight targeting, expansion OFF; the lookalike is the controlled expansion. Exclude customers + open pipeline; exclude Audience Network.
3. **Optimize by funnel event.** Use Meta's Conversion Leads (CAPI CRM integration). Configure Lead, MQL, SQL as funnel stages, send qualified stages back daily from CRM via CAPI. Optimize for the highest-quality event getting ~10+/week per ad set (practical floor; 50/week fully exits learning), move up-funnel as volume grows. Non-negotiables: capture and store fbclid/Lead ID at lead creation and pass it through every CRM stage change (MQLs land weeks after the 7-day click window; without the stored ID attribution silently breaks); keep EMQ 6+/10 (hashed email, phone, external_id); Conversion Leads gates: ~200 leads/month minimum, optimized stage must convert at 1-40%.
4. **One creative process feeds video AND static.** Research buyer language (sales calls, Reddit, forums), map angles + hooks. At ~$30K/month, ~10 new creatives every 2 weeks; scale with budget. Testing campaign fed continuously, scaling campaign holds winners.
5. **Test and personalize by segment.** Export a segment from the TAM list, upload as its own audience (list + lookalike), build ads + landing page in that segment's jargon (a PE-owned company CFO reads differently than a non-PE one). A/B test landing pages 50/50 per ad set.
6. **Report on real SQLs.** Live report joining Meta + CRM: MQL/SQL trends vs spend, which ads drive SQLs. While Meta still optimizes per Lead, manually shift budget toward SQL-driving ads. Read trends, not single weeks.

## Common Mistakes (top of the list)

Relying on native B2B targeting; uploading raw CRM without enrichment; broad targeting with generic creative; mixing ABM and broad in one campaign; CBO during audience validation; 5-6+ ad sets per campaign (consolidate to 3-4); changing settings during learning; pushing demos at cold traffic; same offer at every stage; optimizing CPL instead of pipeline; last-click attribution; judging before 2 weeks; launching on Friday; no Pixel+CAPI before launch.
