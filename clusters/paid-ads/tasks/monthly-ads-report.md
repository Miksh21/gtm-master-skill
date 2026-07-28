> Source: swan-gtm/gtm-skills (emilia-korczynska) · MIT · imported 2026-07-28 · external content, unreviewed

# Task: Monthly Ads Report (stakeholder recap, last calendar month)

A month-end LinkedIn/paid-ads performance report for a stakeholder/exec audience: what happened, what moved vs the prior month, what worked, what to do next. A report, not an audit: summarize and recommend; save fix-list forensics for `audit-ads-account.md`.

## When to use this

"Monthly report", "end-of-month ABM report", "recap last month's campaigns", "stakeholder/exec ads report", "month-over-month summary".

## Inputs required

- **Window = the last FULL calendar month** (not trailing 30 days); prior calendar month as comparison. Compute explicit start/end dates from today and state them; let the user override to a specific month.
- Account totals both months, per-format performance, best ads, campaigns, deals/pipeline (CRM), engaged companies. No CRM = skip the revenue section entirely and note that connecting one unlocks it; never invent pipeline.

## Process

1. Compute for both months: pipeline generated, deals open/influenced, total spend; top ABM and top platform campaign (by pipeline/deals, then clicks/efficiency); top formats + spend share per format graded vs benchmark; top ads by clicks/LP clicks; top engaged companies; month-over-month deltas on spend, impressions, engagements, clicks, CPC, CPM, CTR, pipeline; verdict: improving / steady / declining efficiency.
2. Apply the shared grading rules: link-driving formats graded on effective CPC to LP; ads classified by real adFormat, not campaign name; test/sandbox CRM deals quarantined.
3. Show headline numbers to the user for a sanity-check before writing the full report.

## Report structure (in order)

1. **Executive summary:** stat cards (pipeline, deals open, spend, each with MoM delta); top campaigns; top formats + spend per format; top ads; top engaged companies as bold bullets; short narrative + 2-4 recommendations.
2. **Revenue, pipeline, deals** (CRM only): influenced pipeline, deal list with amounts + touching campaigns, pipeline-per-$, ROAS.
3. **Ad spend:** spend-by-format chart + explicit verdict: good allocation or reallocate, naming over/under-funded formats and the recommended split.
4. **Campaign performance:** every active campaign with impressions, clicks, engagements, spend, CTR, CPC + MoM change; best/worst, best campaign type.
5. **Ad performance by format:** CTR, raw CPC, effective CTR-to-LP, effective CPC-to-LP, CPM per format, each graded vs benchmark; include the full per-format benchmark table from `clusters/paid-ads/reference/benchmarks.md` so the reader sees where each format should land.
6. **Top engaged companies:** ~15 with impressions/clicks/engagements/ABM stage; highlight companies with 3+ clicks in the month as a strong buying signal, flag likely-Interested, best candidates to route to sales.
7. **Next steps for next month:** scale winners, reallocate off losers, creatives to refresh, accounts to route to sales.
8. Directional-figures disclaimer.

Each section gets a short explanatory paragraph plus its data; write for a stakeholder who wants why, not only what.

## Pass criteria

- Calendar-month boundaries correct and stated in the title
- Every format grade has its benchmark next to it; effective-to-LP rule applied
- No invented numbers; missing data sections removed, not empty
- Ends on the forward-looking action list
- Report-toned throughout (no fix-list forensics)
