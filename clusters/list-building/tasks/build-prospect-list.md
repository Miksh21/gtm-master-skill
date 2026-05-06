# Task: Build a Prospect List End-to-End

Recipe for the full multi-source list-building workflow — from TAM identification to a clean, enriched, validated list of contacts ready for sequencing.

## When to use this

User asks to build a list, find prospects matching an ICP, run the full data research workflow, or assemble a campaign list from scratch.

## Inputs required

- ICP definition (reference `clusters/icp/tasks/build-icp.md` output)
- Target personas + roles
- Buyer signals to apply as filters (from `clusters/signals/tasks/map-signals-to-icp.md`)
- Tools available (Apollo, Sales Navigator, Clay, Blitz API)
- Target list size

## The 5-phase workflow

### Phase 1 — List building (multi-source)
1. Query Apollo via MCP with ICP firmographic filters. Pull all matching companies.
2. Query Clay (via MCP) for the same filters as cross-reference.
3. If Sales Navigator is available, run a third parallel query.
4. Merge all three lists, deduplicate by company domain.

### Phase 2 — ICP validation
5. For each company, run `clusters/icp/tasks/validate-against-icp.md` against their website
6. Remove non-fits. Flag borderline as Tier 2 for separate sequencing.

### Phase 3 — Signal enrichment
7. Apply `clusters/signals/tasks/detect-signals-from-list.md`
8. Tag each company with the relevant signal(s)
9. Sort: Tier 1 (ICP fit + signal) → Tier 2 (ICP fit, no signal) → drop non-fits

### Phase 4 — Contact finding
10. For Tier 1: find decision-makers matching personas via Clay/Apollo
11. Run email waterfall via `clusters/enrichment/tasks/run-email-waterfall.md`
12. Validate all emails before adding to list

### Phase 5 — Output
13. Produce two tables: company list + contact list with all enrichment data

## Output format

```
Data research run: [ICP / hypothesis name]
Date: [date]

SUMMARY
Companies sourced: [n] (Apollo: [n] / Clay: [n] / Sales Nav: [n])
After dedup: [n]
After ICP validation: [n] kept / [n] removed
After signal filter: [n] Tier 1 / [n] Tier 2

TIER 1 CONTACTS — ready for sequencing
[Table: Company | Domain | Signal | Contact Name | Role | Email | LinkedIn URL]

TIER 2 CONTACTS — ICP fit, no active signal
[Table: same structure]

Data quality: [% with verified email] | [% with LinkedIn URL]
Next step: [push to clusters/campaign-ops/tasks/setup-campaign-platform.md OR run more enrichment]
```

## Pass criteria

- Three sources merged (single-source = 30-40% off-ICP baseline)
- ICP validation applied to 100% (raw exports are 30-40% non-fit by default)
- Signal filter applied (this is what separates this list from a generic export)
- Tier 1 ≥ 50 contacts (if less, signal filters too narrow OR ICP too tight)
- Email verification rate ≥ 95%

## Common failures

- **Single source only** — Apollo alone misses 30-40% ICP fit, mostly non-US
- **Skipping ICP validation** — guarantees 30-40% wasted sends
- **Tier 1 + Tier 2 in same campaign** — they need different copy. Split.
- **Tier 1 < 50 contacts** — signal filters too narrow OR ICP too tight. Loosen one.
- **Skipping email verification** — bounces > 2% destroy sender reputation

## What to do after

- Tier 1 → `clusters/cold-email/tasks/write-first-email.md` with signal-led copy
- Tier 2 → `clusters/cold-email/tasks/write-first-email.md` with no-signal generic copy (different sequence)
- Both → `clusters/campaign-ops/tasks/setup-campaign-platform.md` to wire into sender
- Re-verify list after 30 days (22-30% annual decay)

## Deeper knowledge

- Sales Navigator boolean searches + filters → `knowledge/sales-navigator-guide.md`
- Lead source comparison + import methods → `knowledge/lead-sources-guide.md`
- 7-step beginner Clay pipeline → `knowledge/templates/beginner-workflow.md`
- ColdIQ qualification workflow + tier scoring + Clay AI prompts → `knowledge/templates/qualification-workflow.md`
- 62+ underused data sources by category → `knowledge/list-building-advanced/list-building-data-sources.md`
- 100+ industry-specific scraping directories → `knowledge/list-building-advanced/list-building-directories.md`
- ABM account selection + revenue reverse-engineering → `knowledge/abm/account-selection-framework.md`
