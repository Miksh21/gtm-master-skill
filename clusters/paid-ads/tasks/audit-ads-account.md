> Source: swan-gtm/gtm-skills (emilia-korczynska / ivan-falco) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Audit a Paid Ads Account (last 30 days, graded fix list)

Diagnostic audit of live spend: real CPC/CPM/CTR, ad count, format mix, decay, account engagement, graded against benchmarks, ending in a prioritized fix list. Written for LinkedIn; the grading logic transfers to Meta with the Meta benchmark table.

## When to use this

"Audit my ads", "are my ads any good", "why is my CPC/CPM so high", "which format works best", "are my ads decaying", "benchmark my ads". NOT for planning a new campaign (use `plan-abm-ads-campaign.md`) or a stakeholder recap (use `monthly-ads-report.md`).

## Inputs required

- Last-30-days data (previous 30 days as comparison): account totals (spend, impressions, clicks, engagements, landing-page clicks, CPC, CPM, CTR), per-format performance both periods, per-ad performance + weekly windows (decay needs a time series; one aggregate pull cannot show a 3-week decline), ad catalog with serving status, campaigns, deals (if CRM connected), account/company engagement.
- Never fabricate live numbers. No data = say the data is not there. "We can't see X yet" is not "X is zero."

## Process (compute in this order)

1. **Right number of ads?** affordableAds = floor((30d spend / 30) / max(realCPC x 3, $20)). Compare to actually-serving ads. Too few = headroom; too many = each starved below the ~$25/day floor. Report per-ad daily spend + health tier (< $25 Too Thin / $25-49 Watch / >= $50 Healthy).
2. **Format mix:** spend, % of total, ad count per format. Classify ads by real `adFormat`, never by campaign/ad-set name (a campaign named "TLA" may hold image ads).
3. **Deal influence by format** (CRM only): influenced deals/pipeline per format; name formats punching above their spend share. Quarantine test/sandbox deals (dev-org URLs, placeholder names, mismatched company, round outsized amounts) so they never inflate pipeline. No CRM: skip and note it.
4. **Benchmark grade per format:** CTR, raw CPC, effective CTR to LP, effective CPC to LP (cost / landing-page clicks), CPM vs the medians in `clusters/paid-ads/reference/benchmarks.md`, mark pass/fail per metric. **Link-driving formats (image, carousel, video) are graded on effective CPC to LP, not raw CPC.** TLAs get both. No-link TLAs and document/lead-gen ads: "n/a (no link)", never a failure; Lead Gen Forms judged on cost per lead.
5. **Reallocation:** current spend-share vs where value is (best effective-CPC-to-LP + deal influence, led by TLAs); recommend concrete dollar moves.
6. **Campaign trends:** period-over-period deltas (impressions, engagements, clicks, spend, CPC, CPM, CTR); verdict: increasing efficiency (more output, flat spend) or decreasing; top campaign by pipeline; explain any CTR spike/drop by naming the ad behind it.
7. **Ad insights:** best/worst ads by clicks; TLA effective CTR + effective spend; **decaying ads** = weekly CTR down 3 weeks running OR below format pause threshold after 1,000+ impressions (TLA ~1.8%, image ~0.30%, carousel ~0.21%, document ~0.20%, video ~0.16%).
8. **Red flags / green flags** (3-6 each, every item names the culprit/winner + metric + fix; vague flags are useless): decaying ads; efficiency drop; spend spike without output; too many ads for budget; impression hogs (one account eating a lopsided impression share, only when genuinely disproportionate: cap or exclude); deals on accounts ads never touched (coverage gap: add to targeting); format mis-allocation (weak formats funded, TLAs starved); below-benchmark core metric. Green: top performers to scale/clone; formats punching above spend share; accounts surging or newly Interested (route to sales now); improving efficiency.
9. **Company trends:** top 5-10 engaged accounts to pursue, surging accounts, first-time-reached, moved-to-Interested, impression hogs.

## Output format

Scorecard (spend, ads live, CPC, CPM, CTR, effective cost per LP click, each vs benchmark, pass/fail) -> ad-count verdict -> budget-by-format -> deal influence -> benchmark grade table -> reallocation with dollar moves -> campaign trends -> ad insights -> red/green flags -> accounts to go after -> **fix list: the 3-5 highest-leverage actions, ranked**. Keep the audit proportional: a two-ad account does not need impression-hog analysis. All recommendations directional.

## Pass criteria

- Every graded metric has its benchmark next to it
- Link formats graded on effective CPC to LP
- Every flag names campaign/ad/account + metric + fix
- No fabricated data anywhere; missing sections deleted, not left empty
- Fix list is ranked and specific

## Deeper knowledge

- Meta account health: run the decision tree in `clusters/paid-ads/knowledge/meta-operating-system.md` (Stage 1 delivery, Stage 2 quality, kill/optimize/scale) instead of the LinkedIn grading in steps 4-7.
- Benchmarks: `clusters/paid-ads/reference/benchmarks.md`
