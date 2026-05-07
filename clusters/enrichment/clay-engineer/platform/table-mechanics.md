# Clay Table Mechanics

## Table Sources — How Data Gets In

- CSV import
- CRM import (HubSpot, Salesforce)
- Webhooks — real-time data from any tool
- Find People — search by title, company, location
- Find Companies — search by industry, headcount, location, tech stack
- Find Jobs — track job postings by title, keyword, location
- Signals — monitor job changes, promotions, new hires, website visitors

**Table limits:** 50,000 rows max per table across all plans. Clay imports up to the limit and stops with no error message — always estimate row count before running large lists.

**Table Settings access:** via the table name dropdown (top-left for tables, bottom navigation bar for workbooks).

---

## Auto-Dedupe

Continuously monitors a specified column and deletes duplicate rows automatically.

- Dedupe field: any column (LinkedIn URL, Work Email, Domain — choose the most reliable identifier)
- **Keep oldest row** — new duplicate incoming → new row deleted, existing row stays, enrichments do NOT re-run
- **Keep newest row** — new duplicate incoming → old row deleted, new row replaces it, enrichments run fresh on new row
- Rows with blank cells or values over 200 characters are excluded from deduplication

**When to use Keep oldest row:** one-time list builds, static campaigns — process once, prevent re-processing

**When to use Keep newest row:** live data refreshes where source data changes (e.g. Salesforce live list with evolving signal fields) — ensures updated rows are picked up on each sync cycle

**Keep newest row + Keep existing results combination ():**
This is the correct setup for live data refresh campaigns. Keep newest row brings in updated updated data on each sync. Keep existing results prevents paid enrichments from re-running on the refreshed row. Formula columns (free) always recompute from the updated source fields. Paid steps (email validation, Claygent, sequencer push) only run when their output column is empty — meaning they run once per contact per campaign qualification.

---

## Auto-Update (Run Settings)

### Table-level auto-update (master switch)
- ON: enrichments run automatically when rows are added or edited
- OFF: must manually click cells to trigger enrichments
- Default: ON

### Column-level auto-update
- Controls whether a specific column runs automatically
- Only active when table-level auto-update is ON
- Table OFF → no columns run regardless of column setting
- Table ON + column OFF → that column skips auto-run
- Table ON + column ON → column runs automatically ✓

### Keep existing results
Checkbox under Run settings.
- When enabled: only errored, empty, or new cells run
- Existing results are preserved — enrichments do not re-run on rows that already have output
- Critical for cost control on live/evergreen tables — prevents re-spending credits on already-processed rows
- **Always enable this on production tables**

### Re-run columns on a schedule
- Select specific columns to re-run periodically
- Useful for columns that need to stay current (e.g. email validation, job title)
- Leave OFF for most columns — use Keep existing results instead

---

## Update Existing (CRM Import Source)

For tables with scheduled Salesforce or HubSpot imports. Controls whether scheduled runs update existing rows.

- **Net New (OFF)** — only processes newly added records, skips existing rows. Lower credit usage.
- **All (ON)** — re-runs enrichments on all rows including existing ones on each scheduled sync. Use for ongoing data hygiene.

**For live data refreshes:** set to Net New. Combined with Keep newest row auto-dedupe, Salesforce brings in updated contacts as "new" rows — deduplication handles the rest.

---

## Auto-Delete (Passthrough Tables)

**Enterprise plan only. Webhooks as source only — does not apply to CRM imports or CSVs.**

Passthrough tables process incoming webhook data, enrich it, forward it to a destination, then automatically delete the row. Designed for high-volume pipelines that would otherwise hit row limits.

How it works:
1. New row arrives via webhook
2. Clay runs all enrichments
3. After 60-second review interval — rows exceeding 5,000 threshold with completed enrichments are forwarded to destination
4. Rows deleted after confirmed transfer

Enable via: bottom navigation panel → Enable auto-delete → Automatic Row Deletion

**Not applicable for Salesforce/HubSpot list import workflows** — those use scheduled sync, not webhooks.

---

## Scheduling (CRM Import)

Salesforce and HubSpot list imports can be scheduled from table settings.

**Minimum schedule: 1 day.** Clay cannot sync CRM lists more frequently than once per day. Real-time processing for time-sensitive signals (e.g. website visitors) requires a webhook source instead — the CRM import path cannot achieve same-day processing.

---

## Table Filters — Hiding Rows Before Enrichment

Clay tables have a built-in filter feature that hides rows from the table view. **Enrichments do not run on filtered-out rows — no credits are spent.** This is the correct way to exclude rows that fail a data quality check (like headcount verification) instead of using a formula column gate.

**Access:** Click the **Filter** button in the table toolbar → **+ Add filter**

### Filter Structure — 3 Fields Per Row

Each filter row has 3 fields:

| Field | What it does | Example |
|---|---|---|
| **Column** (left dropdown) | Which column to filter on | `Linked In Employee Count` |
| **Logic** (middle dropdown) | The comparison operator | `greater or equal to` |
| **Value** (right input) | The target value | `10000` |

### Stacking Multiple Filters

Click **+ Add filter** to add another row. Each additional row starts with an **And/Or** toggle:
- **And** — both conditions must be true (intersection)
- **Or** — either condition can be true (union)

Use **+ Add filter group** for complex nested logic (AND groups within OR groups or vice versa).

### Logic Options by Column Type

**Number columns** (headcount, funding, scores):
- `greater than`
- `greater or equal to`
- `less than`
- `less or equal to`
- `equal to`
- `is not equal to`
- `is empty`
- `is not empty`

**Text columns** (name, industry, country, domain):
- `is`
- `is not`
- `contains`
- `does not contain`
- `starts with`
- `ends with`
- `is empty`
- `is not empty`

### Primary Use Case — Headcount Verification After LinkedIn Scrape

When Clay Find Companies is the source, the LinkedIn headcount enrichment runs first to get exact employee counts. After it completes, apply table filters to exclude companies outside the tier's headcount range before any paid enrichment runs.

**IMPORTANT: Verify the column type is Number before applying the filter.** Claygent may return the employee count as a text column instead of a number column. If the column type is text, the filter logic dropdown will show text options (contains, starts with, etc.) instead of number options (greater than, less or equal to, etc.). Before applying the filter:
1. Click the column header → check the column type
2. If it shows as Text → change it to Number
3. Only then apply the headcount filter — the number logic options will now appear

**T1 example:**
```
Where | Linked In Employee Count | greater or equal to | 10000
```

**T2 example (range):**
```
Where | Linked In Employee Count | greater or equal to | 1000
And   | Linked In Employee Count | less or equal to    | 10000
```

**T3 example (range):**
```
Where | Linked In Employee Count | greater or equal to | 500
And   | Linked In Employee Count | less or equal to    | 5000
```

This replaces the formula column gate approach — filters are free, hide rows entirely, and prevent any enrichment from running on filtered-out rows.

### When to Use Filters vs Formula Columns

| Use filters when | Use formula columns when |
|---|---|
| Excluding rows from ALL downstream enrichments based on a data quality check (headcount, country, etc.) | You need the TRUE/FALSE output as a conditional run input for specific enrichments |
| The check is a simple comparison on one column | The logic combines multiple columns |
| You want to hide bad rows from the table view entirely | You want to keep all rows visible but gate specific steps |

**Filters and formula columns can be used together.** Filters hide obviously wrong rows first (e.g. headcount outside range). Formula columns gate subsequent enrichments on more complex conditions (e.g. ICP qualification result + headcount qualified + domain not empty).

### Key Rules

- **Always apply filters after the data is in the column** — filters evaluate existing data, they don't trigger enrichments
- **Filters are free** — no credits consumed
- **Filtered rows still exist in the table** — they are hidden, not deleted. Clear filters to see them again
- **Filters reduce the visible row count** — the toolbar shows filtered count vs total (e.g. "5,234/7,091 rows")

---

## Other Table Settings

- **Duplicate table** — copies sources only, not data
- **View Graph** — visualises enrichment dependencies and relationships
- **Change log** — tracks all table changes (who, when, what). Retention: 30 days (Launch/Growth), 180 days (Enterprise)
- **Share as template** — makes columns, input mappings, and first row visible to anyone with the link

---

## Enrichment Templates

Save groups of columns as reusable templates — avoids rebuilding the same workflow in every table.

1. Group columns by section (e.g. Email Waterfall, CRM Lookup, ICP Qualification)
2. Right-click the group name → **Save Template**
3. Reuse in new tables via **Add Enrichment → Templates**

**Recommended templates to save:**
- Email Waterfall (all email finder steps in order)
- CRM Company Lookup + create/update
- CRM Contact Lookup + create/update
- ICP Qualification formula columns
- Signal Qualification (Claygent content analysis steps)

---

## Clay Credits System

- Each enrichment action costs credits **only when it finds a result** (successful match)
- If a waterfall step finds nothing, you don't pay for that step
- Native integrations consume credits from your Clay plan
- API-connected integrations (own API key) consume credits from that tool's own plan — NOT from Clay credits

**Common Clay-native enrichment costs (per successful row):**

| Action | Cost |
|---|---|
| Clay Find Companies (source) | Free |
| Clay Find People (source) | Free |
| **Clay Enrich Company** (LinkedIn data — headcount, HQ, industry) | **1 credit** |
| **Clay Enrich Person** (LinkedIn data — title, employment history) | **1 credit** |
| Find Contacts at Company (max 10, random) | 1 credit per contact returned |
| Lookup Multiple Rows / Lookup Row in Other Table | Free |
| Formula columns | Free |
| Table filters | Free |
| Merge Columns | Free |

Always gate Clay Enrich Company / Enrich Person behind a free check (Claygent ICP qualification, formula column, or table filter) so you don't spend credits on rows you'll discard.

**Approximate plan pricing (annual billing, early 2026):**

| Plan | Monthly cost | Credits/month |
|---|---|---|
| Free | $0 | 100 |
| Starter | ~$134 | 2,000 |
| Explorer | ~$314 | 10,000 |
| Pro | ~$720 | 50,000 |
| Enterprise | custom | custom |

**Credit saving tips:**
- Always run ICP qualification (Claygent Web Research) before any paid enrichment
- Order waterfall from cheapest to most expensive
- Use conditional run formulas to skip rows that don't need enrichment
- Use auto-delete for webhook/signal tables to keep table size manageable

---

## Recipes & Claybooks

- **Recipes** — save enrichment sequences as reusable combinations, similar to templates but for entire workflow sequences
- **Claybooks** — interactive step-by-step guides for specific use cases (clay.com/claybooks)
- **Templates** — ready-to-use starting points (clay.com/templates)
