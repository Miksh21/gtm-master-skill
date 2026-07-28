# Content Marketing Benchmarks and Reporting Formulas

> Source: swan-gtm/gtm-skills (ryan-estes, thomas-marcelle, sam-dunning, victor-moen) · MIT · imported 2026-07-28 · external content, unreviewed

Numbers, thresholds, and reporting formulas across newsletter, creator, SEO, and affiliate work. All third-party network figures; treat as planning anchors, calibrate to own data as soon as it exists.

## Newsletter performance reporting (Beehiiv-specific but generalizable)

The goal: a report a non-technical stakeholder (sponsor, client, owner) reads in under a minute and still trusts. API base: `https://api.beehiiv.com/v2/publications/{pub_id}/...`, Bearer auth, cursor-paginate every list endpoint until `has_more` is false.

### The click-rate trap (the most common wrong report)

Beehiiv's `stats.email.click_rate` is **click-to-open** (clicks ÷ opens), NOT clicks-per-delivered. The two differ by 2-4×. If the question is "what fraction of the send clicked," compute `unique_clicks / delivered` yourself. Clients used to the Beehiiv dashboard expect the larger click-to-open number; a defensible default is compute both and display the larger:

```
clickToOpenRate  = uniqueClicks / uniqueOpens * 100
clicksPerDeliv   = uniqueClicks / delivered * 100
displayClickRate = max(clicksPerDeliv, clickToOpenRate)
```

`open_rate` from the API is already unique-opens/delivered; use as-is. Compute `deliveryRate = delivered / recipients` yourself.

### Other API traps

- **Polls**: the `poll_responses` expand on a poll GET caps at 10 responses and cannot paginate; any poll with >10 votes silently under-reports. Cursor-paginate `/polls/{id}/responses` and tally `poll_choice_id` client-side.
- **No subscriber location data exists.** Never build or fake a geographic view.
- **"Who clicked this sponsor link" is not a clean API call.** Build a click-behavior segment in the dashboard, export CSV periodically, enrich offline (email domain → company/industry category via heuristic or LLM pass; expect a real "uncategorized" bucket). Periodic semi-manual step, not part of a live refresh.
- **Growth series modes are not interchangeable**: `per-issue` (one point per post's recipients; roughly monotonic by construction, understates churn; fine once full history has issue tracking) vs `subscriber-timeline` (hand-curated periodic snapshots of active-subscriber count; can decline, which is the point; use for pre-migration history). Never silently switch modes mid-history.

### Engagement segmentation

Over the full paginated subscriber list with stats. List health (ALL subscribers): active / inactive / invalid. Engagement segments only over active subscribers with `total_received >= 3` issues (else fresh imports read identically to dead subscribers), bucketed by lifetime open rate:

| Segment | Lifetime open rate |
|---|---|
| Superfan | ≥ 80% |
| Loyal | 50-80% |
| At-risk | 20-50% |
| Dormant | < 20% |

Two different denominators (engaged base vs all subscribers); never conflate in one chart. State the "as of" date and threshold in the caption.

### Report anatomy (9 sections)

1. Hero stats: total growth since launch, current audience (with launch figure for contrast), average open rate over a stated window. Three numbers, no chart.
2. Website/lead-magnet links.
3. Audience growth chart (full history, growth badge, mode per above).
4. Open-rate analysis: per-issue bar chart + the load-bearing narrative block **question / verdict / 2-4 evidence points with numbers / one opportunity**.
5. Click-rate analysis: same structure.
6. Audience insights: engagement donut + list-health bar.
7. Month-over-month tabs: synopsis (headline, highlights, opportunities), rollups, issues. Rollups group by publish month: peak audience = max recipients; avg open/click rate = simple unweighted average (an issue to 500 counts equal to one to 50,000; weight by recipients only if answering "what share of all sends was opened"); total unsubscribes = sum.
8. Engaged-reader export: distinct clickers + distinct companies (unique non-personal email domains), CSV export, category chart.
9. Per-issue KPI cards: recipients, delivered, delivery rate, open rate, display click rate, unsubscribes, spam reports (show "0 spam" explicitly, don't omit).

Render nothing for sections with no backing data; never placeholder states.

### Automated refresh pattern

Split two jobs with different reliability bars: **deterministic data** (stats, rollups, poll tallies, segments, growth appends) in plain code, never an LLM (a model asked to "compute poll results" stops at the first page and silently under-reports); **generated narrative** (headlines, highlights, rate-analysis prose) is the one LLM-appropriate part, scoped to only the period whose numbers changed, matching existing tone and length. Wholesale regeneration produces tonal drift and unreviewable diffs. Multi-tenant: a registry (slug, data location, env-var NAMES for creds, growth mode, per-report notes); per-entry failure isolation so one broken credential never blocks other reports. Flow: pull latest → reconcile posts (refresh matured numbers, insert new chronologically) → recompute affected rollups → append growth → deterministic scripts → scoped narrative → validate (schema + content lint) → abort entirely on failure, never partially ship → commit only if something changed. Idempotent: a rerun with no new data produces zero diff.

## Creator marketing numbers (source-author network data, B2B LinkedIn, EUR)

| Metric | Value |
|---|---|
| Flat fee per post: micro expert (2K-10K) | €80-200 |
| Flat fee per post: mid-tier expert (10K-80K) | €200-600 |
| Flat fee per post: macro anchor (80K+) | €800-2,500 |
| CPC (qualified click) network range | €1.90-2.90; baseline ~€2.30-2.40 |
| LinkedIn Ads per-click, B2B SaaS (comparison) | €8-15+ |
| Creator campaign CPL | ~€15-25 mid-market (network median ~€18) |
| LinkedIn Ads CPL (comparison) | €55-90 |
| Employee-advocacy CPL | €40-80 |
| Creator post CTR (aligned audience) | ~8-14% |
| Sponsored-content CTR (comparison) | <1% |
| Employee-advocacy CTR | ~1-2% |
| Click → opportunity rate (planning band) | 3-6% |
| Click → SQL composite | ~3.4% |
| MQL → SQL | ~35-45% |
| Median time-to-MQL, creator-sourced click | 9-14 days (ads: 2-4) → use a 14-30 day attribution window |
| View-through incremental traffic | 8-15% (never credits to the post) |
| Founder saturation point | ~15-25K followers |
| Personal account vs company page reach | 3-5× |
| Outbound reply rate referencing a founder post | ~40% vs ~5% cold |
| Founder inbound at 3-5 posts/week | 5-25 demos/month |
| Week-one health gates | CTR ≥ 8% · LP bounce < 55% · form completion ≥ 10% of clicks |
| Qualified click definition | tracked AND ≥30 s on-site |
| Sponsored post length | 800-1,400 characters, 4-6 paragraph breaks |
| LinkedIn feed hook truncation | ~210 characters |
| Authentic vs ad-sounding post engagement | 3-5× (single specific CTA: 2-3× vs generic/multiple) |

## SEO thresholds (topic pipeline)

| Threshold | Value |
|---|---|
| Volume floor, general keywords | ≥ 50/mo global |
| Volume floor, named competitor alternatives/pricing/reviews | ≥ 20/mo (high intent at any volume) |
| Candidate-pool floor before SERP qualification | 100 keywords |
| Ranking feasibility "easy" | KD ≤ 40 + visible beatable gap |
| Ranking feasibility "mid" | KD 41-65 |
| Ranking feasibility "hard/locked" | KD 66+ |
| Effort bands | update/LP < 1,200 w · new page 1,200-2,500 w · long-form 2,500+ w |
| Priority score | 6 dimensions × 1-3; Tier 1 ≥ 14, Tier 2 10-13, Tier 3 ≤ 9 |
| Freshness opening | top results stable 2+ years with no updates |
| Escalating SERP | everything published/updated in the last 6 months |

## Affiliate program numbers

| Metric | Value |
|---|---|
| Allowable CAC | LTV × (1 / target LTV:CAC), e.g. $8,000 LTV at 4:1 = $2,000 |
| Aggressive flat CPA (strong unit economics) | up to 100-200% of first-month revenue |
| Revshare cap | 12 months |
| Cookie window | ≥ 90 days, always longer than the sales cycle |
| Industry partner activation | under 5% |
| Good onboarding activation target | 30-40% within 30 days |
| Revenue concentration | top 20% of partners ≈ 80% of revenue |
| Audit cadence | twice a year |
| Super-affiliate threshold (warm-intro tier) | capable of $50K+/month |
