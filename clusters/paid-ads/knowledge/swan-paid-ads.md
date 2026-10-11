# Swan external takes — paid-ads (Unvalidated)

## When to load
Only on a request for alternatives, a pushback on a canonical paid-ads position, or a deliberate second-opinion check (gtm-master SKILL.md step 5). Topics: Google Ads audit gates (rank vs budget pressure, CPC triage, PMax), Meta audit triage (top-performer protection, Pareto, video tree, data traps). Source rulebook is ecommerce-first (GoMarble); always attribute, never present as gtm-master doctrine.

## Unvalidated — external, not yet run by Jan
> Filed by the Swan radar from third-party skills. Attributed; NOT gtm-master doctrine.
> A bullet moves into the body above only after it has been run in a real campaign and worked.

### Google Ads audit
- Rank vs budget pressure as explicit gates. Rank HIGH if any: IS lost (rank) >=30%; Search IS <=50% with rank loss > budget loss; Top-of-page <=60% or Abs Top <=20% on Q1 terms. Budget HIGH only if all: IS lost (budget) >=20%; budget loss > rank loss; CPA <= target; Q1-Q3 >=60% of spend. Moves: budget +10-20%, bids +5-10% or fix relevance, fix rank first, or hold. [aditya-sriram/google-ads-audit]
- CPC inflation triage: rising CPC + rising IS lost (rank) = competition (bid up only if CPA <= target); + new Q4/Q5 terms = match-type leakage (negatives); + falling CTR = relevance (fix ads, not bids). False-scale test: no budget raise unless CPC WoW% growth < CVR WoW% growth. Chase Top/Abs Top only if CVR at top >= 1.15x the rest. [aditya-sriram/google-ads-audit]
- Valid controls only: every recommendation maps to a real UI control (campaign budget, bid target, pause/enable); never "shift budget between keywords/devices/asset groups"; never bids and budget in the same move; budget steps <=20% Search/Shopping, <=50% mature PMax; segment recs need >=50 clicks and >=5 conversions; never scale on <7 days of data. [aditya-sriram/google-ads-audit]
- PMax gates: 30+ days (ideally 60) or 50+ conversions before optimizing; PMax/Search ROAS ratio <0.5x poor, 0.5-0.9x optimize first, >=0.9x scale-eligible; asset labels LOW = replace with variants of BEST, PENDING = wait 14+ days, never remove BEST/GOOD; new audience signals in Observation 14+ days before Targeting; Smart Bidding floor 50 conv/30d PMax vs 30 Search. [aditya-sriram/google-ads-audit]
- Competitor campaigns OFF by default; on only if CPA <= 1.2x target AND rank pressure LOW. Data trap: PMax asset labels and search-term insights are not in default CSV exports (pull from the PMax campaign page); divide cost_micros by 1,000,000 only for raw API data, never CSV. [aditya-sriram/google-ads-audit]

### Meta Ads audit
- Top-performer protection: never pause the ad with the most conversions in an ad set, whatever its spend share (Meta pushing 60-80% to it is optimization working). Pause when CPA > 3x the ad set average with 3+ conversions; 1-2 conversions or <7 days old = watch. Compare only ad sets with 25%+ of campaign spend. [aditya-sriram/meta-ads-audit]
- Pareto triage: paginate all active ads, keep those making 90% of cumulative spend, baseline on their averages. CPM 30%+ above and primary conversion metric 30%+ below = pause; CTR 30%+ below with low conversion = read comment sentiment, then test stronger CTAs; good metrics but declining trend = new creative, not budget. [aditya-sriram/meta-ads-audit]
- Video diagnosis tree: hold rate = ThruPlays / 3-sec views vs 90-day account average (good = avg +25%). Weak hook = rebuild hook; good hook, weak hold = keep first 3 s, rebuild the rest; both good but CTR <0.65% = fix CTA. Winner variation order: copy, angle, format, hook. Hook-rate denominator here is video plays, not impressions (see creative-system.md). [aditya-sriram/meta-ads-audit]
- Data-integrity traps: an OUTCOME_SALES campaign optimized on COMPLETE_REGISTRATION is usually a third-party purchase tracker, ask before "fixing"; API purchases = omni_purchase, fallback purchase, never sum overlapping action types; read the conversion event from promoted_object, never from names; API budgets are in cents. [aditya-sriram/meta-ads-audit]
- Structure detection: Primary vs Testing when testing has <30% budget and 5+ ads while primary has 40%+ budget, fewer ads, 70%+ of them also in testing; identical targeting with different bids = bid-limit split; different audiences = audience split; anything else = diagnose via creatives, landing URLs, attribution windows. [aditya-sriram/meta-ads-audit]

## Source
swan-gtm/gtm-skills (aditya-sriram, adapted from GoMarble) · MIT · filed 2026-09-28 · reviewed 2026-10-01
