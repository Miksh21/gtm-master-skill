> Source: swan-gtm/gtm-skills (ivan-falco / emilia-korczynska) · MIT · imported 2026-07-28 · external content, unreviewed

# LinkedIn ABM Ads: 1:1 / 1:few / 1:many, Sizing, Targeting Mechanics

Distinctive ABM-on-LinkedIn knowledge. For general LinkedIn ads strategy (funnel architecture, bidding, formats) use the standalone `linkedin-ads` skill; this file covers what it does not: ABM list mechanics, the 1:1 play, sizing bands, and targeting gotchas.

Core principle: ABM campaigns are not just about targeting your ideal accounts, they are about REACHING them. A perfect list that reaches 15% of its companies wastes 85% of its potential.

## Campaign Types

| Type | Accounts | Targeting | Best for |
|---|---|---|---|
| 1:1 | Single company | Company name added directly to targeting | Whale accounts, strategic deals |
| 1:few | 10-20 companies | Company list upload | Named account programs |
| 1:many | Vertical/segment | Company list or native targeting | Vertical campaigns |

## Company Lists vs Contact Lists

Company lists win by default: easier to obtain, LinkedIn matches company names more reliably than emails, and less maintenance (people change jobs, companies do not). Contact lists only when you have verified business emails and need named individuals.

| Parameter | Minimum | Recommended |
|---|---|---|
| List rows | 300 | 1,000+ |
| Company names | 300 rows | 1,000+ (duplicates allowed to fill rows; system dedupes) |
| Emails for contact lists | 300 rows | 10,000+ |
| Matched members to launch | 300 (hard floor) | 1,000+ |
| Cold ABM campaign audience | 15,000 members | gives the algorithm room |

**Per-company engagement report:** Audiences -> your company list -> engagement report, sortable by impressions/clicks. This is the biggest advantage of list-based targeting. If some companies get no impressions, split them into a separate campaign; LinkedIn over-serves the easiest-to-reach companies otherwise.

**List vs native performance (directional):** list targeting runs ~50% cheaper CPM and engages more decision-makers (native engages more ICs).

**Mixed-list trap:** LinkedIn prioritizes spend on enterprises inside mixed lists; a 3K unsegmented list can reach only ~15% of accounts. Segment into homogeneous lists (enterprise 500+ / mid-market 200-500 / SMB 0-200, or by vertical/region/deal stage) with their own campaigns and budgets.

## The 1:1 Whale Play

One ad set per named company: targeting = employers {that company} + a narrowed buyer layer. All ad sets under one campaign group. Creative personalized per account (name/logo in the image), each ad driving one click to a landing page built for that account.

**Performance:** personalized 1:1 ads commonly hit 5-10% CTR vs 0.5-1% standard, a 5-10x lift. Works best where the value prop is clear per account (MarTech, SalesTech, CS tools). **Legal: never run company name/logo personalized ads in Germany (privacy regulation, not LinkedIn policy).**

**Audience target band per ad set:**

| Audience size | Verdict |
|---|---|
| < 300 | Will not deliver; LinkedIn hard floor; expand region or drop the account |
| 300-1,000 | Sweet spot |
| 1,000-1,200 | Fine |
| 1,200-2,000 | Acceptable, trim toward 1,000 |
| 2,000+ | Too broad, trim hard |

400-500 is fine; do not trim small audiences for sport. Goal: > 300, as close to 300-1,000 as possible without dropping under.

**Narrowing levers, in order (apply the next lever only while still above band; if a lever drops you below 300, revert it):** decide geo importance FIRST. Default light-geo path: 1) light geography (drop clearly irrelevant countries, keep region broad; you want the decision-maker, not a postcode) 2) job function + exclude junior seniorities 3) job titles (see API constraint below) 4) years of experience (pushes entry-level out) 5) final aggressive geo as last resort. Strict-geo-first only when geo IS the strategy (single-country sale).

**Seniority mix rule:** entry-level tier (Unpaid/Training/Entry) <= 5% of the audience, ideally 0. Decision cluster (Manager/Senior/Director/VP/CXO) on top. Size the audience once per seniority segment to see the distribution; the API returns only totals.

**Targeting constraint (applies to all LinkedIn campaigns):** job titles cannot be ANDed with job functions or seniorities in the include block. When using titles, titles go in include; function + seniority go in EXCLUDE. Practical consequence: excluding entry-level is only possible with seniority-based targeting, not alongside title targeting.

**1:1 build non-negotiables:** everything created DRAFT/paused, activation is a separate explicit step; attach the account's active conversions to every ad set; set UTMs at ad-set level (not baked into ad URLs); single-image link ads must be built as an article post or they lose the destination URL + CTA; QA every ad set (targeting, budget, conversions, UTMs, destination + CTA + headline) before activation.

## Audience Sizing (all LinkedIn campaigns)

| Stage | Recommended size |
|---|---|
| TOF cold | ~50K sweet spot; up to 100K only with budget for frequency; 10K-20K on small budget |
| MOF retargeting/nurture | 1K-30K |
| BOF conversion | 1K-5K |
| ABM lists | 300+ matched minimum |

Size is really a frequency decision: ABM works by penetration (>30% of the audience reached) times frequency (seen enough times to be remembered). Over ~100K rarely makes sense, over 300K never; a huge audience on a normal budget reaches many accounts once and sticks with none. Too tight (<10K cold): CPMs spike 5-10x, budget will not spend. Retargeting under 500: barely serves; fill the pool from TOF or extend the lookback.

Broadening an audience predictably: CPM down, CPC down, CTR down, engagement down. Expected trade, not an anomaly.

## Job Function vs Job Title

Large-scale 8-week test switching underperforming title-targeted campaigns to function + seniority: audience 3x, reach 2x, cost per reach 1.6x cheaper, engagement flat, at the cost of weekly negative-filtering of irrelevant titles (like negative keywords; they stop appearing after ~8 weeks). Titles = focus, certainty, higher cost. Functions = reach, discovery of unexpected ICP titles, cheaper, needs active filtering.

**Business Development function includes CEOs, CMOs, Managing Directors** (partnerships/M&A definition). Do not exclude BD when C-suite is in the ICP; filter non-exec BD roles (SDRs, BDRs, call-center supervisors) via seniority exclusions instead.

## Splitting for Scale

Priority order: intent, persona, region/company size, seniority. Regions: US always separate (most expensive); DACH separate (needs local-language ads; France + Germany English ads underperform, Nordics/NL/ME English is fine); UK+Canada+Australia can group; never mix expensive markets with cheap ones (the expensive one eats the budget). Minimum 15K per cold campaign after splitting. Company size: split by employee count (LinkedIn has no reliable revenue data); 500+ is the enterprise cutoff; unsegmented targeting drifts to 50-200 and 10,000+ companies (where LinkedIn users concentrate), starving mid-market. Seniority split (decision-makers get ROI messaging, ICs get daily-task messaging) only after intent/persona/region/size splits; ICs influence deals without converting, so track influence via self-reported attribution, not just conversions.

## Expansion, Exclusions, Hygiene

- **Audience Expansion: always OFF** (auto-enabled at setup; LinkedIn's similarity matching is unreliable). **LinkedIn Audience Network: OFF** for B2B quality.
- Lookalikes: 48-72h build, 5-10x source size; predictive audiences: 4-5 days, max 10% of location population. All three expansion models match poorly; last resort after functions/industries/regions.
- Exclusion priority: 1) converted users from ALL campaigns 2) competitors + customers from cold 3) website visitors from prospecting (they belong to retargeting) 4) unpaid/entry seniorities 5) agency employees. Weekly ABM hygiene: demographics report -> exclude irrelevant functions/titles eating budget, exclude newly-won customers.
- **Retargeting audiences are NOT retroactive.** Create ALL of them before launching anything: website visitors 30/90/180d, video viewers 50% (30/90d) and 97% (30d), image-ad engagers 90d, company page 180d/lifetime, Lead Gen Form openers-not-submitters 90d, demo/pricing visitors 30+90d, conversation-ad clickers 90d.
- **Impression capping via Company Engagement dynamic exclusion:** build a dynamic audience of companies with 500+ impressions in the last 7 days and exclude it; accounts rotate in and out automatically. Tune 300-750 by fatigue vs reach.
- ABM remarketing lists stay separate from general remarketing (different messaging, higher acceptable CPAs).

## Frequency and Orchestration

Target ~4 impressions per person per week inside target accounts; BOF accounts near decision can run up to ~15 per 30 days. Sustained frequency only works with 3-4 rotating creatives; ~8+/week of a single creative = rotate or expand, do not just pause. The prospect should meet the brand 7-10 times across channels before the sales conversation: ads carry awareness and mid-funnel, sales carries direct engagement; coordinate email sequences, events, direct mail on the same account list.

Multi-account setups (regional ad accounts): upload the list once, share via Business Manager "Share Audiences" instead of maintaining copies.

## Ad Engagement as Sales Trigger (summary; full playbook in ads-outbound-interplay.md)

Track which companies engage (clicks, 50%+ video views, Lead Gen Form opens, impression spikes); push to CRM via a connector (Fibbler/ZenABM); sales reaches out within 48 hours of an engagement spike, referencing the problem angle from the campaign, never the ad itself. Free organic layer: check LinkedIn profile visitors daily (often ad-triggered), send blank connection requests to ICP-fit visitors; acceptance runs far above cold.

## Emilia's Planning Formulas (budget, ad count, allocation)

Funnel backwards (all annual; multiply MRR figures x12 first; defaults: qualification 0.75, close 0.15, LP conversion 0.008, CPC $8):

```
dealsNeeded      = revenueTarget / ACV
qualifiedDeals   = dealsNeeded / closeRate
demosNeeded      = qualifiedDeals / qualificationRate
clicksNeeded     = demosNeeded / landingPageCvr
accountsNeeded   = qualifiedDeals / qualificationRate / 0.0058   (0.58% account-to-qualified baseline)
annualBudget     = CPC x clicksNeeded          monthlyBudgetReq = /12
ROAS             = revenueTarget / annualBudget
pipelinePerDollar= (qualifiedDeals x ACV) / annualBudget
timeToRunMonths  = ceil(annualBudget / statedMonthlyBudget)
```

Sanity check: $800K target, $20K ACV, defaults -> 40 deals, 356 demos, 44,444 clicks, $355,556/yr ($29,630/mo), 61,303 accounts, 2x ROAS, $15 pipeline per $1.

Audience layer (state as assumptions): planned blended CTR 0.006, frequency 7 impressions/member, penetration 0.5: impressions = clicks/0.006, members = impressions/7, audienceNeeded = members/0.5.

Ad-count model: dailyBudget = monthly/30; minDailyPerAd = max(CPC x 3 clicks/day, $20); maxSimultaneousAds = floor(daily / minDaily). Health per ad: < $25/day Too Thin, $25-49 Watch, >= $50 Healthy; LinkedIn needs >= $25/day per ad to optimize delivery.

Format allocation of the affordable ads: aim 5 TLAs (Website Visits objective; best value), 5 image (Engagement), 5 text (always; separate set-CPC bid, ~$0 of this budget), 1-2 video (Website Visits, 15-30s), 1 document/carousel (Brand Awareness). If affordable ads < 10, group TLA + image under one Brand Awareness set. Split spend equally per click-driving ad so each clears the $25/day floor. Number of ABM campaigns = number of distinct target audiences.
