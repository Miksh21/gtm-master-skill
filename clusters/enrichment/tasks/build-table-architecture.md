# Task: Design Clay Table Architecture

Recipe for deciding how to structure Clay tables for a workflow: Table A (companies) vs Table B (contacts), when to split segments into separate tables, data unification across sources, auto-dedupe and auto-update settings.

## When to use this

User asks to "design Clay tables", "how should I split this list", "do I need one table or two", "should I run all segments in one table", "set up auto-dedupe", or you're at phase 04 of `tasks/build-clay-workflow.md`.

## Inputs required

- List composition (one segment or multiple, e.g. fintech vs SaaS vs manufacturing)
- Whether the user wants to track signals over time (live refresh) or run a one-shot build
- Destination: one Instantly campaign or several? One HubSpot list or multiple?
- ICP qualification logic — does it return a single category or multiple sub-industries?

## Process

### 1. Decide one table or two (Table A / Table B split)

**One table (combined Companies + Contacts):**
- Small list (< 1,000 companies)
- One contact per company (e.g. CEO only)
- No company-level filtering needed before contact-finding

**Two tables (Table A → Table B):**
- Larger list, or multiple contacts per company
- Want to qualify and enrich companies first, then build contacts only for qualified companies
- This is the standard pattern for most GTM workflows

In a Table A → Table B setup: Table A holds qualification + company-level enrichments. Table B is built from Table A's qualified rows (via Find People scoped to those companies, or webhook from Table A on qualification = "Yes").

### 2. Decide single-table or multi-segment-split

If your list spans **clearly distinct sub-industries** (e.g. fintech + retail + manufacturing) and each segment will get **different copy** in Instantly:

**Option A — One table, multiple sending steps:**
- One ICP qualification Claygent that outputs the segment label ("Fintech", "Retail", "Manufacturing", or "No")
- One personalization enrichment per segment, each with conditional run gated on segment label
- One Instantly Add Lead to Campaign step per segment, each gated on the matching segment label
- Pros: single source of truth, easier to audit
- Cons: table gets wide; one Claygent prompt has to qualify across all segments

**Option B — Separate tables per segment:**
- One Clay Find Companies pull per segment (industry filter applied at source)
- Independent ICP qualification per table — simpler, more accurate prompts
- Different personalization variables per segment — no need for cross-segment formula gymnastics
- Pros: cleaner prompts, easier to iterate per segment
- Cons: 3× the tables to maintain

**Default recommendation:** Option A unless segments require fundamentally different enrichment paths (e.g. fintech needs Crunchbase funding, retail needs SEMrush traffic — these don't apply to each other). Then Option B.

### 3. Set up auto-dedupe

| Mode | When to use | Effect |
|---|---|---|
| **Keep oldest row** | One-shot list build, static campaign | Incoming duplicate is deleted; existing row stays; enrichments do NOT re-run |
| **Keep newest row** | Live refresh (e.g. Salesforce sync, recurring signal pull) | Incoming duplicate replaces existing; enrichments re-run by default |

**Live refresh combo:** `Keep newest row` + `Keep existing results` — refreshed rows pull updated source data, but paid enrichments only re-run on rows where their output column is empty. Formula columns always recompute. This is the production-safe setup for evergreen workflows.

Pick the most reliable column as the dedupe key:
- Contacts: LinkedIn URL > Work Email > Full Name + Domain
- Companies: Domain > LinkedIn Company URL > Company Name

### 4. Wire data unification

Whenever the same data point can come from **multiple enrichment sources** (e.g. job title from both Apollo and Enrich Person), **unify into one formula column before any downstream step uses it.**

Pattern:
- Source A runs first (cheaper / more accurate for your ICP)
- Source B runs conditionally — `Run if [Source A output] is empty`
- Formula column outputs whichever is not empty: `IF [Source A] is not empty THEN output [Source A] OTHERWISE output [Source B]`
- All downstream steps reference the formula column only — never the raw enrichment columns

Apply this to: job title, company description, headcount, industry, LinkedIn URL — anywhere two enrichments could populate the same logical field.

### 5. Apply table filters (free) before enrichment columns (paid)

Filters hide rows entirely — enrichments don't run on filtered rows, no credits spent. Use filters for:
- LinkedIn headcount range gates (after the headcount verification Claygent)
- Country / region exclusions
- Stage cutoffs (e.g. exclude rows where ICP Qualified = "No" before any contact-finding runs)

## Output format

```
TABLE ARCHITECTURE: [workflow name]

STRUCTURE
- Table A: [purpose, source]
- Table B: [purpose, source from Table A]
- Segment split: [Option A combined / Option B separate, justification]

DEDUPE
- Table A dedupe key: [column], mode: [Keep oldest / Keep newest]
- Table B dedupe key: [column], mode: [Keep oldest / Keep newest]
- Keep existing results: [ON / OFF, reason]

FILTERS APPLIED
- Table A: [LinkedIn headcount range / country filter / etc.]
- Table B: [...]

DATA UNIFICATION FORMULAS
- {Job Title} = IF Apollo Job Title not empty THEN Apollo Job Title OTHERWISE Enrich Person Job Title
- {Company Description} = ...
- (one row per logical field that has > 1 source)

AUTO-UPDATE
- Table A auto-update: [ON / OFF]
- Table B auto-update: [ON / OFF]
- Per-column overrides: [if any]
```

## Pass criteria

- Every multi-source field has a unification formula column; downstream steps reference the formula column only
- Dedupe mode matches the workflow type (one-shot = Keep oldest; live refresh = Keep newest + Keep existing results)
- Filters applied for any free row-exclusion criterion before any paid enrichment runs
- For multi-segment Option A: every personalization step + every sending step has a conditional run gated on segment label

## Common failures

- **Forgetting Keep existing results on a live-refresh table** — every sync re-runs every paid enrichment on every row. Credit explosion.
- **Two sources writing to the same field, downstream step reads from one of them randomly** — unify first.
- **Splitting segments across tables when one combined table would do** — 3× maintenance burden for no gain. Only split when enrichment paths genuinely diverge.
- **Auto-dedupe key chosen poorly** — dedupe on Company Name when domain is more reliable; on Email when LinkedIn URL would catch more dupes.
- **Filters applied AFTER enrichment columns** — filter the row first, then enrich. Filters are free; enrichments cost credits.

## What to do after

- Build the column sequence per phase 05 → `clay-engineer/phases/05-enrichment.md`
- Wire the Sending Gate at the end → `tasks/design-sending-gate.md`
- Set the sequencer push → `tasks/push-to-sequencer.md`

## Deeper knowledge

- Full table architecture phase doc → `clay-engineer/phases/04-table-architecture.md`
- Auto-dedupe / auto-update / Keep existing results / scheduling → `clay-engineer/platform/table-mechanics.md`
- Multi-segment routing in detail → `clay-engineer/phases/04-table-architecture.md`
- Filter syntax + AI Filters → `clay-engineer/providers/databases/clay-find-companies.md`
