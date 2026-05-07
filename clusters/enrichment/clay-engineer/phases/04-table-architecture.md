# Phase 4 — Table Architecture

How to decide the right number of tables and how they connect.

---

## The Foundational Principle — Gates Before Credits

**Never spend a credit on a row you are going to discard.**

The correct order for every workflow:
1. **Free gates first** — ICP qualification (formula column or Claygent), blocklist check (CRM lookup), classification formula — all free
2. **Cheap enrichment next** — conditional on passing the free gates
3. **Expensive enrichment last** — only on rows that have passed every prior gate
4. **Export last** — CRM create/update, Instantly push, HeyReach push — only on fully qualified and enriched rows

---

## The Standard 2-Table Architecture — Table A + Table B

For most multi-segment outbound campaigns:

**Table A — Company Qualification**
- Source: database import or Clay Find Companies
- Steps: Claygent ICP qualification, company-level enrichments (tech stack, signals, etc.)
- Output: qualified companies with sub-industry classification and headcount

**Table B — Contact Finding + Export**
- Source: qualified companies from Table A (filtered by qualification result)
- Steps: Find People contact finding, email waterfall, personalisation enrichments, push to Instantly/HeyReach

---

## Multi-Segment Architecture — Ask First, Then Reason

**Never assume the table structure upfront. Ask these 3 questions:**

1. "What are the segments in this campaign — sub-industry, headcount tiers, geography, or a combination?"
2. "For each segment: does the difference change **WHO** you're targeting (different buyer persona, different titles), or just **WHAT** you're saying (same buyer, different copy angle)?"
3. "What are the target job titles for each segment?"

---

## Reasoning Framework — Table A

Table A qualifies companies. Almost always one Table A covers all segments.

- Claygent qualification prompt is the same regardless of sub-industry or headcount tier
- Headcount is already baked into the database export filters before import
- Sub-industry output comes from Claygent's classification column

One Table A unless a segment genuinely requires a completely different qualification approach (this is rare — always challenge the assumption before splitting).

---

## Reasoning Framework — Table B

Table B finds contacts. **Find People is a table-level source — it is configured once per table with one fixed title list.** This is a hard constraint. You cannot run different Find People searches conditionally within the same table.

**The key question: does any segment require a different title list?**

What drives title differences:
- **Headcount** almost always drives title differences. A 11-50 company has a CTO or technical co-founder. A 51-200 company has a VP Engineering or Head of Engineering. Same product, same industry — different org structure, different buyer.
- **Sub-industry** rarely drives title differences. Usually changes what you say, not who you say it to. Ask: "Is the buyer persona genuinely different in this sub-industry, or is it the same person with different context?" If same person — one Table B is fine.
- **Product type matters.** An API product has an engineering buyer regardless of industry. A compliance product might have a different buyer across two adjacent verticals.

**If titles are the same across all segments** → one Table B. Use multiple conditional sending steps to route contacts to the right campaigns.

**If titles differ across segments** → separate Table B per segment. A broad title list covering all segments is not acceptable — it reduces targeting precision and pulls contacts you would never send to.

**When in doubt, present both options to the user with the trade-off — do not silently pick one.**

---

## Multiple Sending Steps — One Table, Multiple Campaigns

A single Clay table can have multiple "Add lead to campaign" steps (Instantly or HeyReach), each routing to a different campaign with its own conditional run.

**Example pattern — sub-industry routing:**
- Sending step 1 → Campaign A (Sub-industry A)
  `Run if ICP Qualification is "Sub-industry A" OR ICP Qualification is "Sub-industry A & B"`
- Sending step 2 → Campaign B (Sub-industry B)
  `Run if ICP Qualification is "Sub-industry B" OR ICP Qualification is "Sub-industry A & B"`

A contact tagged as both sub-industries gets pushed to both campaigns. Flag this with the user upfront.

**Hard rule — campaign-specific enrichments:**
Every enrichment that generates a personalisation variable used only in one campaign must carry the exact same conditional run as that sending step. Never run a campaign-specific enrichment on rows that will never reach that campaign.

---

## Data Unification — Always Merge Multiple Sources Into One Column

**Whenever the same data point can come from multiple enrichment steps, you must unify them into one formula column before any downstream step uses it.**

**The pattern:**
1. Source A → output to `LinkedIn URL (from Social URLs)`
2. Source B → output to `LinkedIn URL (from Web Research)` — conditional: only runs when Source A is empty
3. Formula column: `LinkedIn Company URL` (free) → `IF LinkedIn URL (from Social URLs) is not empty THEN output it OTHERWISE output LinkedIn URL (from Web Research)`
4. All downstream steps reference `LinkedIn Company URL` only

This applies to: LinkedIn URL from multiple finders, email from waterfall (already handled natively), phone from multiple providers, any multi-source data point.

---

## Auto-Dedupe Settings

**Keep oldest row** — Use for one-time list builds, static campaigns. New duplicate incoming → new row deleted, existing row stays. Enrichments do NOT re-run.

**Keep newest row** — Use for live data refreshes where source data changes (e.g. Salesforce live list). New duplicate incoming → old row deleted, new row replaces it. Enrichments run fresh on new row.

**Keep newest row + Keep existing results combination ():**
This is the correct setup for live data refresh campaigns:
- Keep newest row → brings in updated updated data on each sync
- Keep existing results → prevents paid enrichments from re-running on refreshed rows
- Formula columns (free) always recompute from updated source fields
- Paid steps only run when their output column is empty → once per contact per campaign qualification

---

## Multi-Table Patterns for Specific Problems

### Pattern 1 — Contact Scoring (Enterprise, 1,000+ employees)

**Problem:** Clay's "Find Contacts at Company" randomly selects only 10 contacts. For enterprise companies with 20-100+ matching contacts, you miss the most important decision makers.

**3-table solution:**

**Table 1 — Company Table:**
Source, qualification, CRM company lookup/create, Find Contacts at Company → "Save results in new table" (sends ALL contacts)

**Table 2 — Contact Table 1 (Raw):**
All contacts land here → immediately trigger "Send Table Data" to push all rows to Table 3

**Table 3 — Contact Table 2 (Scoring):**
Enable auto-dedupe by domain → Run "Lookup Multiple Rows in Other Table" → reference Table 2, match by domain → groups all contacts from same company → Run Claygent (Create or Modify Content) on grouped cell → identify top 5-10 decision makers → Email Finder → CRM Contact Lookup/Create

**When to use:** Companies with 1,000+ employees where you need the most senior decision makers, not a random sample.

### Pattern 2 — Post Content Fetching (LinkedIn Engagement)

**Problem:** Multiple engagors react to the same LinkedIn post. Running Claygent Web Research on every engagor row multiplies credits unnecessarily.

**2-table solution:**

**Table 1 — Posts Table:**
Deduplicate by Post URL (one row per unique post) → Run Claygent Web Research ONCE per post

**Table 2 — Engagors Table:**
One row per engagor → Run "Lookup Row in Other Table" → reference Table 1, match by Post URL → pulls post content into each engagor row without re-running Claygent

---

## Clay 50k Row Limit — Hard Constraint on Every Table

**Clay has a hard limit of 50,000 rows per table. This constraint must be accounted for before designing any workflow architecture.**

### Rules

- **Estimate row count before speccing.** For every Table A and Table B, estimate how many rows will land in it based on the database filters and contact volume.
- **If a single pull is expected to exceed 50k rows, split it across multiple tables.** Never design a table that will hit the cap mid-enrichment — rows over the limit are silently dropped.
- **Table A (companies):** If the ICP filters across all tiers + geographies are expected to return more than 50k qualifying companies, split by segment — separate Table A per industry group, per tier, or per geography as needed.
- **Table B (contacts):** If the number of contacts across all companies in a segment is expected to exceed 50k, split by tier or persona group. A T1-only Table B and a T2-only Table B is a common pattern for large TAMs.
- **No hard rule on how to split** — the right split depends on the specific pull. The principle is: every table must stay under 50k rows. Design the split so that each sub-table has comfortable headroom below that limit.

### How to Estimate Before Building

1. Run the database pull with your filters — check the result count before importing into Clay
2. Estimate contacts per company × number of qualifying companies = expected Table B rows
3. If either number is near or above 50k — split before importing

---

## Table Settings — Key Settings for Every Production Table

Always enable on production tables:
- **Keep existing results** — only errored, empty, or new cells run. Existing results preserved. Critical for cost control.
- **Auto-dedupe** — configure the right dedupe column (LinkedIn URL, Work Email, or Domain) and keep vs newest logic

Table-level auto-update: ON by default. Column-level auto-update: individual control per column.

**Scheduling:** CRM list imports can be scheduled from table settings. Minimum schedule: 1 day. For real-time processing (time-sensitive signals), use webhook source instead — CRM import cannot achieve same-day processing.
