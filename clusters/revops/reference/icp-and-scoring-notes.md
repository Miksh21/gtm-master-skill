> Source: swan-gtm/gtm-skills (rutger-katz) · MIT · imported 2026-07-28 · external content, unreviewed

# ICP and Scoring: RevOps-Side Notes (deltas only)

Canon ownership: ICP building and validation live in `clusters/icp/` (build-icp.md, validate-against-icp.md, backtest method). Contact-level lead scoring lives in `clusters/lead-scoring/` (ICP fit 40 + signal 40 + persona 20 model). This file records only what rutger-katz's icp-builder and abm-engagement-scoring add that those clusters don't cover. Do not duplicate the canon here.

## Delta 1: Customer-count thresholds (ECP vs ICP)

Below a customer-count threshold you have an Early Customer Profile (a hypothesis), not an ICP. Thresholds by motion:

| Motion | Customers needed for a real ICP | Confidence |
|---|---|---|
| No-touch / PLG | ~160 | 95% |
| Low-touch | ~80 | 90% |
| Medium-touch | ~40 | 85% |
| High-touch / field | ~27 | 80% |
| Dedicated / named accounts | ~20 | 75% |

Below 8 comparable great customers: pure hypothesis, iterate quarterly and say so. Use this to calibrate how much confidence to put behind any ICP work in `clusters/icp/`.

## Delta 2: Seven-dimension ICP quality check

Quick audit rubric for an EXISTING ICP (each Strong / Adequate / Weak / Missing): 1 Specificity (criteria describing 50,000+ companies = fail), 2 Pain clarity (customer language, not "they need better visibility"), 3 Buying signals and timing (in-market triggers vs total addressable), 4 Customer count and evidence base (see thresholds above; ICP defined at a strategy offsite without customer input = fail), 5 Segmentation and motions (one definition covering €5K and €50K deals = fail), 6 CRM operationalization (ICP criteria as filterable fields + scoring; an ICP living only in a slide deck = fail), 7 Feedback loop (quarterly review fed by win/loss and CS health). Output: score table, the ONE constraint dimension, max three recommendations. Dimension 6 is the RevOps-specific addition: the ICP must exist as CRM fields or it doesn't operationally exist.

## Delta 3: ICP expansion sequencing

Expand a working ICP in phases, each with a trigger: Seed (1 ICP, 1 geo, 1 motion) → expand only at 50%+ win rate and 8-20 validated customers. Geo expansion (same ICP, new markets) → when TAM must grow 3-5x and win rate holds; pain language may not transfer across markets. New verticals → at 40%+ win rate in the new vertical with reference customers; each vertical needs its own qualification variant. Tier-up (enterprise) → at NRR >130% and customers demanding enterprise features; requires a new motion, longer cycle, higher price. Goldilocks check: ACV matches motion, 2-4 month cycle, proof depth achievable with 5-10 case studies.

## Delta 4: Account-level engagement scoring (ABM, 50-500 named accounts)

Different animal from `clusters/lead-scoring/` contact scoring: the unit is the ACCOUNT and its buying group. An engagement score answers "how confident am I that this account is in an active buying process, and have we reached the right people?" Intent without buying-group coverage is a false positive.

Signal weights (baseline for a 90-180 day cycle; persistent signals never decay, passive signals decay weekly/monthly, trailing 90-day window):

| Signal | Points | Decay |
|---|---|---|
| Meeting accepted | 20 | persistent |
| Demo request | 15 | persistent |
| Pricing/ROI page view | 10 | monthly 75% |
| Email reply | 10 | persistent |
| Whitepaper/case study, webinar | 5 | weekly 60% |
| Email click | 2 | weekly 60% |
| LinkedIn post engagement | 2 | weekly 60% |
| Website visit | 1 | weekly 50% |
| Ad click / impression | 1 / 0.2 | weekly |
| Email open | 0.5 | not counted (noise) |

Thresholds: 0-25 watchlist | 26-50 early, monitor | 51-100 warm (AE warm outreach, not SDR) | 101-150 hot: HANDOVER to sales IF buying-group coverage ≥50%, else marketing keeps qualifying | 150+ in-market, handover.

The handover gate is the point: score threshold AND buying-group coverage AND/OR a critical event, never volume or optimism. Vanity metrics (impressions, clicks, downloads) are marketing activity, not buying readiness; the only ABM metrics that matter are accounts with buying-group engagement, accounts handed over, opportunities created, closed revenue.
