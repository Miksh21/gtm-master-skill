> Source: swan-gtm/gtm-skills (ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# ABM Ads Orchestration: Account Selection, Stages, Retargeting, Cross-Channel

## How Many Accounts (reverse-engineer from revenue)

```
Revenue target / ACV = deals needed
Deals / closeRate / qualificationRate / consideringRate / interestedRate / awareRate = target accounts
```

Example: $1M at $50K ACV = 20 deals; 20 / 0.25 / 0.75 / 0.20 / 0.30 / 0.55 = ~3,250 accounts. Headline: roughly **2.5% of targeted accounts convert to pipeline, ~0.6% close**. A 3,250-account program = ~80 opportunities, ~20 deals.

**Stage model and thresholds (the backbone of everything ABM here):**

| Stage | Definition | Converts to next |
|---|---|---|
| Identified | On the campaign list | 55% become Aware |
| Aware | 50+ ad impressions | 30% become Interested |
| Interested | 5+ ad clicks OR 10+ engagements | 20% become Considering |
| Considering | Demo booked / trial started | close rate applies |
| Selecting | Open deal in pipeline | win rate applies |

## Account Selection Criteria (four layers)

1. **Firmographic fit:** size, revenue/funding, industry, geo, business model.
2. **Technographic:** using a competitor (active buyer); competitor lacking your key feature (upgrade); redundant tool combo (consolidation); recent stack change (buying window). Sources: BuiltWith, HG Insights, Clay.
3. **CRM intelligence:** closed-lost 6-12 months ago (had the problem, bad timing); lost to a competitor missing a feature you now have; previously-engaged outbound non-converters; churned customers.
4. **Lookalike modeling:** shared attributes of top customers -> find matches via Clay + BuiltWith.

Score 0-100, tier A (80-100) / B (60-79) / C (40-59, 1:many only) / D (exclude). Import to CRM with ABM Campaign Name + ABM Stage = Identified, sync company lists to LinkedIn (~48h to ready, 300-member floor).

**Keep scoring simple.** Programs that stack website-visit intent and multi-source weighted scores fail in execution; website de-anonymization is unreliable (a test tool identified 1 company out of 300 visitors: itself). What works: quantitative LinkedIn engagement (impressions/clicks/engagements -> stage progression) + qualitative (WHICH campaigns they engaged = intent). Push via connector (ZenABM ~$59/mo bi-directional incl. stages; Fibbler cheaper, quantitative; Factors.ai adds impression capping). HubSpot cannot natively pull company-level LinkedIn engagement; a connector is mandatory.

**CRM properties to create:** ABM Campaign Name, ABM Stage, LinkedIn Ad Engagements 7d/30d/90d, LinkedIn Ad Clicks 7d/30d/90d, ABM Intent (multi-checkbox), ICP Score, ICP Tier. Active lists per stage per campaign; workflows: impressions >= 50 -> Aware; clicks >= 5 -> Interested + remove from Aware audience + add to Interested audience + BDR notification. Audience membership then updates in LinkedIn automatically (~48h sync).

**Duration and pacing:** 12 weeks per campaign; weekly stage-progression review vs benchmarks; pipeline-per-$ meaningful after week 6-8; healthy = $10+ pipeline per $1 spent; adjust if progression < 50% of benchmark after week 4. Illustrative economics of a well-run program: first 90 days ~1,400 accounts, ~$52K all-in, ~$655K pipeline (~$12/$1); mature 12-18 months ~$490K spend, ~$5.3M pipeline (~$11/$1), ~2x ROAS on closed-won.

## Personas Inside Accounts (ads-specific layer)

Map the buying committee from closed-won CRM data (champion, economic buyer, technical evaluator, end user, blocker; 6-10 stakeholders typical). Budget priority: champions 40-50%, economic buyers 20-30%, end users 15-20%, technical evaluators 5-10%. Targeting approaches: (A) contact list upload per persona = precise but expensive and high-maintenance; (B) company list + LinkedIn native function/seniority/title filters = recommended default. At later stages (Interested+) persona audiences get too small: combine personas, differentiate via ad content instead. With ~$10K/month do not split by persona at all; differentiate through creative, exclude irrelevant roles, prioritize by JTBD.

**Campaign naming encodes intent** (this is what makes engagement data actionable): `[Campaign] - [Persona] - [Ad type] - [JTBD/Intent] - [ABM Stage]`, e.g. `Q1-Analytics - PM - Image - User-Activation - Awareness`. The connector pushes campaign names to CRM; parsing them yields persona + intent + stage per account. Volume expectations: ~100 ads across personas for a first campaign, 17-20 ads per intent group per cycle, 500+ over a mature program; never create more ads than budget serves (each needs 3-4 clicks/day of spend).

Persona metrics that matter: CTR/CPC by persona, Interested-stage conversion, meeting book rate, pipeline by persona. Executives rarely click but exec-engaged deals close faster: keep exec campaigns for influence, do not optimize them for clicks.

## ABM on Meta

Use when: TAL 1,000+ companies, enrichment available (Primer/Metadata), already running LinkedIn ABM and wanting omnichannel at lower CPM, sales cycle 60+ days, deal value $25K+. Do not use when: TAL < 500 without enrichment, no first-party data, budget < $3K/month, cycle < 7 days, or no sales follow-up. TAL under 1,000: use Meta only to retarget LinkedIn engagers.

Match rates: raw CRM business emails < 5%; Metadata MetaMatch ~40%; Primer high persona accuracy with multi-channel activation (Meta+LinkedIn+YouTube+Reddit); manual fallback = upload everything, accept 5-10%, build 1-3% lookalike from the matched portion, let creative filter.

Architecture (never mix ABM with broad prospecting): Campaign 1 ABM TOF awareness, ad sets by tier, ABO, Awareness or Video Views objective (NOT Leads, prevents junk fills); Campaign 2 ABM retargeting (engaged accounts, Traffic or Leads); Campaign 3 acceleration (open pipeline); Campaign 4 broad prospecting separately.

**Acceleration campaigns (ads on open pipeline):** when deal > $25K, cycle > 30 days, multi-stakeholder committees, competitive evals. Build CRM segment (Proposal/Negotiation/Evaluation stages, prioritize > $50K), upload weekly-refreshed Custom Audience, run same-industry case studies, ROI calculators, competitive comparisons, exec thought leadership, Awareness objective (do not push demos at people already in pipeline). Budget: $100-200/day for $100K+ opps, $50-100 mid, $50 stalled. Measure win rate and days-in-stage vs a 20% holdout, evaluate after 21+ days.

## Cross-Channel: LinkedIn + Meta Coordination

| Channel | Role | CPM |
|---|---|---|
| LinkedIn | Precision targeting, cold outreach to named accounts | $40-70 |
| Meta | Reach, frequency, retargeting, committee warming | $10-25 |

Rules: same account list on both (export from CRM); sequential activation (LinkedIn awareness first, Meta reinforcement); message and visual alignment; no conflicting simultaneous offers; consistent UTM account_id; combined account-level reporting. ABM budget split: LinkedIn 60%, Meta 30%, other (email, direct mail) 10%. The cross-channel retargeting play: LinkedIn validates the audience, Meta retargets `utm_source=linkedin` visitors at 50-70% lower CPM.

## ABM Retargeting Framework

Not generic display retargeting: it targets known accounts, respects the buying committee, coordinates ads + email + BDR + direct mail, accelerates stalled accounts, and reactivates lost deals.

**Segments and priority:**

| Priority | Segment | Window | Budget share |
|---|---|---|---|
| 1 | Recent engagers | 0-14 days | 30-40% |
| 2 | Page-specific (pricing/demo) | 30-60 days | 25-30% |
| 3 | Warm traffic | 30-90 days | 20-25% |
| 4 | Content engagers | 60-90 days | 10-15% |
| 5 | Company list, unengaged | ongoing | 5-10% |

Engagement depth: 1-2 touchpoints = awareness content; 3-5 = solution content; 6-10 = conversion content; 10+ = BDR outreach + direct offers. Recency x frequency matrix: recent + high frequency = BDR priority; old + high frequency = win-back; old + one visit = exclude or light touch.

**Frequency by channel:** LinkedIn ads 2-3x/week; InMail 1-2x/month max; Meta retargeting 3-5x/week; Google Display 3-4x/day; email 1-2x/week; BDR 1-2 touches/week. Fatigue: CTR -20-30% = refresh now; CPM +30-40% = reduce or pause; conversion -25% = review the funnel, not just ads. Rotation by temperature: hot (0-14d) rotate every 2 weeks, 3-4 variants; warm (15-45d) every 3-4 weeks, 2-3 variants; cool (46-90d) monthly, 2 variants.

**Orchestration sequence (pricing-page trigger example):** D0 add to hot segment; D1 LinkedIn case-study ad + email; D3 Meta social-proof ad; D5 LinkedIn demo ad + BDR connection request; D7 email + comparison ad; D10 BDR email + Meta urgency ad; D14 direct mail (high-value) + InMail (exec); D21 no response -> warm segment, lower frequency, new angle.

Coordination rules: every ad has an email backup; BDR follows high engagement within 48h; SUPPRESS ads during active sales conversations (do not undermine the rep); escalate high-value accounts to direct mail at an engagement threshold; one message theme across channels per week.

**Budget split by program maturity:** new program 70-80% prospecting / 20-30% retargeting; 6-12 months 60-70/30-40; mature 50-60/40-50; saturated 40-50/50-60. Cost expectations: recent engagers $6-10 CPC at 3-5% conversion; pricing-page $8-12 at 4-6%; cold list $10-15 at 0.5-1%.

**Retargeting KPIs:** CTR 0.5-0.8% (2x prospecting, worry below 0.4%); CPC 20-30% below prospecting; frequency 4-6/week (worry above 8); conversion 2-4% (3x prospecting, worry below 1.5%); return visitor rate 30-40%; pipeline velocity +15-25%.

**List structure for stage-driven audiences:** CRM active lists per stage sync to matched audiences (Identified -> awareness ads, Aware -> light solution, Interested -> solution, Considering -> conversion + BDR coordination, Lost 90d -> win-back, Churned -> re-acquisition). Stage change updates list membership updates the ad audience automatically; content progression runs itself.

Common mistakes: no frequency caps, same creative for every segment, equal budget on all intent levels, uncoordinated channels, no exclusions (customers, competitors), set-and-forget, treating ABM retargeting like B2C.
