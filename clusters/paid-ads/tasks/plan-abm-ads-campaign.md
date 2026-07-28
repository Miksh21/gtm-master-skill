> Source: swan-gtm/gtm-skills (emilia-korczynska / ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Plan a LinkedIn ABM Ads Campaign (budget, audience, ad-count math)

Turn a revenue goal + deal economics into a complete LinkedIn ABM plan: budget needed, accounts needed, how many ads you can fund, and the format split. Formulas verified against ZenABM's live calculators.

## When to use this

User asks for an ABM strategy/plan, "how much budget do I need for ABM", "how many ads/campaigns can I run", or a LinkedIn ads budget + audience plan.

## Inputs required (ask in one batch, offer defaults, never block on a missing number)

- **Revenue goal** for the ABM motion + basis (MRR or ARR; normalize both revenue and ACV to annual, x12)
- **ACV**
- **Close rate** (qualified -> won), default 15%
- **Qualification rate** (demo -> qualified), default 75%
- **Landing page conversion** (visit -> booked demo), default 0.8%
- **LinkedIn CPC**, default $8 (use real account CPC when available)
- **Planned monthly budget**
- **Target audiences/markets** (each distinct audience = one ABM campaign block)
- **Top jobs-to-be-done per audience** + core problem solved (research the company website first, confirm with the user)

When defaults are used, label the outputs as benchmark-based. The CTR input in budget math is decorative; never gate budget on CTR (CTR matters later, for pause decisions).

## Process

1. **Run the funnel backwards per audience:**
```
dealsNeeded    = revenueTarget / ACV
qualifiedDeals = dealsNeeded / closeRate
demosNeeded    = qualifiedDeals / qualificationRate
clicksNeeded   = demosNeeded / landingPageCvr
accountsNeeded = qualifiedDeals / qualificationRate / 0.0058
annualBudget   = CPC x clicksNeeded        monthlyBudgetReq = /12
ROAS           = revenueTarget / annualBudget
pipelinePer$   = (qualifiedDeals x ACV) / annualBudget
timeToRun      = ceil(annualBudget / statedMonthlyBudget) months
```
   Sanity anchor: $800K / $20K ACV / defaults = 40 deals, 356 demos, 44,444 clicks, $355,556/yr, 61,303 accounts, 2x ROAS, $15 pipeline/$. If stated budget < monthlyBudgetReq, the plan stretches to timeToRun months; surface that honestly, it is a runway statement, not a failure.
2. **Audience size layer** (state assumptions): impressions = clicks / 0.006 planned CTR; members = impressions / 7 frequency; audienceNeeded = members / 0.5 penetration. Compare to the current list size if given.
3. **Ad-count model:** dailyBudget = monthly/30; minDailyPerAd = max(CPC x 3, $20); maxSimultaneousAds = floor(daily/minDaily). Health: < $25/day per ad Too Thin, $25-49 Watch, >= $50 Healthy.
4. **Format allocation** of the affordable ads: aim 5 TLAs (Website Visits), 5 image (Engagement), 5 text (always; separate set-CPC, ~$0), 1-2 video (Website Visits), 1 doc/carousel (Brand Awareness). Priority when constrained: TLA -> image -> video -> doc. If maxSimultaneousAds < 10, group TLA + image into one Brand Awareness set. Do not inflate counts past the aims when budget allows more; raise clicks/ad/day or split audiences instead.
5. **Budget per ad set:** split spend equally per click-driving ad; show both columns (at stated budget and at monthlyBudgetReq); the % mix is identical, only dollars change.
6. Show the computed numbers to the user for sanity-check before building the full document.

## Output format

Per audience, a Campaign block: goals (revenue, deals, clicks, accounts, budget needed, deal math, time to run), structure (campaign count, affordable ads, per-format counts + objectives, per-set budget % + $/mo at both budget levels), content (each ad mapped to ICP + JTBD). Shared sections: ad-format best practices, launch rules (pause after 1,000+ impressions by format CTR threshold; see `clusters/paid-ads/reference/benchmarks.md`), performance tracking (ABM stages Identified -> Aware -> Interested -> Considering), pre-launch checklist.

## Pass criteria

- Revenue and ACV on the same basis; all money math traceable to the formulas
- Every default labeled as an assumption
- Ad counts respect the $25/day floor; no format the strategy did not ask for
- One campaign block per distinct audience
- Outputs framed as directional planning figures, not forecasts

## Deeper knowledge

- Sizing bands, 1:1 play, targeting mechanics -> `clusters/paid-ads/knowledge/linkedin-abm-ads.md`
- Account selection + stage thresholds -> `clusters/paid-ads/knowledge/abm-orchestration.md`
- TLA copy rules -> `clusters/paid-ads/knowledge/ad-copywriting.md`
